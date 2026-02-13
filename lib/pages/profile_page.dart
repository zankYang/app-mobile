import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/app/providers.dart';

@RoutePage()
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Mi perfil')),
      body: user == null
          ? const Center(child: Text('No hay sesión'))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nombre', style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 4),
                  Text('${user.name} ${user.lastname}'),
                  const SizedBox(height: 16),
                  Text('Usuario', style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 4),
                  Text(user.username),
                  const SizedBox(height: 16),
                  Text('Email', style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 4),
                  Text(user.email),
                  if (user.phone != null && user.phone!.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Text('Teléfono', style: Theme.of(context).textTheme.labelLarge),
                    const SizedBox(height: 4),
                    Text(user.phone!),
                  ],
                  const SizedBox(height: 16),
                  Text('Rol', style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 4),
                  Text(user.isTeacher ? 'Maestro' : 'Alumno'),
                ],
              ),
            ),
    );
  }
}
