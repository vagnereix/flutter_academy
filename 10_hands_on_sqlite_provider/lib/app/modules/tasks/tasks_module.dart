import 'package:provider/provider.dart';

import '../../core/modules/app_routes_module.dart';
import '../../services/tasks/tasks_service.dart';
import 'create_task_controller.dart';
import 'create_task_page.dart';

class TasksModule extends AppRoutesModule {
  TasksModule()
      : super(
          providers: [
            ChangeNotifierProvider(
              create: (context) => CreateTaskController(
                tasksService: context.read<TasksService>(),
              ),
            ),
          ],
          routes: {
            '/task/create': (context) => CreateTaskPage(
                  controller: context.read<CreateTaskController>(),
                ),
          },
        );
}
