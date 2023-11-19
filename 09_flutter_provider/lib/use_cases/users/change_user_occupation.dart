import 'package:_flutter_provider/models/user_model.dart';

class ChangeUserOccupation {
  void call({required UserModel user, required String occupation}) {
    user.occupation = occupation;
  }
}
