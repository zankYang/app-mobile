import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/app/providers.dart';
import 'package:proyecto_final/domain/entities/attendance_status.dart';
import 'package:proyecto_final/domain/entities/course.dart';
import 'package:proyecto_final/domain/entities/enrollment_with_student.dart';
import 'package:proyecto_final/domain/entities/session.dart';

@RoutePage()
class CourseAttendancePage extends ConsumerStatefulWidget {
  const CourseAttendancePage({super.key});

  @override
  ConsumerState<CourseAttendancePage> createState() =>
      _CourseAttendancePageState();
}

class _CourseAttendancePageState extends ConsumerState<CourseAttendancePage> {
  int? _selectedSessionId;
  bool _saving = false;
  String? _message;

  @override
  Widget build(BuildContext context) {
    final courseId = ref.watch(selectedCourseIdProvider);
    if (courseId == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Asistencia')),
        body: const Center(child: Text('No se seleccionó ningún curso')),
      );
    }

    final courseAsync = ref.watch(classesRepositoryProvider).getById(courseId);
    final sessionsAsync = ref.watch(sessionsByClassProvider(courseId));
    final enrollmentsAsync =
        ref.watch(enrollmentsWithStudentByClassProvider(courseId));
    final attendanceAsync = _selectedSessionId != null
        ? ref.watch(attendanceBySessionProvider(_selectedSessionId!))
        : null;

    return FutureBuilder<Course>(
      future: courseAsync,
      builder: (context, courseSnapshot) {
        if (!courseSnapshot.hasData) {
          return Scaffold(
            appBar: AppBar(title: const Text('Asistencia')),
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        final course = courseSnapshot.data!;

        return Scaffold(
          appBar: AppBar(title: Text('Asistencia · ${course.name}')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Sesión',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                sessionsAsync.when(
                  data: (sessions) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (sessions.isEmpty)
                          const Card(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                'Crea una sesión para pasar asistencia.',
                              ),
                            ),
                          )
                        else
                          ...sessions.map((s) => _SessionTile(
                                session: s,
                                isSelected:
                                    _selectedSessionId == s.id,
                                onTap: () => setState(
                                    () => _selectedSessionId = s.id),
                              )),
                        const SizedBox(height: 8),
                        OutlinedButton.icon(
                          onPressed: () => _createSession(context, ref, courseId),
                          icon: const Icon(Icons.add),
                          label: const Text('Nueva sesión (hoy)'),
                        ),
                      ],
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Text('Error: $e'),
                ),
                if (_selectedSessionId != null) ...[
                  const SizedBox(height: 24),
                  Text(
                    'Alumnos',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  enrollmentsAsync.when(
                    data: (enrollments) {
                      if (enrollments.isEmpty) {
                        return const Card(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              'No hay alumnos inscritos en este curso.',
                            ),
                          ),
                        );
                      }
                      return attendanceAsync != null
                          ? attendanceAsync.when(
                              data: (attendanceMap) => _AttendanceList(
                                enrollments: enrollments,
                                initialStatus: attendanceMap,
                                sessionId: _selectedSessionId!,
                                onStatusChanged: (enrollmentId, status) async {
                                  await ref
                                      .read(attendanceRepositoryProvider)
                                      .setAttendance(
                                        sessionId: _selectedSessionId!,
                                        enrollmentId: enrollmentId,
                                        status: status,
                                      );
                                  ref.invalidate(attendanceBySessionProvider(
                                      _selectedSessionId!));
                                },
                                onSave: () => _saveAttendance(ref),
                                saving: _saving,
                                message: _message,
                              ),
                              loading: () => const Center(
                                  child: CircularProgressIndicator()),
                              error: (e, _) => Text('Error: $e'),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Text('Error: $e'),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _createSession(
      BuildContext context, WidgetRef ref, int classId) async {
    final now = DateTime.now();
    final sessionId = await ref
        .read(attendanceRepositoryProvider)
        .createSession(classId: classId, sessionAt: now);
    ref.invalidate(sessionsByClassProvider(classId));
    setState(() => _selectedSessionId = sessionId);
  }

  Future<void> _saveAttendance(WidgetRef ref) async {
    if (_selectedSessionId == null) return;
    setState(() {
      _saving = true;
      _message = null;
    });
    // The actual save is done in _AttendanceList when the user toggles;
    // we could add an explicit "Guardar" that just invalidates.
    ref.invalidate(attendanceBySessionProvider(_selectedSessionId!));
    setState(() {
      _saving = false;
      _message = 'Asistencia actualizada';
    });
  }
}

class _SessionTile extends StatelessWidget {
  const _SessionTile({
    required this.session,
    required this.isSelected,
    required this.onTap,
  });

  final Session session;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final date = session.sessionAt;
    final dateStr = '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color: isSelected
          ? Theme.of(context).colorScheme.primaryContainer
          : null,
      child: ListTile(
        title: Text(dateStr),
        trailing: isSelected ? const Icon(Icons.check_circle) : null,
        onTap: onTap,
      ),
    );
  }
}

class _AttendanceList extends StatefulWidget {
  const _AttendanceList({
    required this.enrollments,
    required this.initialStatus,
    required this.sessionId,
    required this.onStatusChanged,
    required this.onSave,
    required this.saving,
    this.message,
  });

  final List<EnrollmentWithStudent> enrollments;
  final Map<int, String> initialStatus;
  final int sessionId;
  final Future<void> Function(int enrollmentId, String status) onStatusChanged;
  final VoidCallback onSave;
  final bool saving;
  final String? message;

  @override
  State<_AttendanceList> createState() => _AttendanceListState();
}

class _AttendanceListState extends State<_AttendanceList> {
  late Map<int, String> _status;

  @override
  void initState() {
    super.initState();
    _status = Map.from(widget.initialStatus);
    for (final e in widget.enrollments) {
      _status.putIfAbsent(e.enrollmentId, () => AttendanceStatus.absent);
    }
  }

  @override
  void didUpdateWidget(_AttendanceList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialStatus != widget.initialStatus) {
      _status = Map.from(widget.initialStatus);
      for (final e in widget.enrollments) {
        _status.putIfAbsent(e.enrollmentId, () => AttendanceStatus.absent);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.message != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              widget.message!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ...widget.enrollments.map((e) => _AttendanceRow(
              enrollment: e,
              status: _status[e.enrollmentId] ?? AttendanceStatus.absent,
              onChanged: (status) async {
                setState(() => _status[e.enrollmentId] = status);
                await widget.onStatusChanged(e.enrollmentId, status);
              },
            )),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: widget.saving ? null : widget.onSave,
          child: const Text('Actualizar'),
        ),
      ],
    );
  }
}

class _AttendanceRow extends StatelessWidget {
  const _AttendanceRow({
    required this.enrollment,
    required this.status,
    required this.onChanged,
  });

  final EnrollmentWithStudent enrollment;
  final String status;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              enrollment.fullName,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: AttendanceStatus.all.map((s) {
                return ChoiceChip(
                  label: Text(AttendanceStatus.label(s)),
                  selected: status == s,
                  onSelected: (_) => onChanged(s),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
