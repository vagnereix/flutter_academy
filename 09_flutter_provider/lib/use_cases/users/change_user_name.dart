import 'package:_flutter_provider/models/user_model.dart';

class ChangeUserName {
  void call({required UserModel user, required String name}) {
    user.name = name;
  }
}
