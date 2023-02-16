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

  static TextStyle mediumTextCoco() {
    return const TextStyle(
        fontFamily: 'Coco',
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black);
  }
}

class AppImages {
  static const String _base = 'assets/image/';
  static const doctor = '${_base}doctor.png';
  static const avatar = '${_base}account.png';
  static const dogFace = '${_base}dog_face.png';
  static const hotdog = '${_base}hotdog.png';
  static const car = '${_base}car.png';
  static const creditCard = '${_base}credit_card.png';
  static const cryptoUser = '${_base}crypto_user.png';
  static const menu = '${_base}menu.png';
  static const bitCoin = '${_base}bit.png';
  static const etherium = '${_base}ethir.png';

  static const yellowBitcoin = '${_base}yellow_bitcoin.png';
}

class AppColors {
  static const avatarColor = Color(0xffefe7fe);
  static const badgeColor = Color(0xFF8EF4BC);
  static const professionColor = Color(0xFF7D8BB7);
  static const statisticsColor = Color(0xFFB28CFF);
  static const reviewColor = Color(0xFFFF9A9A);
  static const accountColor = Color(0xFF0131AF);
  static const cryptoColor = Color(0xFF5149F7);
  static const cryptoCardColor = Color(0xFFF9FAFF);
}
