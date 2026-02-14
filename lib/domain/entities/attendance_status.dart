import 'package:flutter/material.dart';

/// Estados de asistencia.
abstract class AttendanceStatus {
  static const String present = 'present';
  static const String absent = 'absent';
  static const String late = 'retardo';
  static const String justified = 'justificado';

  static const List<String> all = [present, absent, late, justified];

  static IconData icon(String status) {
    return switch (status) {
      present => Icons.check_circle,
      absent => Icons.cancel,
      late => Icons.schedule,
      justified => Icons.verified_user,
      _ => Icons.help_outline,
    };
  }

  static String label(String status) {
    return switch (status) {
      present => 'Presente',
      absent => 'Ausente',
      late => 'Retardo',
      justified => 'Justificado',
      _ => status,
    };
  }

  static String shortLabel(String status) {
    return switch (status) {
      present => 'P',
      absent => 'A',
      late => 'R',
      justified => 'J',
      _ => '?',
    };
  }
}

/// Códigos de color para reportes (usar con Color(0xFF...) en UI).
abstract class AttendanceStatusColors {
  static const int present = 0xFF4CAF50;
  static const int absent = 0xFFF44336;
  static const int late = 0xFFFF9800;
  static const int justified = 0xFF2196F3;

  static int forStatus(String status) {
    return switch (status) {
      AttendanceStatus.present => present,
      AttendanceStatus.absent => absent,
      AttendanceStatus.late => late,
      AttendanceStatus.justified => justified,
      _ => absent,
    };
  }
}
