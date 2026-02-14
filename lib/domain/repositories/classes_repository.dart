import '../entities/course.dart';
import '../entities/enrolled_student.dart';

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
    DateTime? startDate,
    DateTime? endDate,
  });

  Future<List<Course>> listOpenClasses();
  Future<Course> getById(int classId);

  /// Lista las clases creadas por el profesor.
  Future<List<Course>> listClassesByTeacher(int teacherUserId);

  /// Inscribe a un alumno en una clase. Devuelve [EnrollSuccess] o [EnrollFailure].
  Future<EnrollResult> enrollStudent({
    required int studentUserId,
    required int classId,
  });

  /// Lista las clases en las que el alumno está inscrito (sin darse de baja).
  Future<List<Course>> listEnrolledByStudent(int studentUserId);

  /// Lista los alumnos inscritos en una clase (para el profesor).
  Future<List<EnrolledStudent>> listEnrolledStudentsByClass(int classId);

  /// Elimina un curso (soft delete). Solo el profesor dueño puede eliminarlo.
  /// Lanza [StateError] si el curso no existe o si no es el dueño.
  Future<void> deleteClass({required int classId, required int teacherUserId});
}