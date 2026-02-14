import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/app/providers.dart';
import 'package:proyecto_final/domain/entities/attendance_status.dart';
import 'package:proyecto_final/domain/entities/create_session_result.dart';
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
                    final now = DateTime.now();
                    final today = DateTime(now.year, now.month, now.day);
                    final canCreateToday = course.isDateInRange(now);
                    final hasSessionToday = sessions.any((s) {
                      final d =
                          DateTime(s.sessionAt.year, s.sessionAt.month, s.sessionAt.day);
                      return d == today;
                    });
                    final canCreateSession = canCreateToday && !hasSessionToday;
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
                          onPressed: canCreateSession
                              ? () => _createSession(
                                    context, ref, courseId, course,
                                  )
                              : null,
                          icon: const Icon(Icons.add),
                          label: Text(
                            !canCreateToday
                                ? 'La fecha de hoy está fuera del rango del curso'
                                : hasSessionToday
                                    ? 'Ya existe una sesión de hoy'
                                    : 'Nueva sesión (hoy)',
                          ),
                        ),
                      ],
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Text('Error: $e'),
                ),
                if (_selectedSessionId != null)
                  _buildAttendanceSection(
                    context,
                    course,
                    sessionsAsync.valueOrNull ?? [],
                    ref,
                    attendanceAsync,
                    enrollmentsAsync,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAttendanceSection(
    BuildContext context,
    Course course,
    List<Session> sessions,
    WidgetRef ref,
    AsyncValue<Map<int, String>>? attendanceAsync,
    AsyncValue<List<EnrollmentWithStudent>> enrollmentsAsync,
  ) {
    final selectedSession =
        sessions.where((s) => s.id == _selectedSessionId).firstOrNull;
    final sessionInRange = selectedSession != null &&
        course.isDateInRange(selectedSession.sessionAt);

    if (selectedSession != null && !sessionInRange) {
      return Card(
        color: Theme.of(context).colorScheme.errorContainer,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'La fecha de esta sesión está fuera del rango registrado del curso. '
            'No puedes pasar asistencia.',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onErrorContainer,
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
                        await ref.read(attendanceRepositoryProvider).setAttendance(
                              sessionId: _selectedSessionId!,
                              enrollmentId: enrollmentId,
                              status: status,
                            );
                        ref.invalidate(attendanceBySessionProvider(_selectedSessionId!));
                      },
                      onSave: () => _saveAttendance(ref),
                      saving: _saving,
                      message: _message,
                    ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Text('Error: $e'),
                  )
                : const Center(child: CircularProgressIndicator());
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Text('Error: $e'),
        ),
      ],
    );
  }

  Future<void> _createSession(
    BuildContext context,
    WidgetRef ref,
    int classId,
    Course course,
  ) async {
    final now = DateTime.now();
    if (!course.isDateInRange(now)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'La fecha de hoy está fuera del rango registrado del curso.',
            ),
          ),
        );
      }
      return;
    }
    final result = await ref
        .read(attendanceRepositoryProvider)
        .createSession(classId: classId, sessionAt: now);
    ref.invalidate(sessionsByClassProvider(classId));
    switch (result) {
      case CreateSessionSuccess(:final sessionId):
        setState(() => _selectedSessionId = sessionId);
        break;
      case CreateSessionFailure(:final message):
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
        }
        break;
    }
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
                final isSelected = status == s;
                final color = Color(AttendanceStatusColors.forStatus(s));
                return Tooltip(
                  message: AttendanceStatus.label(s),
                  waitDuration: const Duration(milliseconds: 500),
                  child: InkWell(
                    onTap: () => onChanged(s),
                    borderRadius: BorderRadius.circular(24),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        AttendanceStatus.icon(s),
                        size: 28,
                        color: isSelected ? color : color.withValues(alpha: 0.5),
                    ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
