/// Prefijo del texto del QR de asistencia. El formato completo es asistencia:{sessionId}.
const String _qrPrefix = 'asistencia:';

/// Genera el texto que debe mostrar el QR de asistencia para una sesión.
String qrAttendanceText(int sessionId) => '$_qrPrefix$sessionId';

/// Parsea el texto escaneado y devuelve el sessionId si es válido.
int? parseQrAttendanceText(String? text) {
  if (text == null || text.isEmpty) return null;
  final trimmed = text.trim();
  if (!trimmed.startsWith(_qrPrefix)) return null;
  final idStr = trimmed.substring(_qrPrefix.length).trim();
  return int.tryParse(idStr);
}
