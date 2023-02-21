import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_g4/pages/animations_page/first/first_page.dart';
import 'package:flutter_g4/pages/animations_page/second_page/second_page.dart';
import 'package:flutter_g4/pages/animations_page/third_page/third_page.dart';
import 'package:flutter_g4/pages/banking/account/account_view.dart';
import 'package:flutter_g4/pages/banking/wallet/wallet_page.dart';
import 'package:flutter_g4/pages/crypto_pack/crypto_view.dart';
import 'package:flutter_g4/pages/doctor/docrtor_page.dart';
import 'package:flutter_g4/pages/doctor_list/doctors_view.dart';
import 'package:flutter_g4/pages/home/home_page.dart';
import 'package:flutter_g4/pages/responsive/apple_page.dart';
import 'package:flutter_g4/pages/responsive/gridpage.dart';
import 'package:flutter_g4/pages/responsive/responsive_view.dart';
import 'package:flutter_g4/pages/responsive/shoplist_view.dart';
import 'package:flutter_g4/utils/routes/app_routes.dart';

/*
Created by Axmadjon Isaqov on 15:07:49 21.02.2023
© 2023 @axiydev 
*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top]);

  await setWindowSize();
  runApp(const MyApp());
}

Future<void> setWindowSize() async {
  if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
    await DesktopWindow.setWindowSize(const Size(1000, 1000));
    await DesktopWindow.setMinWindowSize(const Size(300, 300));
    await DesktopWindow.setMaxWindowSize(const Size(1200, 1200));
    await DesktopWindow.setFullScreen(false);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppPageRoutes.home.routeName: (context) => const HomePage(),
        AppPageRoutes.first.routeName: (context) => const FirstPage(),
        AppPageRoutes.second.routeName: (context) => const SecondPage(),
        AppPageRoutes.third.routeName: (context) => const ThirdPage(),
        AppPageRoutes.doctor.routeName: (context) => const DoctorPage(),
        AppPageRoutes.account.routeName: (context) => const AccountView(),
        AppPageRoutes.wallet.routeName: (context) => const WalletPage(),
        AppPageRoutes.crypto.routeName: (context) => const CryptoView(),
        AppPageRoutes.doctorList.routeName: (context) =>
            const DoctorsListView(),
        AppPageRoutes.responsiveView.routeName: (context) =>
            const ResponsiveView(),
        AppPageRoutes.apple.routeName: (context) => const ApplePage(),
        AppPageRoutes.shopListView.routeName: (context) => const ShoplistView(),
        AppPageRoutes.gridPage.routeName: (context) => const GridPage()
      },
      initialRoute: AppPageRoutes.shopListView.routeName,
    );
  }
}
