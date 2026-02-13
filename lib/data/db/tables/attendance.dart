import 'package:drift/drift.dart';
import 'enrollments.dart';
import 'class_sessions.dart';

class Attendance extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get enrollmentId => integer()
      .named('enrollment_id')
      .references(Enrollments, #id)();

  IntColumn get sessionId => integer()
      .named('session_id')
      .references(ClassSessions, #id)();

  TextColumn get status => text()();

  DateTimeColumn get checkInAt => dateTime().nullable().named('check_in_at')();
  TextColumn get note => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {enrollmentId, sessionId},
      ];
}