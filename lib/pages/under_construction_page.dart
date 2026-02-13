import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/app/providers.dart';
import 'package:proyecto_final/routes/app_router.dart';

@RoutePage()
class UnderConstructionPage extends ConsumerWidget {
  const UnderConstructionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final displayName = user != null ? '${user.name} ${user.lastname}'.trim() : 'Usuario';

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
      body: Center(
        child: Text(
          'En construcción',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
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
