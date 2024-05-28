import 'dart:io';
import 'package:path/path.dart' as path;

void run() {
  final char = '木';

  final dir = Directory(
    path.join(
      Directory.systemTemp.createTempSync().path,
      char,
    ),
  )..createSync();

  print('Created directory: ${dir.path}');
}
