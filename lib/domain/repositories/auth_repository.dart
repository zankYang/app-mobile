import '../entities/auth_user.dart';

/// Resultado de intento de login.
sealed class LoginResult {
  const LoginResult();
}

class LoginSuccess extends LoginResult {
  final AuthUser user;
  const LoginSuccess(this.user);
}

class LoginFailure extends LoginResult {
  final String message;
  const LoginFailure(this.message);
}

/// Contrato del repositorio de autenticación (maestros y alumnos).
abstract class AuthRepository {
  /// Inicia sesión con email o username y contraseña.
  /// [identifier] puede ser email o username.
  /// Devuelve [LoginSuccess] con [AuthUser] (maestro o alumno) o [LoginFailure].
  Future<LoginResult> login({
    required String identifier,
    required String password,
  });

  /// Cierra la sesión del usuario actual.
  Future<void> logout();

  /// Obtiene el usuario actualmente autenticado, o null si no hay sesión.
  AuthUser? get currentUser;
}
