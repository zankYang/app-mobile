import 'package:drift/drift.dart';
import 'package:proyecto_final/data/db/app_db.dart';
import 'package:proyecto_final/domain/entities/auth_user.dart';
import 'package:proyecto_final/domain/repositories/auth_repository.dart';

/// Implementación de [AuthRepository] usando Drift (tabla [Users]).
/// La contraseña se compara en texto plano; en producción conviene hashear (ej. bcrypt).
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._db);

  final AppDb _db;
  AuthUser? _currentUser;

  @override
  AuthUser? get currentUser => _currentUser;

  @override
  Future<LoginResult> login({
    required String identifier,
    required String password,
  }) async {
    final trimmed = identifier.trim();
    if (trimmed.isEmpty) {
      return const LoginFailure('Indica email o usuario');
    }

    User? row = await (_db.select(_db.users)
          ..where((u) => u.email.equals(trimmed) & u.deletedAt.isNull()))
        .getSingleOrNull();
    row ??= await (_db.select(_db.users)
          ..where((u) => u.username.equals(trimmed) & u.deletedAt.isNull()))
        .getSingleOrNull();

    if (row == null) {
      return const LoginFailure('Usuario o email no encontrado');
    }

    if (row.password != password) {
      return const LoginFailure('Contraseña incorrecta');
    }

    final role = AuthRoleX.fromString(row.role);
    _currentUser = AuthUser(
      id: row.id,
      username: row.username,
      email: row.email,
      role: role,
      name: row.name,
      lastname: row.lastname,
      phone: row.phone,
    );
    return LoginSuccess(_currentUser!);
  }

  @override
  Future<RegisterResult> register({
    required String username,
    required String email,
    required String password,
    required AuthRole role,
    required String name,
    required String lastname,
    String? phone,
  }) async {
    final u = username.trim();
    final e = email.trim();
    if (u.isEmpty) return const RegisterFailure('El usuario es obligatorio');
    if (e.isEmpty) return const RegisterFailure('El email es obligatorio');
    if (password.isEmpty) return const RegisterFailure('La contraseña es obligatoria');
    if (name.trim().isEmpty) return const RegisterFailure('El nombre es obligatorio');
    if (lastname.trim().isEmpty) return const RegisterFailure('El apellido es obligatorio');

    try {
      final id = await _db.into(_db.users).insert(
            UsersCompanion.insert(
              username: u,
              email: e,
              password: password,
              role: role.value,
              name: name.trim(),
              lastname: lastname.trim(),
              phone: Value(phone?.trim().isEmpty ?? true ? null : phone?.trim()),
            ),
          );

      final row = await (_db.select(_db.users)..where((u) => u.id.equals(id)))
          .getSingle();
      final authRole = AuthRoleX.fromString(row.role);
      _currentUser = AuthUser(
        id: row.id,
        username: row.username,
        email: row.email,
        role: authRole,
        name: row.name,
        lastname: row.lastname,
        phone: row.phone,
      );
      return RegisterSuccess(_currentUser!);
    } on Exception catch (_) {
      return const RegisterFailure(
        'El email o el usuario ya están registrados',
      );
    }
  }

  @override
  Future<void> logout() async {
    _currentUser = null;
  }
}
