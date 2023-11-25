import 'package:provider/provider.dart';

import '../../core/modules/app_routes_module.dart';
import '../../services/tasks/tasks_service.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends AppRoutesModule {
  HomeModule()
      : super(
          providers: [
            ChangeNotifierProvider(
              create: (context) => HomeController(
                tasksService: context.read<TasksService>(),
              ),
            ),
          ],
          routes: {
            '/home': (context) => HomePage(
                  controller: context.read<HomeController>(),
                ),
          },
        );
}
