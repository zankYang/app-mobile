import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:drift/drift.dart';

import 'package:proyecto_final/data/db/app_db.dart';

void main() {
  late AppDb db;

  setUp(() async {
    db = AppDb.forTesting(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  test('CRUD: inserta y borra en todas las tablas', () async {
    final teacherUserId = await db.into(db.users).insert( 
      UsersCompanion.insert(
        username: 'teacher1',
        email: 'teacher1@mail.com',
        password: 'hash',
        role: 'teacher',
        name: 'Juan',
        lastname: 'Perez',
        phone: const Value(null),
      ),
    );

    final studentUserId = await db.into(db.users).insert(
      UsersCompanion.insert(
        username: 'student1',
        email: 'student1@mail.com',
        password: 'hash',
        role: 'student',
        name: 'Ana',
        lastname: 'Lopez',
        phone: const Value(null),
      ),
    );

    final classId = await db.into(db.classes).insert(
      ClassesCompanion.insert(
        teacherUserId: teacherUserId,
        name: 'Matematicas',
        description: const Value('Curso base'),
        capacity: 30,
        enrollmentOpen: const Value(true),
        startDate: const Value(null),
        endDate: const Value(null),
      ),
    );

    final enrollmentId = await db.into(db.enrollments).insert(
      EnrollmentsCompanion.insert(
        studentUserId: studentUserId,
        classId: classId,
        status: 'enrolled',
        enrolledAt: Value(DateTime(2026, 1, 1, 8, 0)),
        droppedAt: const Value(null),
      ),
    );

    final sessionId = await db.into(db.classSessions).insert(
      ClassSessionsCompanion.insert(
        classId: classId,
        sessionAt: DateTime(2026, 1, 2, 7, 0),
      ),
    );

    final attendanceId = await db.into(db.attendance).insert(
      AttendanceCompanion.insert(
        enrollmentId: enrollmentId,
        sessionId: sessionId,
        status: 'present',
        checkInAt: Value(DateTime(2026, 1, 2, 7, 5)),
        note: const Value('ok'),
      ),
    );

    // ASSERT: existen
    expect(await db.select(db.users).get().then((r) => r.length), 2);
    expect(await db.select(db.classes).get().then((r) => r.length), 1);
    expect(await db.select(db.enrollments).get().then((r) => r.length), 1);
    expect(await db.select(db.classSessions).get().then((r) => r.length), 1);
    expect(await db.select(db.attendance).get().then((r) => r.length), 1);

    final att = await (db.select(db.attendance)..where((t) => t.id.equals(attendanceId))).getSingle();
    expect(att.status, 'present');

    await db.transaction(() async {
      await (db.delete(db.attendance)..where((t) => t.id.equals(attendanceId))).go();
      await (db.delete(db.classSessions)..where((t) => t.id.equals(sessionId))).go();
      await (db.delete(db.enrollments)..where((t) => t.id.equals(enrollmentId))).go();
      await (db.delete(db.classes)..where((t) => t.id.equals(classId))).go();
      await (db.delete(db.users)..where((t) => t.id.equals(studentUserId))).go();
      await (db.delete(db.users)..where((t) => t.id.equals(teacherUserId))).go();
    });

    expect(await db.select(db.attendance).get().then((r) => r.length), 0);
    expect(await db.select(db.classSessions).get().then((r) => r.length), 0);
    expect(await db.select(db.enrollments).get().then((r) => r.length), 0);
    expect(await db.select(db.classes).get().then((r) => r.length), 0);
    expect(await db.select(db.users).get().then((r) => r.length), 0);
  });
}