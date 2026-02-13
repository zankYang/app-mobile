
import 'package:drift/drift.dart';
import 'users.dart';

class Classes extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get teacherUserId => integer()
      .named('teacher_user_id')
      .references(Users, #id)();

  TextColumn get name => text()();
  TextColumn get description => text().nullable()();

  IntColumn get capacity => integer()();
  BoolColumn get enrollmentOpen =>
      boolean().named('enrollment_open').withDefault(const Constant(true))();

  DateTimeColumn get startDate => dateTime().nullable().named('start_date')();
  DateTimeColumn get endDate => dateTime().nullable().named('end_date')();

  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();

  DateTimeColumn get deletedAt =>
      dateTime().named('deleted_at').nullable()();
}