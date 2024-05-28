import 'dart:io';
import 'package:path/path.dart' as path;

void run({required bool usePathPackage}) {
  final pathFn = usePathPackage ? path.join : joinPath;

  final char = 'tree 木';

  final dir = Directory(
    pathFn(
      Directory.systemTemp.createTempSync().path,
      char,
    ),
  )..createSync();

  print('Created directory: ${dir.path}');

  print('Creating a flutter project in the directory...');

  final result = Process.runSync(
    'flutter',
    ['create', 'my_flutter_project'],
    workingDirectory: dir.path,
  );

  if (result.exitCode != 0) {
    print('Failed to create a flutter project in the directory.');
  }

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
