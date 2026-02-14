import 'package:drift/drift.dart';
import 'package:proyecto_final/data/db/app_db.dart';
import 'package:proyecto_final/domain/entities/attendance_report.dart';
import 'package:proyecto_final/domain/entities/create_session_result.dart';
import 'package:proyecto_final/domain/entities/enrollment_with_student.dart';
import 'package:proyecto_final/domain/entities/session.dart';
import 'package:proyecto_final/domain/repositories/attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  AttendanceRepositoryImpl(this._db);

  final AppDb _db;

  @override
  Future<List<Session>> listSessionsByClass(int classId) async {
    final rows = await (_db.select(_db.classSessions)
          ..where((s) => s.classId.equals(classId))
          ..orderBy([(s) => OrderingTerm.desc(s.sessionAt)]))
        .get();
    return rows
        .map((r) => Session(id: r.id, classId: r.classId, sessionAt: r.sessionAt))
        .toList();
  }

  @override
  Future<CreateSessionResult> createSession({
    required int classId,
    required DateTime sessionAt,
  }) async {
    final targetDate = DateTime(sessionAt.year, sessionAt.month, sessionAt.day);
    final sessions = await listSessionsByClass(classId);
    final alreadyExists = sessions.any((s) {
      final d = DateTime(s.sessionAt.year, s.sessionAt.month, s.sessionAt.day);
      return d == targetDate;
    });
    if (alreadyExists) {
      return CreateSessionFailure(
        'Ya existe una sesión registrada para este día.',
      );
    }
    final id = await _db.into(_db.classSessions).insert(
          ClassSessionsCompanion.insert(
            classId: classId,
            sessionAt: sessionAt,
          ),
        );
    return CreateSessionSuccess(id);
  }

  @override
  Future<List<EnrollmentWithStudent>> listEnrollmentsWithStudentByClass(
      int classId) async {
    final query = _db.select(_db.enrollments).join([
      innerJoin(
        _db.users,
        _db.enrollments.studentUserId.equalsExp(_db.users.id),
      )
    ])
      ..where(_db.enrollments.classId.equals(classId) &
          _db.enrollments.droppedAt.isNull());

    final rows = await query.get();
    return rows.map((r) {
      final enrollment = r.readTable(_db.enrollments);
      final user = r.readTable(_db.users);
      return EnrollmentWithStudent(
        enrollmentId: enrollment.id,
        userId: user.id,
        name: user.name,
        lastname: user.lastname,
      );
    }).toList();
  }

  @override
  Future<Map<int, String>> getAttendanceBySession(int sessionId) async {
    final rows = await (_db.select(_db.attendance)
          ..where((a) => a.sessionId.equals(sessionId)))
        .get();
    return {for (final r in rows) r.enrollmentId: r.status};
  }

  @override
  Future<void> setAttendance({
    required int sessionId,
    required int enrollmentId,
    required String status,
  }) async {
    final existing = await (_db.select(_db.attendance)
          ..where((a) =>
              a.sessionId.equals(sessionId) &
              a.enrollmentId.equals(enrollmentId)))
        .getSingleOrNull();

    if (existing != null) {
      await (_db.update(_db.attendance)..where((a) => a.id.equals(existing.id)))
          .write(AttendanceCompanion(
        status: Value(status),
        checkInAt: Value(status == 'present' ? DateTime.now() : null),
      ));
    } else {
      await _db.into(_db.attendance).insert(
            AttendanceCompanion.insert(
              enrollmentId: enrollmentId,
              sessionId: sessionId,
              status: status,
              checkInAt: status == 'present'
                  ? Value(DateTime.now())
                  : const Value(null),
            note: const Value(null),
          ),
        );
    }
  }

  @override
  Future<QrMarkResult> markPresentByQR({
    required int sessionId,
    required int studentUserId,
  }) async {
    final sessionRow = await (_db.select(_db.classSessions)
          ..where((s) => s.id.equals(sessionId)))
        .getSingleOrNull();
    if (sessionRow == null) {
      return const QrMarkFailure('Sesión no encontrada');
    }

    final enrollmentRow = await (_db.select(_db.enrollments)
          ..where((e) =>
              e.studentUserId.equals(studentUserId) &
              e.classId.equals(sessionRow.classId) &
              e.droppedAt.isNull()))
        .getSingleOrNull();
    if (enrollmentRow == null) {
      return const QrMarkFailure('No estás inscrito en esta clase');
    }

    await setAttendance(
      sessionId: sessionId,
      enrollmentId: enrollmentRow.id,
      status: 'present',
    );
    return const QrMarkSuccess();
  }

  @override
  Future<AttendanceReport> getAttendanceReport(int classId) async {
    final sessions = await listSessionsByClass(classId);
    final enrollments = await listEnrollmentsWithStudentByClass(classId);
    final attendanceBySession = <int, Map<int, String>>{};
    for (final s in sessions) {
      attendanceBySession[s.id] = await getAttendanceBySession(s.id);
    }
    return AttendanceReport(
      sessions: sessions,
      enrollments: enrollments,
      attendanceBySession: attendanceBySession,
    );
  }
}
