import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/utils/qr_attendance.dart';
import 'package:qr_flutter/qr_flutter.dart';

@RoutePage()
class QrGeneratorPage extends StatelessWidget {
  const QrGeneratorPage({
    super.key,
    required this.sessionId,
    required this.sessionAt,
    required this.courseName,
  });

  final int sessionId;
  final DateTime sessionAt;
  final String courseName;

  @override
  Widget build(BuildContext context) {
    final dateStr =
        '${sessionAt.day}/${sessionAt.month}/${sessionAt.year} '
        '${sessionAt.hour.toString().padLeft(2, '0')}:${sessionAt.minute.toString().padLeft(2, '0')}';

    return Scaffold(
      appBar: AppBar(
        title: const Text('QR de asistencia'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  courseName,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Sesión: $dateStr',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.12),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: QrImageView(
                    data: qrAttendanceText(sessionId),
                    version: QrVersions.auto,
                    size: 260,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Los alumnos escanean este código\npara registrarse como presentes',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
