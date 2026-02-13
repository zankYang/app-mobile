/// Alumno inscrito en una clase (para listado del profesor).
class EnrolledStudent {
  final int userId;
  final String name;
  final String lastname;
  final DateTime? enrolledAt;

  const EnrolledStudent({
    required this.userId,
    required this.name,
    required this.lastname,
    this.enrolledAt,
  });

  String get fullName => '$name $lastname'.trim();
}
