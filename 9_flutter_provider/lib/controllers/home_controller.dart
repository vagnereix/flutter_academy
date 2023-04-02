import 'package:_flutter_provider/models/user_model.dart';
import 'package:_flutter_provider/use_cases/users/change_user_name.dart';
import 'package:_flutter_provider/use_cases/users/change_user_ocupation.dart';
import 'package:_flutter_provider/use_cases/users/create_user.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final UserModel _user = CreateUser().call(name: 'Vagner');

  UserModel get user => _user;

  void changeName(String name) {
    ChangeUserName().call(user: _user, name: name);
    notifyListeners();
  }

  void changeOcupation(String ocupation) {
    ChangeUserOcupation().call(user: _user, ocupation: ocupation);
    notifyListeners();
  }
}
