import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/app/providers.dart';
import 'package:proyecto_final/routes/app_router.dart';

@RoutePage()
class AttendanceReportListPage extends ConsumerWidget {
  const AttendanceReportListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(teacherCoursesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Reporte de asistencia')),
      body: coursesAsync.when(
        data: (courses) {
          if (courses.isEmpty) {
            return Center(
              child: Text(
                'No tienes cursos.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
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
                    child: Icon(Icons.bar_chart),
                  ),
                  title: Text(course.name),
                  subtitle: const Text('Ver concentrado y gráficas'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    ref.read(selectedCourseIdProvider.notifier).state = course.id;
                    context.router.push(const CourseAttendanceReportRoute());
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
