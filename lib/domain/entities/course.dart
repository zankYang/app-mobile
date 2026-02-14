class Course {
  final int id;
  final int teacherUserId;
  final String name;
  final int capacity;
  final bool enrollmentOpen;
  final DateTime? startDate;
  final DateTime? endDate;

  Course({
    required this.id,
    required this.teacherUserId,
    required this.name,
    required this.capacity,
    required this.enrollmentOpen,
    this.startDate,
    this.endDate,
  });

  /// Verifica si la fecha [date] está dentro del rango del curso.
  /// Si startDate/endDate son null, no hay restricción.
  bool isDateInRange(DateTime date) {
    final d = DateTime(date.year, date.month, date.day);
    if (startDate != null) {
      final s = DateTime(startDate!.year, startDate!.month, startDate!.day);
      if (d.isBefore(s)) return false;
    }
    if (endDate != null) {
      final e = DateTime(endDate!.year, endDate!.month, endDate!.day);
      if (d.isAfter(e)) return false;
    }
    return true;
  }
}