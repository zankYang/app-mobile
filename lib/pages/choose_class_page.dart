import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/app/providers.dart';
import 'package:proyecto_final/domain/entities/course.dart';
import 'package:proyecto_final/domain/repositories/classes_repository.dart';

@RoutePage()
class ChooseClassPage extends ConsumerStatefulWidget {
  const ChooseClassPage({super.key});

  @override
  ConsumerState<ChooseClassPage> createState() => _ChooseClassPageState();
}

class _ChooseClassPageState extends ConsumerState<ChooseClassPage> {
  String? _message;
  bool _isEnrolling = false;

  Future<void> _enroll(Course course) async {
    final user = ref.read(currentUserProvider);
    if (user == null || !user.isStudent) return;

    setState(() {
      _message = null;
      _isEnrolling = true;
    });

    final result = await ref.read(classesRepositoryProvider).enrollStudent(
          studentUserId: user.id,
          classId: course.id,
        );

    if (!mounted) return;
    setState(() => _isEnrolling = false);

    if (result is EnrollSuccess) {
      setState(() => _message = 'Te has inscrito en ${course.name}');
      ref.invalidate(enrolledCoursesProvider);
      ref.invalidate(openClassesProvider);
      ref.invalidate(attendanceReportProvider(course.id));
    } else {
      setState(() => _message = (result as EnrollFailure).message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final openClassesAsync = ref.watch(openClassesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Elegir clase')),
      body: openClassesAsync.when(
        data: (classes) {
          if (classes.isEmpty) {
            return Center(
              child: Text(
                'No hay clases con inscripción abierta',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }
          return Column(
            children: [
              if (_message != null)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  color: _message!.contains('inscrito')
                      ? Colors.green.shade100
                      : Theme.of(context).colorScheme.errorContainer,
                  child: Text(_message!),
                ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: classes.length,
                  itemBuilder: (context, index) {
                    final course = classes[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        title: Text(course.name),
                        subtitle: Text(
                          'Capacidad: ${course.capacity}',
                        ),
                        trailing: _isEnrolling
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : FilledButton(
                                onPressed: () => _enroll(course),
                                child: const Text('Inscribirme'),
                              ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
