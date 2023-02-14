import 'package:flutter/material.dart';
import 'package:flutter_g4/pages/animations_page/first/first_page.dart';
import 'package:flutter_g4/pages/animations_page/second_page/second_page.dart';
import 'package:flutter_g4/pages/animations_page/third_page/third_page.dart';
import 'package:flutter_g4/pages/banking/account/account_view.dart';
import 'package:flutter_g4/pages/banking/wallet/wallet_page.dart';
import 'package:flutter_g4/pages/doctor/docrtor_page.dart';
import 'package:flutter_g4/pages/home/home_page.dart';
import 'package:flutter_g4/utils/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppPageRoutes.home.routeName: (context) => const HomePage(),
        AppPageRoutes.first.routeName: (context) => const FirstPage(),
        AppPageRoutes.second.routeName: (context) => const SecondPage(),
        AppPageRoutes.third.routeName: (context) => const ThirdPage(),
        AppPageRoutes.doctor.routeName: (context) => const DoctorPage(),
        AppPageRoutes.account.routeName: (context) => const AccountView(),
        AppPageRoutes.wallet.routeName: (context) => const WalletPage()
      },
      initialRoute: AppPageRoutes.wallet.routeName,
    );
  }
}
