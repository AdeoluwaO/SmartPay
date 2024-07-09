import 'package:smartpay/src/core/services/config/base_response.dart';
import 'package:smartpay/src/core/services/network/api_endpoint.dart';
import 'package:smartpay/src/core/services/network/api_setup.dart';
import 'package:smartpay/src/features/authentication/domain/index.dart';

class DomainAuth {
  static Future<BaseResponse<LoginResponse>> loginUser(
      LoginParams params) async {
    final response = await sendRequest(
        method: 'post',
        endpoint: ApiEndpoints.loginUser,
        requiresAuth: false,
        data: params.toJson());
    print('RAW REPOSEN $response');
    final BaseResponse<LoginResponse> loginResponse = BaseResponse(
      data: LoginResponse.fromJson(response['data']),
      status: response['status'],
      message: response['message'],
    );
    print('MODELLED REPOSEN ${loginResponse.data?.toJson()}');
    return loginResponse;
  }
}
