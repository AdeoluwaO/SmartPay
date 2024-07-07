import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = _fromHex('0A6375');
  static Color secondaryColor = _fromHex('FFB9AA');
  static Color white = _fromHex('FFFFFF');
  static Color orange = _fromHex('F97316');
  static Color lavender = _fromHex('AB92F0');
  static Color illusion = _fromHex('F092AD');
  static Color sussie = _fromHex('55BBC5');
  static Color blueJeans = _fromHex('5FA8EE');
 
  //ALERTS
  static Color success = _fromHex('4ADE80');
  static Color warning = _fromHex('FACC15');
  static Color error = _fromHex('F75555');

//GREY SCALE
  static Color grey50 = _fromHex('F9FAFB');
  static Color grey100 = _fromHex('F3F4F6');
  static Color grey200 = _fromHex('E5E7EB');
  static Color grey300 = _fromHex('D1D5DB');
  static Color grey400 = _fromHex('9CA3AF');
  static Color grey500 = _fromHex('6B7280');
  static Color grey600 = _fromHex('4B5563');
  static Color grey700 = _fromHex('374151');
  static Color grey800 = _fromHex('1F2937');
  static Color grey900 = _fromHex('111827');
  static Color inputBoarderColor = _fromHex('2FA2B9');
}
  Color _fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
