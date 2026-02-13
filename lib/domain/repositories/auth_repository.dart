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

/// Resultado de intento de registro.
sealed class RegisterResult {
  const RegisterResult();
}

class RegisterSuccess extends RegisterResult {
  final AuthUser user;
  const RegisterSuccess(this.user);
}

class RegisterFailure extends RegisterResult {
  final String message;
  const RegisterFailure(this.message);
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

  /// Registra un nuevo usuario (maestro o alumno).
  /// Devuelve [RegisterSuccess] con [AuthUser] o [RegisterFailure] si email/usuario ya existe.
  Future<RegisterResult> register({
    required String username,
    required String email,
    required String password,
    required AuthRole role,
    required String name,
    required String lastname,
    String? phone,
  });

  /// Cierra la sesión del usuario actual.
  Future<void> logout();

  /// Obtiene el usuario actualmente autenticado, o null si no hay sesión.
  AuthUser? get currentUser;
}
