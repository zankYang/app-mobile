/// Resultado de crear una sesión de asistencia.
sealed class CreateSessionResult {}

class CreateSessionSuccess extends CreateSessionResult {
  CreateSessionSuccess(this.sessionId);
  final int sessionId;
}

class CreateSessionFailure extends CreateSessionResult {
  CreateSessionFailure(this.message);
  final String message;
}
