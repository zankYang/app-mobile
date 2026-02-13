import '../entities/attendance_report.dart';
import '../entities/enrollment_with_student.dart';
import '../entities/session.dart';

abstract class AttendanceRepository {
  /// Sesiones de una clase (para elegir o crear una).
  Future<List<Session>> listSessionsByClass(int classId);

  /// Crea una sesión para la clase en la fecha/hora indicada.
  Future<int> createSession({required int classId, required DateTime sessionAt});

  /// Inscripciones del curso con nombre del alumno (para marcar asistencia).
  Future<List<EnrollmentWithStudent>> listEnrollmentsWithStudentByClass(
      int classId);

  /// Asistencia ya registrada en una sesión: enrollmentId -> status ('present' / 'absent').
  Future<Map<int, String>> getAttendanceBySession(int sessionId);

  /// Registra o actualiza la asistencia de un alumno en una sesión.
  Future<void> setAttendance({
    required int sessionId,
    required int enrollmentId,
    required String status,
  });

  /// Reporte completo de asistencia del curso (sesiones, alumnos, estado por sesión).
  Future<AttendanceReport> getAttendanceReport(int classId);
}
