import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartpay/src/core/uttils/index.dart';

showToast({required String message,Toast? toastLength ,bool isError = false}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: toastLength ?? Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: isError ? AppColors.error : AppColors.success,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}