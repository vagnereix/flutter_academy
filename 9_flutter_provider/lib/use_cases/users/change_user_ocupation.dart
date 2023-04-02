import 'package:_flutter_provider/models/user_model.dart';

class ChangeUserOcupation {
  void call({required UserModel user, required String ocupation}) {
    user.ocupation = ocupation;
  }
}
