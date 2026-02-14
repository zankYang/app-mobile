import 'package:drift/drift.dart';
import 'package:proyecto_final/data/db/app_db.dart';
import 'package:proyecto_final/domain/entities/course.dart';
import 'package:proyecto_final/domain/entities/enrolled_student.dart';
import 'package:proyecto_final/domain/repositories/classes_repository.dart';

class ClassesRepositoryImpl implements ClassesRepository {
  ClassesRepositoryImpl(this._db);

  final AppDb _db;

  @override
  Future<int> createClass({
    required int teacherUserId,
    required String name,
    required int capacity,
    required bool enrollmentOpen,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    return _db.into(_db.classes).insert(
          ClassesCompanion.insert(
            teacherUserId: teacherUserId,
            name: name,
            capacity: capacity,
            enrollmentOpen: Value(enrollmentOpen),
            startDate: Value(startDate),
            endDate: Value(endDate),
          ),
        );
  }

  @override
  Future<List<Course>> listOpenClasses() async {
    final rows = await (_db.select(_db.classes)
          ..where((c) =>
              c.enrollmentOpen.equals(true) & c.deletedAt.isNull()))
        .get();
    return rows.map(_classToCourse).toList();
  }

  @override
  Future<Course> getById(int classId) async {
    final row = await (_db.select(_db.classes)
          ..where((c) => c.id.equals(classId) & c.deletedAt.isNull()))
        .getSingleOrNull();
    if (row == null) throw StateError('Clase no encontrada: $classId');
    return _classToCourse(row);
  }

  @override
  Future<List<Course>> listClassesByTeacher(int teacherUserId) async {
    final rows = await (_db.select(_db.classes)
          ..where((c) =>
              c.teacherUserId.equals(teacherUserId) & c.deletedAt.isNull()))
        .get();
    return rows.map(_classToCourse).toList();
  }

  Course _classToCourse(ClassesData c) {
    return Course(
      id: c.id,
      teacherUserId: c.teacherUserId,
      name: c.name,
      capacity: c.capacity,
      enrollmentOpen: c.enrollmentOpen,
      startDate: c.startDate,
      endDate: c.endDate,
    );
  }

  @override
  Future<EnrollResult> enrollStudent({
    required int studentUserId,
    required int classId,
  }) async {
    final classRow = await (_db.select(_db.classes)
          ..where((c) => c.id.equals(classId) & c.deletedAt.isNull()))
        .getSingleOrNull();
    if (classRow == null) {
      return const EnrollFailure('Clase no encontrada');
    }
    if (!classRow.enrollmentOpen) {
      return const EnrollFailure('Las inscripciones están cerradas');
    }

    final countExpr = _db.enrollments.id.count();
    final countResult = await (_db.selectOnly(_db.enrollments)
          ..addColumns([countExpr])
          ..where(_db.enrollments.classId.equals(classId) &
              _db.enrollments.droppedAt.isNull()))
        .getSingle();
    final count = countResult.read(countExpr) ?? 0;
    if (count >= classRow.capacity) {
      return const EnrollFailure('La clase está llena');
    }

    final existing = await (_db.select(_db.enrollments)
          ..where((e) =>
              e.studentUserId.equals(studentUserId) &
              e.classId.equals(classId) &
              e.droppedAt.isNull()))
        .getSingleOrNull();
    if (existing != null) {
      return const EnrollFailure('Ya estás inscrito en esta clase');
    }

    try {
      await _db.into(_db.enrollments).insert(
            EnrollmentsCompanion.insert(
              studentUserId: studentUserId,
              classId: classId,
              status: 'enrolled',
              enrolledAt: Value(DateTime.now()),
            ),
          );
      return const EnrollSuccess();
    } on Exception catch (_) {
      return const EnrollFailure('No se pudo completar la inscripción');
    }
  }

  @override
  Future<List<Course>> listEnrolledByStudent(int studentUserId) async {
    final query = _db.select(_db.classes).join([
      innerJoin(
        _db.enrollments,
        _db.enrollments.classId.equalsExp(_db.classes.id),
      )
    ])
      ..where(_db.enrollments.studentUserId.equals(studentUserId) &
          _db.enrollments.droppedAt.isNull() &
          _db.classes.deletedAt.isNull());

    final rows = await query.get();
    return rows
        .map((r) => r.readTable(_db.classes))
        .map(_classToCourse)
        .toList();
  }

  @override
  Future<void> deleteClass({
    required int classId,
    required int teacherUserId,
  }) async {
    final row = await (_db.select(_db.classes)
          ..where((c) => c.id.equals(classId) & c.deletedAt.isNull()))
        .getSingleOrNull();
    if (row == null) {
      throw StateError('Clase no encontrada: $classId');
    }
    if (row.teacherUserId != teacherUserId) {
      throw StateError('No tienes permiso para eliminar este curso');
    }
    await (_db.update(_db.classes)..where((c) => c.id.equals(classId))).write(
          ClassesCompanion(deletedAt: Value(DateTime.now())),
        );
  }

  @override
  Future<List<EnrolledStudent>> listEnrolledStudentsByClass(int classId) async {
    final query = _db.select(_db.users).join([
      innerJoin(
        _db.enrollments,
        _db.enrollments.studentUserId.equalsExp(_db.users.id),
      )
    ])
      ..where(_db.enrollments.classId.equals(classId) &
          _db.enrollments.droppedAt.isNull());

    final rows = await query.get();
    return rows.map((r) {
      final user = r.readTable(_db.users);
      final enrollment = r.readTable(_db.enrollments);
      return EnrolledStudent(
        userId: user.id,
        name: user.name,
        lastname: user.lastname,
        enrolledAt: enrollment.enrolledAt,
      );
    }).toList();
  }
}
