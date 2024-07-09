import 'package:smartpay/src/core/services/config/base_response.dart';
import 'package:smartpay/src/features/authentication/domain/index.dart';

class AuthData implements AuthRepo {
  @override
  Future<LoginResponse> loginUser(LoginParams params) async {
    final response = await DomainAuth.loginUser(params);
    return response.data ?? LoginResponse();
  }

  @override
  Future<CreateAccountResponse> createAccount(SignupParams params) async {
    final response = await DomainAuth.registerUser(params);
    return response.data ?? CreateAccountResponse();
  }

  @override
  Future<GetTokenResponse> getEmailToken(SignupParams params) async {
    final response = await DomainAuth.getEmailToken(params);
    return response.data ?? GetTokenResponse();
  }

  @override
  Future<VerifyEmailResponse> verifyEmail(SignupParams params) async {
    final response = await DomainAuth.verifyEmailToken(params);
    return response.data ?? VerifyEmailResponse();
  }
  
  @override
  Future<BaseResponse> logout() async {
    final response = await DomainAuth.logout();
    return response.data ?? BaseResponse();
  
  }
}
