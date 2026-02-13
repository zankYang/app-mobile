import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/app/providers.dart';

@RoutePage()
class CreateCoursePage extends ConsumerStatefulWidget {
  const CreateCoursePage({super.key});

  @override
  ConsumerState<CreateCoursePage> createState() => _CreateCoursePageState();
}

class _CreateCoursePageState extends ConsumerState<CreateCoursePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _capacityController = TextEditingController();

  bool _enrollmentOpen = true;
  bool _isLoading = false;
  String? _errorMessage;
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void dispose() {
    _nameController.dispose();
    _capacityController.dispose();
    super.dispose();
  }

  Future<void> _pickStartDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date != null) setState(() => _startDate = date);
  }

  Future<void> _pickEndDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _endDate ?? _startDate ?? DateTime.now(),
      firstDate: _startDate ?? DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date != null) setState(() => _endDate = date);
  }

  Future<void> _submit() async {
    setState(() => _errorMessage = null);
    if (!_formKey.currentState!.validate()) return;

    final user = ref.read(currentUserProvider);
    if (user == null || !user.isTeacher) return;

    final name = _nameController.text.trim();
    final capacity = int.tryParse(_capacityController.text.trim());
    if (capacity == null || capacity < 1) {
      setState(() => _errorMessage = 'Indica una capacidad válida');
      return;
    }

    setState(() => _isLoading = true);

    try {
      await ref.read(classesRepositoryProvider).createClass(
            teacherUserId: user.id,
            name: name,
            capacity: capacity,
            enrollmentOpen: _enrollmentOpen,
            startDate: _startDate,
            endDate: _endDate,
          );
      ref.invalidate(teacherCoursesProvider);
      if (!mounted) return;
      context.router.maybePop();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _errorMessage = 'No se pudo crear el curso';
      });
    }
  }

  String _formatDate(DateTime? d) =>
      d == null ? '' : '${d.day}/${d.month}/${d.year}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear curso')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre del curso',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.school_outlined),
                ),
                textInputAction: TextInputAction.next,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Indica el nombre del curso';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _capacityController,
                decoration: const InputDecoration(
                  labelText: 'Capacidad (alumnos)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.people_outline),
                ),
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Indica la capacidad';
                  }
                  final n = int.tryParse(v.trim());
                  if (n == null || n < 1) return 'Debe ser al menos 1';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Fecha de inicio'),
                subtitle: Text(
                  _startDate == null ? 'Opcional' : _formatDate(_startDate),
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: _pickStartDate,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                title: const Text('Fecha de término'),
                subtitle: Text(
                  _endDate == null ? 'Opcional' : _formatDate(_endDate),
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: _pickEndDate,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Inscripción abierta'),
                subtitle: Text(
                  _enrollmentOpen
                      ? 'Los alumnos pueden inscribirse'
                      : 'Las inscripciones están cerradas',
                ),
                value: _enrollmentOpen,
                onChanged: (v) => setState(() => _enrollmentOpen = v),
              ),
              if (_errorMessage != null) ...[
                const SizedBox(height: 16),
                Text(
                  _errorMessage!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ],
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _isLoading ? null : _submit,
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Crear curso'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
