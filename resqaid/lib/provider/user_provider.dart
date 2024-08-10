import 'package:flutter/material.dart';
import 'package:resqaid/community/model/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    username: '',
    email: '',
    password: '',
  );

  User get user => _user;

  void setUser({
    required String username,
    required String email,
    required String password,
  }) {
    _user = User(
      username: username,
      email: email,
      password: password,
    );
    notifyListeners();
  }
}
