import 'dart:io';
import 'package:path/path.dart' as path;

void run({required bool usePathPackage}) {
  final pathFn = usePathPackage ? path.join : joinPath;

  final char = '木';

  final dir = Directory(
    pathFn(
      Directory.systemTemp.createTempSync().path,
      char,
    ),
  )..createSync();

  print('Created directory: ${dir.path}');

  final file = File(pathFn(dir.path, 'file.txt'))
    ..writeAsStringSync('Hello World');

  print('Created file: ${file.path}');
  print('File content: ${file.readAsStringSync()}');

  final result = Process.runSync(
    'echo',
    ["'Command executed'"],
    workingDirectory: dir.path,
  );

  print(result.stdout);
  print(result.stderr);
}

// So we don't use package just for this.
String joinPath(
    [String? part1,
    String? part2,
    String? part3,
    String? part4,
    String? part5]) {
  final parts = <String>[];
  if (part1 != null) parts.add(part1);
  if (part2 != null) parts.add(part2);
  if (part3 != null) parts.add(part3);
  if (part4 != null) parts.add(part4);
  if (part5 != null) parts.add(part5);

  return parts.join(Platform.pathSeparator);
}
