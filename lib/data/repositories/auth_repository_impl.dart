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
  Future<void> logout() async {
    _currentUser = null;
  }
}
