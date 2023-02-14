import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLotties {
  static const _base = 'assets/lottie/';
  static const astro = '${_base}astronot.json';
}

class AppTextStyles {
  static TextStyle get mediumText {
    return GoogleFonts.poppins(
        fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black);
  }
}

class AppImages {
  static const _base = 'assets/image/';
  static const doctor = '${_base}doctor.png';
  static const avatar = '${_base}account.png';
  static const dogFace = '${_base}dog_face.png';
  static const hotdog = '${_base}hotdog.png';
  static const car = '${_base}car.png';
  static const creditCard = '${_base}credit_card.png';
}

class AppColors {
  static const avatarColor = Color(0xffefe7fe);
  static const badgeColor = Color(0xFF8EF4BC);
  static const professionColor = Color(0xFF7D8BB7);
  static const statisticsColor = Color(0xFFB28CFF);
  static const reviewColor = Color(0xFFFF9A9A);
  static const accountColor = Color(0xFF0131AF);
}
