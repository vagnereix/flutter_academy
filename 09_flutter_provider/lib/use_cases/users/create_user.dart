import 'dart:math';

import 'package:_flutter_provider/models/user_model.dart';

class CreateUser {
  UserModel call({required String name, String occupation = 'Estudante'}) {
    return UserModel(
      id: Random().nextInt(100),
      name: name,
      occupation: occupation,
    );
  }
}
