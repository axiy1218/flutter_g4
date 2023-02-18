import 'package:flutter/material.dart';
import 'package:flutter_g4/utils/constants/constants.dart';

class AppTextWidget extends StatelessWidget {
  final String text;
  const AppTextWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.mediumText.copyWith(fontSize: 20),
    );
  }
}
