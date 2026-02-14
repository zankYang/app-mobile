import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/app/providers.dart';
import 'package:proyecto_final/domain/entities/course.dart';
import 'package:proyecto_final/routes/app_router.dart';
import 'package:proyecto_final/widgets/app_drawer_header.dart' show AppDrawerHeader, AppDrawerTile;

@RoutePage()
class TeacherHomePage extends ConsumerWidget {
  const TeacherHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final displayName =
        user != null ? '${user.name} ${user.lastname}'.trim() : 'Profesor';

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
      drawer: _TeacherDrawer(parentContext: context, ref: ref),
      body: ref.watch(teacherCoursesProvider).when(
            data: (courses) => _CourseList(
              courses: courses,
              onCourseTap: (course) {
                ref.read(selectedCourseIdProvider.notifier).state = course.id;
                context.router.push(const CourseDetailRoute());
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
          ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.router.push(const CreateCourseRoute()),
        icon: const Icon(Icons.add),
        label: const Text('Crear curso'),
      ),
    );
  }
}

class _CourseList extends StatelessWidget {
  const _CourseList({
    required this.courses,
    required this.onCourseTap,
  });

  final List<Course> courses;
  final void Function(Course course) onCourseTap;

  @override
  Widget build(BuildContext context) {
    if (courses.isEmpty) {
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
              'Aún no tienes cursos',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Pulsa "Crear curso" para agregar uno',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.school),
            ),
            title: Text(course.name),
            subtitle: Text(
              'Capacidad: ${course.capacity} · '
              'Inscripción: ${course.enrollmentOpen ? "Abierta" : "Cerrada"}',
            ),
            onTap: () => onCourseTap(course),
          ),
        );
      },
    );
  }
}

class _TeacherDrawer extends StatelessWidget {
  const _TeacherDrawer({required this.parentContext, required this.ref});

  final BuildContext parentContext;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const AppDrawerHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Column(
                children: [
                  AppDrawerTile(
                    icon: Icons.school_outlined,
                    title: 'Mis cursos',
                    subtitle: 'Ver y gestionar tus clases',
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  AppDrawerTile(
                    icon: Icons.event_note,
                    title: 'Asistencia',
                    subtitle: 'Pasar lista',
                    onTap: () {
                      Navigator.of(context).pop();
                      parentContext.router.push(const AttendanceRoute());
                    },
                  ),
                  AppDrawerTile(
                    icon: Icons.bar_chart,
                    title: 'Reporte / Concentrado',
                    subtitle: 'Gráficas y estadísticas',
                    onTap: () {
                      Navigator.of(context).pop();
                      parentContext.router.push(const AttendanceReportListRoute());
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Divider(height: 1),
                  ),
                  AppDrawerTile(
                    icon: Icons.logout,
                    title: 'Cerrar sesión',
                    iconColor: Theme.of(context).colorScheme.error,
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
          ],
        ),
      ),
    );
  }
}
