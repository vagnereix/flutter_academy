import 'package:provider/provider.dart';

import '../../core/modules/app_routes_module.dart';
import 'login/login_controller.dart';
import 'login/login_page.dart';

class AuthModule extends AppRoutesModule {
  /* This is the list of routes that will be used by the MaterialApp
    in the AppWidget class. */
  AuthModule()
      : super(
          providers: [
            Provider(
              create: (_) => LoginController(),
            ),
          ],
          routes: {
            '/login': (_) => const LoginPage(),
          },
        );
}
