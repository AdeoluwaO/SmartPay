import 'package:flutter/material.dart';
import 'package:smartpay/src/features/authentication/data/authentication_data.dart';
import 'package:smartpay/src/features/authentication/domain/index.dart';

class LoginProvider extends ChangeNotifier {
  LoginResponse? _loginData;
  LoginResponse? get loginData => _loginData;
  bool isLoading = false;

  void loginUser(LoginParams params) async {
    isLoading = true;
    notifyListeners();
    final response = await AuthData().loginUser(params);
    isLoading = false;
    notifyListeners();
    _loginData = response;
    notifyListeners();
  }
}
