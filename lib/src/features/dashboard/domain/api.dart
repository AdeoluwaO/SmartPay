import 'package:smartpay/src/core/services/config/base_response.dart';
import 'package:smartpay/src/core/services/network/api_endpoint.dart';
import 'package:smartpay/src/core/services/network/api_setup.dart';
import 'package:smartpay/src/features/dashboard/domain/index.dart';

class DomainDashboard {
  static Future<BaseResponse<HomePageData>> loginUser() async {
    final response = await sendRequest(
        method: 'post', endpoint: ApiEndpoints.dashboard, requiresAuth: false);
    print('RAW REPOSEN $response');
    final BaseResponse<HomePageData> homePageData = BaseResponse(
      data: HomePageData.fromJson(response['data']),
      status: response['status'],
      message: response['message'],
    );
    print('MODELLED REPOSEN ${homePageData.data?.toJson()}');
    return homePageData;
  }
}
