import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'database_connection_stub.dart'
    if (dart.library.io) 'database_connection_io.dart' as db_impl;

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
  AppDb() : super(driftDatabase(
        name: 'app_db',
        web: DriftWebOptions(
          sqlite3Wasm: Uri.parse('sqlite3.wasm'),
          driftWorker: Uri.parse('drift_worker.js'),
        ),
      ));

  AppDb.forTesting(super.executor);

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

/// Ruta del archivo de la base de datos (solo nativo).
Future<String> getDatabasePath() async =>
    db_impl.getDatabasePath('app_db');

/// Borra la base de datos. Llamar después de [AppDb.close()]
/// y luego invalidar el provider para que se cree una BD nueva.
Future<void> deleteDatabaseFile() async =>
    db_impl.deleteDatabaseFile('app_db');