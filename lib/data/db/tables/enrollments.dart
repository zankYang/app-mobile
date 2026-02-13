import 'package:drift/drift.dart';
import 'users.dart';
import 'classes.dart';

class Enrollments extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get studentUserId => integer()
      .named('student_user_id')
      .references(Users, #id)();

  IntColumn get classId =>
      integer().named('class_id').references(Classes, #id)();

  TextColumn get status => text()();

  DateTimeColumn get enrolledAt => dateTime().nullable().named('enrolled_at')();
  DateTimeColumn get droppedAt => dateTime().nullable().named('dropped_at')();

  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {studentUserId, classId},
      ];
}