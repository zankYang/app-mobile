import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/users.dart';
import 'tables/classes.dart';
import 'tables/enrollments.dart';
import 'tables/class_sessions.dart';
import 'tables/attendance.dart';

part 'app_db.g.dart';

@DriftDatabase(
  tables: [
    Users,
    Classes,
    Enrollments,
    ClassSessions,
    Attendance,
  ],
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await customStatement('PRAGMA foreign_keys = ON;');

          // Índices recomendados (además de los UNIQUE)
          await customStatement(
            'CREATE INDEX IF NOT EXISTS idx_classes_teacher_user_id ON classes(teacher_user_id);',
          );
          await customStatement(
            'CREATE INDEX IF NOT EXISTS idx_enrollments_class_id ON enrollments(class_id);',
          );
          await customStatement(
            'CREATE INDEX IF NOT EXISTS idx_class_sessions_class_id ON class_sessions(class_id);',
          );
          await customStatement(
            'CREATE INDEX IF NOT EXISTS idx_attendance_session_id ON attendance(session_id);',
          );
        },
        onUpgrade: (m, from, to) async {
          // migraciones futuras (if (from < 2) ...)
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON;');
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'app.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}