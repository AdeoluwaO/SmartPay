import 'package:smartpay/src/core/services/config/base_response.dart';
import 'package:smartpay/src/features/authentication/domain/index.dart';

class AuthData implements AuthRepo {
  @override
  Future<LoginResponse> loginUser(LoginParams params) async {
    final response = await DomainAuth.loginUser(params);
    return response.data ?? LoginResponse();
  }
}
