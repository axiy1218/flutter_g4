import 'package:flutter/material.dart';
import 'package:flutter_g4/pages/animations_page/third_page/third_page.dart';
import 'package:flutter_g4/utils/routes/animated_routes.dart';
import 'package:flutter_g4/utils/routes/app_routes.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Flutter G4',
                style: GoogleFonts.jockeyOne(
                  fontSize: 35,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Flutter G4',
                style: TextStyle(fontSize: 35, fontFamily: 'Arch'),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(AppPageRoutes.first.routeName);
                  },
                  child: const Text('First Page')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(CustomAnimationPageRouteBuilder(
                        child: const ThirdPage()));
                  },
                  child: const Text('Third Page')),
            ],
          ),
        ),
      ),
    );
  }
}
