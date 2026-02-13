import 'package:drift/drift.dart';
import 'classes.dart';

class ClassSessions extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get classId =>
      integer().named('class_id').references(Classes, #id)();

  DateTimeColumn get sessionAt => dateTime().named('session_at')();

  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {classId, sessionAt},
      ];
}