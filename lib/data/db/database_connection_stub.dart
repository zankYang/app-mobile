Future<String> getDatabasePath(String name) async {
  throw UnsupportedError('getDatabasePath no disponible en web');
}

Future<void> deleteDatabaseFile(String name) async {
  // En web la BD está en IndexedDB. Cerrando e invalidando el provider
  // hará que se cree una nueva instancia. Los datos viejos pueden persistir
  // hasta que el usuario limpie el almacenamiento del navegador.
}
