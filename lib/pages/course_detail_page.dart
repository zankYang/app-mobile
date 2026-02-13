import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/app/providers.dart';
import 'package:proyecto_final/domain/entities/course.dart';

@RoutePage()
class CourseDetailPage extends ConsumerWidget {
  const CourseDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseId = ref.watch(selectedCourseIdProvider);
    if (courseId == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Curso')),
        body: const Center(child: Text('No se seleccionó ningún curso')),
      );
    }

    final courseFuture = ref.read(classesRepositoryProvider).getById(courseId);
    final enrolledAsync = ref.watch(enrolledStudentsProvider(courseId));

    return FutureBuilder<Course>(
      future: courseFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(title: const Text('Curso')),
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        final course = snapshot.data!;
        return Scaffold(
          appBar: AppBar(title: Text(course.name)),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text('Capacidad: ${course.capacity}'),
                        Text(
                          'Inscripción: ${course.enrollmentOpen ? "Abierta" : "Cerrada"}',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Alumnos inscritos',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: enrolledAsync.when(
                  data: (students) {
                    if (students.isEmpty) {
                      return Center(
                        child: Text(
                          'Ningún alumno inscrito',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: students.length,
                      itemBuilder: (context, index) {
                        final s = students[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                (s.name.isNotEmpty ? s.name[0] : '?')
                                    .toUpperCase(),
                              ),
                            ),
                            title: Text(s.fullName),
                            subtitle: s.enrolledAt != null
                                ? Text(
                                    'Inscrito: ${_formatDate(s.enrolledAt!)}',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  )
                                : null,
                          ),
                        );
                      },
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(child: Text('Error: $e')),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static String _formatDate(DateTime d) => '${d.day}/${d.month}/${d.year}';
}
