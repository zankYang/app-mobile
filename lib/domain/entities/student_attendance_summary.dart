import 'course.dart';

/// Detalle de una sesión para el reporte del alumno.
class SessionAttendanceDetail {
  final DateTime sessionAt;
  final String status;

  const SessionAttendanceDetail({
    required this.sessionAt,
    required this.status,
  });
}

/// Resumen de asistencia de un alumno en una clase.
class StudentCourseAttendanceSummary {
  final Course course;
  final int present;
  final int absent;
  final int late;
  final int justified;
  /// Detalle por sesión (fecha y estado) para exportar CSV.
  final List<SessionAttendanceDetail> sessionDetails;

  const StudentCourseAttendanceSummary({
    required this.course,
    required this.present,
    required this.absent,
    required this.late,
    required this.justified,
    this.sessionDetails = const [],
  });

  int get totalSessions => present + absent + late + justified;

  /// Porcentaje de asistencia (presente + justificado como "válidos").
  double get attendancePercent {
    if (totalSessions == 0) return 0;
    return ((present + justified) / totalSessions * 100);
  }
}
