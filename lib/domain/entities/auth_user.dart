/// Rol del usuario autenticado.
/// [AuthRole.teacher] = maestro, [AuthRole.student] = alumno.
enum AuthRole {
  teacher,
  student,
}

extension AuthRoleX on AuthRole {
  String get value => switch (this) {
        AuthRole.teacher => 'teacher',
        AuthRole.student => 'student',
      };

  static AuthRole fromString(String role) {
    switch (role.toLowerCase()) {
      case 'teacher':
      case 'maestro':
        return AuthRole.teacher;
      case 'student':
      case 'alumno':
        return AuthRole.student;
      default:
        throw ArgumentError('Rol no válido: $role');
    }
  }
}

/// Usuario autenticado (sin contraseña). Representa la sesión de maestro o alumno.
class AuthUser {
  final int id;
  final String username;
  final String email;
  final AuthRole role;
  final String name;
  final String lastname;
  final String? phone;

  const AuthUser({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
    required this.name,
    required this.lastname,
    this.phone,
  });

  bool get isTeacher => role == AuthRole.teacher;
  bool get isStudent => role == AuthRole.student;
}
