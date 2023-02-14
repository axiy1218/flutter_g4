import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_g4/utils/constants/constants.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'MY WALLET',
                        style: AppTextStyles.mediumText.copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: AppColors.accountColor),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Text(
                        'Owning your money',
                        style: AppTextStyles.mediumText.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: _CustomTextField(
                                controller: TextEditingController(),
                                hintText: 'Login')),
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: _CustomTextField(
                                controller: TextEditingController(),
                                hintText: 'Password')),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: TextButton(
                            onPressed: () {},
                            child: const Text('forget password')),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: CupertinoButton(
                              color: AppColors.accountColor,
                              borderRadius: BorderRadius.circular(15),
                              onPressed: () {},
                              child: Text(
                                'Connection'.toUpperCase(),
                                style: AppTextStyles.mediumText.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'sign up',
                            style: AppTextStyles.mediumText.copyWith(
                                decoration: TextDecoration.underline,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.accountColor),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ))),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  const _CustomTextField({required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFEFF3FF),
            hintText: hintText,
            enabled: true,
            hintStyle: AppTextStyles.mediumText.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.accountColor),
            border: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: .0, color: Colors.transparent),
                borderRadius: BorderRadius.circular(15)),
            disabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: .0, color: Colors.transparent),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: .0, color: Colors.transparent),
                borderRadius: BorderRadius.circular(15)),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: .0, color: Colors.transparent),
                borderRadius: BorderRadius.circular(15))));
  }
}
