import 'package:flutter/material.dart';
import 'package:smartpay/src/features/authentication/data/authentication_data.dart';
import 'package:smartpay/src/features/authentication/domain/index.dart';

class SignupProvider extends ChangeNotifier {
  GetTokenResponse? _tokenResponse;
  GetTokenResponse? get tokenResponse => _tokenResponse;
  
  VerifyEmailResponse? _verifyEmailResponse;
  VerifyEmailResponse? get verifyEmailResponse => _verifyEmailResponse;
  
  CreateAccountResponse? _createAccountResponse;
  CreateAccountResponse? get createAccountResponse => _createAccountResponse;

  bool isLoading = false;

  void getEmailToken(SignupParams params) async {
    isLoading = true;
    notifyListeners();
    final response = await AuthData().getEmailToken(params);
    isLoading = false;
    notifyListeners();
    _tokenResponse = response;
    notifyListeners();
  }

  void verifyEmailToken(SignupParams params) async {
    isLoading = true;
    notifyListeners();
    final response = await AuthData().verifyEmail(params);
    isLoading = false;
    notifyListeners();
    _verifyEmailResponse = response;
    notifyListeners();
  }

  void createUser(SignupParams params) async {
    isLoading = true;
    notifyListeners();
    final response = await AuthData().createAccount(params);
    isLoading = false;
    notifyListeners();
    _createAccountResponse = response;
    notifyListeners();
  }
}