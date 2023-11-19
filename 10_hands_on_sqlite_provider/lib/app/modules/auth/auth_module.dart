import 'package:provider/provider.dart';

import '../../core/modules/app_routes_module.dart';
import '../../services/user/user_service.dart';
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
            ChangeNotifierProvider(
              create: (context) => LoginController(
                userService: context.read<UserService>(),
              ),
            ),
            ChangeNotifierProvider(
              create: (context) => RegisterController(
                userService: context.read<UserService>(),
              ),
            ),
          ],
          routes: {
            '/login': (_) => const LoginPage(),
            '/register': (_) => const RegisterPage(),
          },
        );
}
