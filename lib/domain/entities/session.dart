/// Sesión de clase (fecha/hora para pasar asistencia).
class Session {
  final int id;
  final int classId;
  final DateTime sessionAt;

  const Session({
    required this.id,
    required this.classId,
    required this.sessionAt,
  });
}
