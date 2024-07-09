import 'package:smartpay/src/features/dashboard/domain/index.dart';

abstract class DashboardRepo {
  Future<HomePageData> getSecretData();
}