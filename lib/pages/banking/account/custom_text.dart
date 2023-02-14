import 'package:flutter/material.dart';
import 'package:flutter_g4/utils/constants/constants.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  const CustomTextWidget(
      {super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.mediumText.copyWith(
          color: isSelected
              ? AppColors.accountColor
              : AppColors.accountColor.withOpacity(.5),
          fontSize: 16,
          fontWeight: FontWeight.w700),
    );
  }
}
