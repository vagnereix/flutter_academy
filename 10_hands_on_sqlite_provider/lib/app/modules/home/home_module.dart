import 'package:provider/provider.dart';

import '../../core/modules/app_routes_module.dart';
import 'home_page.dart';

class HomeModule extends AppRoutesModule {
  HomeModule()
      : super(
          providers: [
            Provider(create: (_) => 'unknown'),
          ],
          routes: {
            '/home': (_) => const HomePage(),
          },
        );
}
