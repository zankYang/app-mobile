import 'course.dart';

/// Resumen de asistencia de un alumno en una clase.
class StudentCourseAttendanceSummary {
  final Course course;
  final int present;
  final int absent;
  final int late;
  final int justified;

  const StudentCourseAttendanceSummary({
    required this.course,
    required this.present,
    required this.absent,
    required this.late,
    required this.justified,
  });

  int get totalSessions => present + absent + late + justified;

  /// Porcentaje de asistencia (presente + justificado como "válidos").
  double get attendancePercent {
    if (totalSessions == 0) return 0;
    return ((present + justified) / totalSessions * 100);
  }
}
