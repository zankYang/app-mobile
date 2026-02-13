import '../entities/course.dart';

/// Resultado de intentar inscribirse a una clase.
sealed class EnrollResult {
  const EnrollResult();
}

class EnrollSuccess extends EnrollResult {
  const EnrollSuccess();
}

class EnrollFailure extends EnrollResult {
  final String message;
  const EnrollFailure(this.message);
}

abstract class ClassesRepository {
  Future<int> createClass({
    required int teacherUserId,
    required String name,
    required int capacity,
    required bool enrollmentOpen,
  });

  Future<List<Course>> listOpenClasses();
  Future<Course> getById(int classId);

  /// Inscribe a un alumno en una clase. Devuelve [EnrollSuccess] o [EnrollFailure].
  Future<EnrollResult> enrollStudent({
    required int studentUserId,
    required int classId,
  });

  /// Lista las clases en las que el alumno está inscrito (sin darse de baja).
  Future<List<Course>> listEnrolledByStudent(int studentUserId);
}