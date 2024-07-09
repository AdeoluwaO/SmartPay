import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:smartpay/src/features/authentication/provider/login_provider.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider<LoginProvider>(
    create: (context) => LoginProvider(),
  ),
];