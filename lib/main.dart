import 'package:flutter/material.dart';
import 'package:flutter_g4/pages/animations_page/first/first_page.dart';
import 'package:flutter_g4/pages/animations_page/second_page/second_page.dart';
import 'package:flutter_g4/pages/animations_page/third_page/third_page.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppPageRoutes.home.routeName: (context) => const HomePage(),
        AppPageRoutes.first.routeName: (context) => const FirstPage(),
        AppPageRoutes.second.routeName: (context) => const SecondPage(),
        AppPageRoutes.third.routeName: (context) => const ThirdPage()
      },
      initialRoute: AppPageRoutes.home.routeName,
    );
  }
}
