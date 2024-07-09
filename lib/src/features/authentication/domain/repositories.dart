import 'package:smartpay/src/core/services/config/base_response.dart';
import 'package:smartpay/src/features/authentication/domain/index.dart';

abstract class AuthRepo {
  Future<LoginResponse> loginUser(LoginParams params);
  Future<BaseResponse> logout();
  Future<GetTokenResponse> getEmailToken(SignupParams params);
  Future<VerifyEmailResponse> verifyEmail(SignupParams params);
  Future<CreateAccountResponse> createAccount(SignupParams params);
}
