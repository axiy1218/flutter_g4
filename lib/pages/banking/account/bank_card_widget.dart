import 'package:flutter/material.dart';
import 'package:flutter_g4/model/bank_card_model.dart';
import 'package:flutter_g4/utils/constants/constants.dart';

class BankCardWidget extends StatelessWidget {
  final BankCardModel? bankCardModel;
  const BankCardWidget({super.key, required this.bankCardModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      margin: EdgeInsets.zero,
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            //*-------------Card Body
            SizedBox(
              height: 200,
              width: 330,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 17, top: 24, bottom: 17, right: 16),
                decoration: BoxDecoration(
                    color: Color(bankCardModel!.colorCode!),
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 70,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 70,
                            decoration: BoxDecoration(
                                color: const Color(0xFFD1D9D9),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          SizedBox(
                            height: 26,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 13,
                                  backgroundColor:
                                      const Color(0xFFC4C4C4).withOpacity(.5),
                                ),
                                Transform.translate(
                                    offset: const Offset(-13, 0),
                                    child: CircleAvatar(
                                      radius: 13,
                                      backgroundColor: const Color(0xFFC4C4C4)
                                          .withOpacity(.5),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'Balance',
                      style: AppTextStyles.mediumText.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Text(
                      '${bankCardModel!.price} €',
                      style: AppTextStyles.mediumText.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            //*-------------Border widget
            Positioned(
                bottom: -27,
                right: -59,
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.white)),
                )),

            Positioned(
                bottom: -27,
                right: -93,
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.white)),
                )),
            Positioned(
                bottom: -72,
                right: -36,
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.white)),
                )),
          ],
        ),
      ),
    );
  }
}
