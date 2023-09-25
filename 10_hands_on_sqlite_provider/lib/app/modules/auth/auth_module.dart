import 'package:provider/provider.dart';

import '../../core/modules/app_routes_module.dart';
import 'login/login_controller.dart';
import 'login/login_page.dart';
import 'register/register_controller.dart';
import 'register/register_page.dart';

class AuthModule extends AppRoutesModule {
  /* This is a list of routes that will be used by the MaterialApp
    in the AppWidget class. */
  AuthModule()
      : super(
          providers: [
            Provider(
              create: (_) => LoginController(),
            ),
            Provider(
              create: (_) => RegisterController(),
            ),
          ],
          routes: {
            '/login': (_) => const LoginPage(),
            '/register': (_) => const RegisterPage(),
          },
        );
}
