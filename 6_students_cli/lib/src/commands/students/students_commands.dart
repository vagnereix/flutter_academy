import 'package:_students_cli/src/commands/students/subcommands/delete_by_id_command.dart';
import 'package:_students_cli/src/commands/students/subcommands/find_all_command.dart';
import 'package:_students_cli/src/commands/students/subcommands/find_by_id_command.dart';
import 'package:_students_cli/src/commands/students/subcommands/insert_command.dart';
import 'package:_students_cli/src/commands/students/subcommands/update_command.dart';
import 'package:_students_cli/src/repositories/student_repository.dart';
import 'package:args/command_runner.dart';

class StudentsCommands extends Command {
  @override
  String get description => 'All students operations';

  @override
  String get name => 'students';

  StudentsCommands() {
    final studentRepository = StudentRepository();

    addSubcommand(FindAllCommand(studentRepository: studentRepository));
    addSubcommand(FindByIdCommand(studentRepository: studentRepository));
    addSubcommand(InsertCommand(studentRepository: studentRepository));
    addSubcommand(UpdateCommand(studentRepository: studentRepository));
    addSubcommand(DeleteByIdCommand(studentRepository: studentRepository));
  }
}
