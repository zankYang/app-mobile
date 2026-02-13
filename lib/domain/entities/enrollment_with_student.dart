/// Inscripción con datos del alumno (para pasar asistencia).
class EnrollmentWithStudent {
  final int enrollmentId;
  final int userId;
  final String name;
  final String lastname;

  const EnrollmentWithStudent({
    required this.enrollmentId,
    required this.userId,
    required this.name,
    required this.lastname,
  });

  String get fullName => '$name $lastname'.trim();
}
