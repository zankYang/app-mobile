import 'enrollment_with_student.dart';
import 'session.dart';

/// Reporte de asistencia de un curso: sesiones, alumnos y estado por sesión.
class AttendanceReport {
  final List<Session> sessions;
  final List<EnrollmentWithStudent> enrollments;
  /// sessionId -> (enrollmentId -> status)
  final Map<int, Map<int, String>> attendanceBySession;

  const AttendanceReport({
    required this.sessions,
    required this.enrollments,
    required this.attendanceBySession,
  });

  String statusAt(int sessionId, int enrollmentId) {
    final map = attendanceBySession[sessionId];
    if (map == null) return 'absent';
    return map[enrollmentId] ?? 'absent';
  }
}
