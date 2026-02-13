class Course {
  final int id;
  final int teacherUserId;
  final String name;
  final int capacity;
  final bool enrollmentOpen;

  Course({
    required this.id,
    required this.teacherUserId,
    required this.name,
    required this.capacity,
    required this.enrollmentOpen,
  });
}