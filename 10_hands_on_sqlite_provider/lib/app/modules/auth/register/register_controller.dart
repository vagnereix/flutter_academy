import '../../../core/notifier/app_change_notifier.dart';
import '../../../exceptions/auth_exception.dart';
import '../../../services/user/user_service.dart';

class RegisterController extends AppChangeNotifier {
  final UserService _userService;

  RegisterController({required UserService userService})
      : _userService = userService;

  Future<void> registerUser(String email, String password) async {
    try {
      showLoaderAndResetState();
      notifyListeners();

      final user = await _userService.register(email, password);

      if (user != null) {
        setSuccess(true);
      } else {
        setError('Erro ao registrar usuário');
      }
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }
}
