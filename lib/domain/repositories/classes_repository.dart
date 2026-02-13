import '../entities/course.dart';

abstract class ClassesRepository {
  Future<int> createClass({
    required int teacherUserId,
    required String name,
    required int capacity,
    required bool enrollmentOpen,
  });

  Future<List<Course>> listOpenClasses();
  Future<Course> getById(int classId);
}