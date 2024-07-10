import 'package:flutter/cupertino.dart';
import 'package:smartpay/src/core/routers/route_exports.dart';
import 'package:smartpay/src/features/authentication/domain/index.dart';

class RouteGenerator {
  const RouteGenerator._();
  //LOGIN
  static const loginScreen = 'login_screen';
  //SIGNUP
  static const createAccount = 'create_account';
  static const bioData = 'bio_data';
  static const setupPin = 'setup_pin';
  static const success = 'success';
  static const verifyEmail = 'verify_enail';
  //FORGOT PASSWORD
  static const forgotPassword = 'forgot_password';
  static const createNewPassword = 'create_new_password';
  static const verifyIdentity = 'verify_identity';


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      //LOGIN
      case loginScreen:
        return trasnsitionRouter(screenWidget: const LoginScreen());
      //SIGNUP
      case createAccount:
        return trasnsitionRouter(screenWidget: const CreateAccountScreen());
      case bioData:
      final params = settings.arguments as SignupParams;
        return trasnsitionRouter(screenWidget:  BioDataScreen(params: params));
      case setupPin:
        return trasnsitionRouter(screenWidget: const SetupPinScreen());
      case verifyEmail:
      final params = settings.arguments as SignupParams;
      
        return trasnsitionRouter(screenWidget:  VerifyEmailScreen(params: params,));
      case success:
        return trasnsitionRouter(screenWidget: const SuccessScreen());
      //FORGOT PASSWORD
      case forgotPassword:
        return trasnsitionRouter(screenWidget: const ForgotPasswordScreen());
      case createNewPassword:
        return trasnsitionRouter(screenWidget: const CreatePasswordScreen());
      case verifyIdentity:
        return trasnsitionRouter(screenWidget: const VerifyIdentityScreen());
      default:
        throw UnimplementedError('Route not found');
    }
  }
}

trasnsitionRouter({required Widget screenWidget}) {
  return CupertinoPageRoute(builder: (context) => screenWidget);
}
