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
    if (response != null) {
      final BaseResponse<LoginResponse> loginResponse = BaseResponse(
        data: LoginResponse.fromJson(response['data']),
        status: response['status'],
        message: response['message'],
      );
      print('MODELLED REPOSEN ${loginResponse.data?.toJson()}');
      return loginResponse;
    }
    else {
      return const BaseResponse();
    }
  }

  static Future<BaseResponse<GetTokenResponse>> getEmailToken(
      SignupParams params) async {
    final response = await sendRequest(
      method: 'post',
      endpoint: ApiEndpoints.getEmailToken,
      requiresAuth: false,
      data: {"email": params.email},
    );
    print('RAW REPOSEN $response'); 
    if (response != null) {
    
    final BaseResponse<GetTokenResponse> getTokenResponse = BaseResponse(
      data: GetTokenResponse.fromJson(response['data']),
      status: response['status'],
      message: response['message'],
    );
    print('MODELLED REPOSEN ${getTokenResponse.data?.toJson()}');
    return getTokenResponse;
    }
    else {
      return const BaseResponse();
    }
  }

  static Future<BaseResponse<VerifyEmailResponse>> verifyEmailToken(
      SignupParams params) async {
    final response = await sendRequest(
      method: 'post',
      endpoint: ApiEndpoints.verifyEmailToken,
      requiresAuth: false,
      data: {
        "email": params.email,
        "token": params.otp,
      },
    );
    print('RAW REPOSEN $response');
    
    final BaseResponse<VerifyEmailResponse> verifyEmailResponse = BaseResponse(
      data: VerifyEmailResponse.fromJson(response['data']),
      status: response['status'],
      message: response['message'],
    );
    print('MODELLED REPOSEN ${verifyEmailResponse.data?.toJson()}');
    return verifyEmailResponse;
  }

  static Future<BaseResponse<CreateAccountResponse>> registerUser(
      SignupParams params) async {
    final response = await sendRequest(
      method: 'post',
      endpoint: ApiEndpoints.createUser,
      requiresAuth: false,
      data: params.toJson(),
    );
    print('RAW REPOSEN $response');
    final BaseResponse<CreateAccountResponse> createAccountResponse =
        BaseResponse(
      data: CreateAccountResponse.fromJson(response['data']),
      status: response['status'],
      message: response['message'],
    );
    print('MODELLED REPOSEN ${createAccountResponse.data?.toJson()}');
    return createAccountResponse;
  }

  static Future<BaseResponse> logout() async {
    final response = await sendRequest(
      method: 'post',
      endpoint: ApiEndpoints.logoutUser,
      requiresAuth: false,
    );
    print('RAW REPOSEN $response');
    final BaseResponse logoutResponse = BaseResponse(
      data: [],
      status: response['status'],
      message: response['message'],
    );
    print('MODELLED REPOSEN ${logoutResponse.data?.toJson()}');
    return logoutResponse;
  }
}
