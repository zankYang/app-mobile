import 'package:drift/drift.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get username => text()();
  TextColumn get email => text()();
  TextColumn get password => text()();
  TextColumn get role => text()();
  TextColumn get name => text()();
  TextColumn get lastname => text()();
  TextColumn get phone => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();

  DateTimeColumn get deletedAt =>
      dateTime().named('deleted_at').nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {username},
        {email},
      ];
}