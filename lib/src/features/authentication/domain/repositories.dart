import 'package:smartpay/src/core/services/config/base_response.dart';
import 'package:smartpay/src/features/authentication/domain/index.dart';

abstract class AuthRepo {
  Future<LoginResponse> loginUser(LoginParams params);
}
