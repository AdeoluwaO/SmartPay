import 'package:smartpay/src/features/dashboard/domain/index.dart';

class HomeData implements HomeRepo {
  @override
  Future<HomePageData> getSecretData() async {
    final response = await DomainHome.getSecretInfo();
    return response.data ?? HomePageData();
  }
}
