import 'package:flutter/material.dart';
import 'package:smartpay/src/features/dashboard/data/dashboard_data.dart';
import 'package:smartpay/src/features/dashboard/domain/index.dart';

class DashboardProvider extends ChangeNotifier {
  HomePageData? _homePageData;
  HomePageData? get homePageData => _homePageData;
  bool isLoading = false;

  Future getSecret() async {
    isLoading = true;
    notifyListeners();
    final response = await HomeData().getSecretData();
    isLoading = false;
    notifyListeners();
    _homePageData = response;
    notifyListeners();
  }
}
