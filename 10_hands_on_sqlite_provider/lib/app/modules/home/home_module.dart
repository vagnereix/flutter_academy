import 'package:provider/provider.dart';

import '../../core/modules/app_routes_module.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends AppRoutesModule {
  HomeModule()
      : super(
          providers: [
            ChangeNotifierProvider(create: (_) => HomeController()),
          ],
          routes: {
            '/home': (_) => const HomePage(),
          },
        );
}
