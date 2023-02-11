import 'package:flutter/material.dart';
import 'package:flutter_g4/utils/constants/constants.dart';
import 'package:lottie/lottie.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third'),
      ),
      body: SafeArea(
        child: Center(
          child: Lottie.asset(AppLotties.astro,
              width: MediaQuery.of(context).size.width, reverse: true),
        ),
      ),
    );
  }
}
