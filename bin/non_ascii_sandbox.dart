import 'package:non_ascii_sandbox/non_ascii_sandbox.dart' as non_ascii_sandbox;

void main(List<String> arguments) {
  final usePackage = arguments.contains('--package');
  non_ascii_sandbox.run(usePathPackage: usePackage);
}
