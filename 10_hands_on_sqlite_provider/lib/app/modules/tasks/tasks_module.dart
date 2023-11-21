import 'package:provider/provider.dart';

import '../../core/modules/app_routes_module.dart';
import 'create_task_controller.dart';
import 'create_task_page.dart';

class TasksModule extends AppRoutesModule {
  TasksModule()
      : super(
          providers: [
            ChangeNotifierProvider(
              create: (_) => CreateTaskController(),
            ),
          ],
          routes: {
            '/task/create': (context) => CreateTaskPage(
                  controller: context.read<CreateTaskController>(),
                ),
          },
        );
}
