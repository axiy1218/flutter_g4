import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_g4/model/crypto.dart';
import 'package:flutter_g4/utils/constants/constants.dart';

class CryptoCard extends StatelessWidget {
  final CryptoModel crypto;
  const CryptoCard({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5 / 1,
      child: Card(
        elevation: .0,
        color: AppColors.cryptoCardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CupertinoListTile(
                title: Text(
                  crypto.name.toUpperCase(),
                  style: AppTextStyles.mediumText.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                padding: EdgeInsets.zero,
                subtitle: Text(
                  'PORTFOLIO',
                  style: AppTextStyles.mediumText.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF292D32).withOpacity(.6)),
                ),
                trailing: Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(crypto.color!.toInt())),
                  alignment: Alignment.center,
                  child: Container(
                    height: 22,
                    width: 22,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(.5)),
                    alignment: Alignment.center,
                    child: Image.asset(crypto.logo!),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '\$${crypto.price}',
                    style: AppTextStyles.mediumText.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF292D32)),
                  ),
                  Text(
                    '+${crypto.precent}%',
                    style: AppTextStyles.mediumText.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF0CB1A0).withOpacity(.6)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
