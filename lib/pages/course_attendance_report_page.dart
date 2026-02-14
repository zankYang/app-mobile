import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/app/providers.dart';
import 'package:proyecto_final/domain/entities/attendance_report.dart';
import 'package:proyecto_final/domain/entities/attendance_status.dart';
import 'package:proyecto_final/domain/entities/course.dart';
import 'package:proyecto_final/utils/csv_export.dart';

Future<void> _downloadReportCsv(
  BuildContext context,
  AttendanceReport report,
  String courseName,
) async {
  final csv = buildTeacherAttendanceCsv(report, courseName);
  final filename = 'asistencia_${courseName.replaceAll(RegExp(r'[^\w\s-]'), '_')}.csv';
  await shareCsv(csv, filename);
}

@RoutePage()
class CourseAttendanceReportPage extends ConsumerWidget {
  const CourseAttendanceReportPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseId = ref.watch(selectedCourseIdProvider);
    if (courseId == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Reporte')),
        body: const Center(child: Text('No se seleccionó ningún curso')),
      );
    }

    final courseAsync = ref.read(classesRepositoryProvider).getById(courseId);
    final reportAsync = ref.watch(attendanceReportProvider(courseId));

    return FutureBuilder<Course>(
      future: courseAsync,
      builder: (context, courseSnapshot) {
        if (!courseSnapshot.hasData) {
          return Scaffold(
            appBar: AppBar(title: const Text('Reporte')),
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        final course = courseSnapshot.data!;

        return Scaffold(
          appBar: AppBar(
            title: Text('Concentrado · ${course.name}'),
            actions: [
              reportAsync.when(
                data: (report) => IconButton(
                  icon: const Icon(Icons.download),
                  tooltip: 'Descargar reporte CSV',
                  onPressed: () => _downloadReportCsv(context, report, course.name),
                ),
                loading: () => const SizedBox.shrink(),
                error: (error, stackTrace) => const SizedBox.shrink(),
              ),
            ],
          ),
          body: reportAsync.when(
            data: (report) => _ReportContent(report: report),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
          ),
        );
      },
    );
  }
}

class _ReportContent extends StatelessWidget {
  const _ReportContent({required this.report});

  final AttendanceReport report;

  @override
  Widget build(BuildContext context) {
    final totals = _computeTotals();
    final perSession = _computePerSession();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Resumen general',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 180,
            child: PieChart(
              PieChartData(
                sectionsSpace: 2,
                centerSpaceRadius: 40,
                sections: [
                  _pieSection('Presente', totals[AttendanceStatus.present] ?? 0, 0xFF4CAF50),
                  _pieSection('Ausente', totals[AttendanceStatus.absent] ?? 0, 0xFFF44336),
                  _pieSection('Retardo', totals[AttendanceStatus.late] ?? 0, 0xFFFF9800),
                  _pieSection('Justificado', totals[AttendanceStatus.justified] ?? 0, 0xFF2196F3),
                ],
              ),
              duration: const Duration(milliseconds: 300),
            ),
          ),
          const SizedBox(height: 24),
          if (report.sessions.isNotEmpty) ...[
            Text(
              'Asistencia por sesión',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 220,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: (report.enrollments.length * 1.2).ceilToDouble(),
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final i = value.toInt();
                          if (i >= 0 && i < report.sessions.length) {
                            final d = report.sessions[i].sessionAt;
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                '${d.day}/${d.month}',
                                style: const TextStyle(fontSize: 10),
                              ),
                            );
                          }
                          return const Text('');
                        },
                        reservedSize: 28,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        getTitlesWidget: (value, meta) => Text(
                          value.toInt().toString(),
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: const FlGridData(show: true, drawVerticalLine: false),
                  borderData: FlBorderData(show: false),
                  barGroups: perSession.asMap().entries.map((e) {
                    final present = e.value[AttendanceStatus.present] ?? 0;
                    return BarChartGroupData(
                      x: e.key,
                      barRods: [
                        BarChartRodData(
                          toY: present.toDouble(),
                          color: const Color(0xFF4CAF50),
                          width: 16,
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                        ),
                      ],
                      showingTooltipIndicators: [0],
                    );
                  }).toList(),
                ),
                duration: const Duration(milliseconds: 300),
              ),
            ),
            const SizedBox(height: 24),
          ],
          Text(
            'Grilla de asistencia',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          Wrap(
            spacing: 16,
            runSpacing: 4,
            children: AttendanceStatus.all.map((s) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(AttendanceStatusColors.forStatus(s)).withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      AttendanceStatus.shortLabel(s),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(AttendanceStatusColors.forStatus(s)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Text(AttendanceStatus.label(s), style: Theme.of(context).textTheme.bodySmall),
              ],
            )).toList(),
          ),
          const SizedBox(height: 8),
          _AttendanceGrid(report: report),
        ],
      ),
    );
  }

  PieChartSectionData _pieSection(String title, int value, int color) {
    return PieChartSectionData(
      value: value <= 0 ? 0.01 : value.toDouble(),
      title: '$value',
      color: Color(color),
      radius: 32,
      titleStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Map<String, int> _computeTotals() {
    final map = <String, int>{
      AttendanceStatus.present: 0,
      AttendanceStatus.absent: 0,
      AttendanceStatus.late: 0,
      AttendanceStatus.justified: 0,
    };
    for (final s in report.sessions) {
      for (final e in report.enrollments) {
        final st = report.statusAt(s.id, e.enrollmentId);
        map[st] = (map[st] ?? 0) + 1;
      }
    }
    return map;
  }

  List<Map<String, int>> _computePerSession() {
    return report.sessions.map((s) {
      final counts = <String, int>{
        AttendanceStatus.present: 0,
        AttendanceStatus.absent: 0,
        AttendanceStatus.late: 0,
        AttendanceStatus.justified: 0,
      };
      for (final e in report.enrollments) {
        final st = report.statusAt(s.id, e.enrollmentId);
        counts[st] = (counts[st] ?? 0) + 1;
      }
      return counts;
    }).toList();
  }
}

class _AttendanceGrid extends StatelessWidget {
  const _AttendanceGrid({required this.report});

  final AttendanceReport report;

  @override
  Widget build(BuildContext context) {
    if (report.sessions.isEmpty || report.enrollments.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'No hay sesiones o alumnos para mostrar.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      );
    }

    final maxHeight = MediaQuery.of(context).size.height * 0.5;
    return SizedBox(
      height: maxHeight,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(
              Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
            columns: [
              const DataColumn(label: Text('Alumno', style: TextStyle(fontWeight: FontWeight.bold))),
              ...report.sessions.map((s) {
                final d = s.sessionAt;
                return DataColumn(
                  label: Text(
                    '${d.day}/${d.month}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                );
              }),
            ],
            rows: report.enrollments.map<DataRow>((e) {
              return DataRow(
                cells: [
                  DataCell(ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 120),
                    child: Text(e.fullName, overflow: TextOverflow.ellipsis),
                  )),
                  ...report.sessions.map((s) {
                    final status = report.statusAt(s.id, e.enrollmentId);
                    return DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(AttendanceStatusColors.forStatus(status)).withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          AttendanceStatus.shortLabel(status),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(AttendanceStatusColors.forStatus(status)),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
