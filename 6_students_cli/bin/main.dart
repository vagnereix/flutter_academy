import 'package:_students_cli/src/commands/students/students_commands.dart';
import 'package:args/command_runner.dart';

void main(List<String> args) {
  CommandRunner(
    'Academia do Flutter CLI',
    'Project develop inside of Flutter Academy on Students CLI module',
  )
    ..addCommand(StudentsCommands())
    ..run(args);
}
