import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:proyecto_final/domain/entities/attendance_report.dart';
import 'package:proyecto_final/domain/entities/attendance_status.dart';
import 'package:proyecto_final/domain/entities/student_attendance_summary.dart';
import 'package:share_plus/share_plus.dart';

/// Genera el CSV del reporte de asistencia completo (profesor: todos los alumnos).
String buildTeacherAttendanceCsv(AttendanceReport report, String courseName) {
  final buffer = StringBuffer();

  // Encabezado
  buffer.writeln('Reporte de asistencia - $courseName');
  buffer.writeln();

  if (report.sessions.isEmpty || report.enrollments.isEmpty) {
    buffer.writeln('Sin datos de asistencia');
    return buffer.toString();
  }

  // Primera fila: Alumno, fechas
  final headerRow = ['Alumno', ...report.sessions.map((s) {
    final d = s.sessionAt;
    return '${d.day}/${d.month}/${d.year}';
  })];
  buffer.writeln(_escapeRow(headerRow));

  // Filas de datos: nombre, P/A/R/J por sesión
  for (final enrollment in report.enrollments) {
    final row = [
      enrollment.fullName,
      ...report.sessions.map((s) {
        final status = report.statusAt(s.id, enrollment.enrollmentId);
        return AttendanceStatus.shortLabel(status);
      }),
    ];
    buffer.writeln(_escapeRow(row));
  }

  return buffer.toString();
}

/// Genera el CSV del reporte de asistencia del alumno (solo sus datos).
String buildStudentAttendanceCsv(StudentCourseAttendanceSummary summary) {
  final buffer = StringBuffer();
  final courseName = summary.course.name;

  buffer.writeln('Mi asistencia - $courseName');
  buffer.writeln();

  if (summary.sessionDetails.isEmpty) {
    buffer.writeln('Fecha,Sesión,Estado');
    buffer.writeln(',Sin sesiones registradas,A');
    return buffer.toString();
  }

  // Encabezado
  buffer.writeln(_escapeRow(['Fecha', 'Hora', 'Estado']));

  for (final detail in summary.sessionDetails) {
    final d = detail.sessionAt;
    final dateStr = '${d.day}/${d.month}/${d.year}';
    final timeStr = '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';
    final statusLabel = AttendanceStatus.shortLabel(detail.status);
    buffer.writeln(_escapeRow([dateStr, timeStr, statusLabel]));
  }

  buffer.writeln();
  buffer.writeln(_escapeRow(['Resumen', 'Presente', 'Ausente', 'Retardo', 'Justificado', 'Total', '%']));
  buffer.writeln(_escapeRow([
    '',
    '${summary.present}',
    '${summary.absent}',
    '${summary.late}',
    '${summary.justified}',
    '${summary.totalSessions}',
    '${summary.attendancePercent.toStringAsFixed(1)}%',
  ]));

  return buffer.toString();
}

String _escapeRow(List<String> cells) {
  return cells.map((c) {
    if (c.contains(',') || c.contains('"') || c.contains('\n')) {
      return '"${c.replaceAll('"', '""')}"';
    }
    return c;
  }).join(',');
}

/// Guarda el CSV en un archivo temporal y lo comparte para descargar/guardar.
Future<void> shareCsv(String csvContent, String filename) async {
  final dir = await getTemporaryDirectory();
  final file = File('${dir.path}/$filename');
  await file.writeAsString(csvContent, encoding: utf8);
  await Share.shareXFiles([XFile(file.path)], text: 'Reporte de asistencia');
}
