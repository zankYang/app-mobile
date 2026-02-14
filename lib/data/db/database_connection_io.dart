import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

Future<String> getDatabasePath(String name) async {
  final dir = await getApplicationDocumentsDirectory();
  return p.join(dir.path, '$name.sqlite');
}

Future<void> deleteDatabaseFile(String name) async {
  final path = await getDatabasePath(name);
  final file = File(path);
  if (await file.exists()) {
    await file.delete();
  }
}
