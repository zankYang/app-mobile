import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/data/db/app_db.dart';
import 'package:proyecto_final/data/repositories/auth_repository_impl.dart';
import 'package:proyecto_final/domain/entities/auth_user.dart';
import 'package:proyecto_final/data/repositories/classes_repository_impl.dart';
import 'package:proyecto_final/domain/entities/course.dart';
import 'package:proyecto_final/domain/entities/enrolled_student.dart';
import 'package:proyecto_final/data/repositories/attendance_repository_impl.dart';
import 'package:proyecto_final/domain/entities/attendance_report.dart';
import 'package:proyecto_final/domain/entities/enrollment_with_student.dart';
import 'package:proyecto_final/domain/entities/session.dart';
import 'package:proyecto_final/domain/repositories/auth_repository.dart';
import 'package:proyecto_final/domain/repositories/classes_repository.dart';
import 'package:proyecto_final/domain/repositories/attendance_repository.dart';

/// Base de datos Drift (una sola instancia).
final appDbProvider = Provider<AppDb>((ref) {
  final db = AppDb();
  ref.onDispose(() => db.close());
  return db;
});

/// Borra el archivo de la BD y cierra sesión. La próxima vez que se use
/// la app se creará una BD vacía. Útil para desarrollo o "empezar de cero".
/// Uso: `await resetDatabase(ref);` y luego navegar a login si hace falta.
Future<void> resetDatabase(WidgetRef ref) async {
  await ref.read(appDbProvider).close();
  await deleteDatabaseFile();
  ref.invalidate(appDbProvider);
  await ref.read(authStateProvider.notifier).logout();
  ref.invalidate(authStateProvider);
}

/// Repositorio de autenticación (maestros y alumnos).
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final db = ref.watch(appDbProvider);
  return AuthRepositoryImpl(db);
});

/// Estado de autenticación: [AsyncData] con [AuthUser] si hay sesión, o null.
/// Usar [AuthNotifier.login] y [AuthNotifier.logout] para cambiar.
final authStateProvider =
    AsyncNotifierProvider<AuthNotifier, AuthUser?>(AuthNotifier.new);

class AuthNotifier extends AsyncNotifier<AuthUser?> {
  @override
  Future<AuthUser?> build() async {
    return ref.read(authRepositoryProvider).currentUser;
  }

  /// Inicia sesión con email o username y contraseña.
  /// [identifier] puede ser email o username.
  /// Devuelve [LoginResult] (éxito o fallo con mensaje).
  Future<LoginResult> login({
    required String identifier,
    required String password,
  }) async {
    final repo = ref.read(authRepositoryProvider);
    final result = await repo.login(identifier: identifier, password: password);
    if (result is LoginSuccess) {
      state = AsyncData(result.user);
    }
    return result;
  }

  /// Registra un nuevo usuario (maestro o alumno) e inicia sesión.
  /// Devuelve [RegisterResult] (éxito o fallo con mensaje).
  Future<RegisterResult> register({
    required String username,
    required String email,
    required String password,
    required AuthRole role,
    required String name,
    required String lastname,
    String? phone,
  }) async {
    final repo = ref.read(authRepositoryProvider);
    final result = await repo.register(
      username: username,
      email: email,
      password: password,
      role: role,
      name: name,
      lastname: lastname,
      phone: phone,
    );
    if (result is RegisterSuccess) {
      state = AsyncData(result.user);
    }
    return result;
  }

  /// Cierra la sesión actual.
  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
    state = const AsyncData(null);
  }
}

/// Atajo: usuario actual (null si no hay sesión o está cargando).
final currentUserProvider = Provider<AuthUser?>((ref) {
  return ref.watch(authStateProvider).valueOrNull;
});

/// true si el usuario actual es maestro.
final isTeacherProvider = Provider<bool>((ref) {
  return ref.watch(currentUserProvider)?.isTeacher ?? false;
});

/// true si el usuario actual es alumno.
final isStudentProvider = Provider<bool>((ref) {
  return ref.watch(currentUserProvider)?.isStudent ?? false;
});

/// Repositorio de clases e inscripciones.
final classesRepositoryProvider = Provider<ClassesRepository>((ref) {
  final db = ref.watch(appDbProvider);
  return ClassesRepositoryImpl(db);
});

/// Clases con inscripción abierta (para elegir clase).
final openClassesProvider = FutureProvider<List<Course>>((ref) async {
  final repo = ref.watch(classesRepositoryProvider);
  return repo.listOpenClasses();
});

/// Clases en las que está inscrito el alumno actual.
final enrolledCoursesProvider = FutureProvider<List<Course>>((ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null || !user.isStudent) return [];
  final repo = ref.watch(classesRepositoryProvider);
  return repo.listEnrolledByStudent(user.id);
});

/// Cursos del profesor actual.
final teacherCoursesProvider = FutureProvider<List<Course>>((ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null || !user.isTeacher) return [];
  final repo = ref.watch(classesRepositoryProvider);
  return repo.listClassesByTeacher(user.id);
});

/// Alumnos inscritos en una clase (por id de clase).
final enrolledStudentsProvider =
    FutureProvider.family<List<EnrolledStudent>, int>((ref, classId) async {
  final repo = ref.watch(classesRepositoryProvider);
  return repo.listEnrolledStudentsByClass(classId);
});

/// Curso seleccionado para ver detalle (profesor). Se asigna antes de push a CourseDetailRoute.
final selectedCourseIdProvider = StateProvider<int?>((ref) => null);

/// Repositorio de asistencia y sesiones.
final attendanceRepositoryProvider = Provider<AttendanceRepository>((ref) {
  final db = ref.watch(appDbProvider);
  return AttendanceRepositoryImpl(db);
});

/// Sesiones de una clase (para asistencia).
final sessionsByClassProvider =
    FutureProvider.family<List<Session>, int>((ref, classId) async {
  final repo = ref.watch(attendanceRepositoryProvider);
  return repo.listSessionsByClass(classId);
});

/// Inscripciones con alumno para una clase (pasar asistencia).
final enrollmentsWithStudentByClassProvider =
    FutureProvider.family<List<EnrollmentWithStudent>, int>((ref, classId) async {
  final repo = ref.watch(attendanceRepositoryProvider);
  return repo.listEnrollmentsWithStudentByClass(classId);
});

/// Asistencia por sesión: enrollmentId -> status.
final attendanceBySessionProvider =
    FutureProvider.family<Map<int, String>, int>((ref, sessionId) async {
  final repo = ref.watch(attendanceRepositoryProvider);
  return repo.getAttendanceBySession(sessionId);
});

/// Reporte completo de asistencia de un curso.
final attendanceReportProvider =
    FutureProvider.family<AttendanceReport, int>((ref, classId) async {
  final repo = ref.watch(attendanceRepositoryProvider);
  return repo.getAttendanceReport(classId);
});
