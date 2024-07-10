import 'package:smartpay/src/features/dashboard/domain/index.dart';

abstract class HomeRepo {
  Future<HomePageData> getSecretData();
}