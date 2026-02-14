import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/app/providers.dart';
import 'package:proyecto_final/domain/entities/attendance_status.dart';
import 'package:proyecto_final/domain/entities/student_attendance_summary.dart';
import 'package:proyecto_final/routes/app_router.dart';

@RoutePage()
class UnderConstructionPage extends ConsumerWidget {
  const UnderConstructionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final displayName =
        user != null ? '${user.name} ${user.lastname}'.trim() : 'Usuario';
    final summaryAsync = ref.watch(studentAttendanceSummaryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(displayName),
        leading: Builder(
          builder: (ctx) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(ctx).openDrawer(),
          ),
        ),
      ),
      drawer: _StudentDrawer(parentContext: context, ref: ref),
      body: summaryAsync.when(
        data: (summaries) {
          if (summaries.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.school_outlined,
                    size: 64,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No estás inscrito en ninguna clase',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Usa "Elegir clase" en el menú para inscribirte',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                'Resumen de asistencia',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Cómo vas en tus clases',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 16),
              ...summaries.map((s) => _CourseAttendanceCard(summary: s)),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class _CourseAttendanceCard extends StatelessWidget {
  const _CourseAttendanceCard({required this.summary});

  final StudentCourseAttendanceSummary summary;

  @override
  Widget build(BuildContext context) {
    final s = summary;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              s.course.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            if (s.totalSessions == 0)
              Text(
                'Sin sesiones registradas aún',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              )
            else ...[
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _StatusChip(
                    label: 'Presente',
                    count: s.present,
                    color: const Color(AttendanceStatusColors.present),
                  ),
                  _StatusChip(
                    label: 'Ausente',
                    count: s.absent,
                    color: const Color(AttendanceStatusColors.absent),
                  ),
                  _StatusChip(
                    label: 'Retardo',
                    count: s.late,
                    color: const Color(AttendanceStatusColors.late),
                  ),
                  _StatusChip(
                    label: 'Justificado',
                    count: s.justified,
                    color: const Color(AttendanceStatusColors.justified),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '${s.totalSessions} sesiones · '
                '${s.attendancePercent.toStringAsFixed(0)}% asistencia',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.label,
    required this.count,
    required this.color,
  });

  final String label;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.lens, color: color, size: 12),
          const SizedBox(width: 4),
          Text(
            '$count',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 2),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: color,
                  fontSize: 11,
                ),
          ),
        ],
      ),
    );
  }
}

class _StudentDrawer extends StatelessWidget {
  const _StudentDrawer({required this.parentContext, required this.ref});

  final BuildContext parentContext;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Text(
                'Menú',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Ver perfil'),
              onTap: () {
                Navigator.of(context).pop();
                parentContext.router.push(const ProfileRoute());
              },
            ),
            ListTile(
              leading: const Icon(Icons.school_outlined),
              title: const Text('Elegir clase'),
              onTap: () {
                Navigator.of(context).pop();
                parentContext.router.push(const ChooseClassRoute());
              },
            ),
            ListTile(
              leading: const Icon(Icons.list_alt),
              title: const Text('Cursos inscritos'),
              onTap: () {
                Navigator.of(context).pop();
                parentContext.router.push(const EnrolledCoursesRoute());
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar sesión'),
              onTap: () async {
                Navigator.of(context).pop();
                await ref.read(authStateProvider.notifier).logout();
                if (parentContext.mounted) {
                  parentContext.router.replace(const LoginRoute());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
