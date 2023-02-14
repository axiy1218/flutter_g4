import 'package:flutter/material.dart';
import 'package:flutter_g4/model/bank_card_model.dart';
import 'package:flutter_g4/model/payment_model.dart';
import 'package:flutter_g4/pages/banking/account/bank_card_widget.dart';
import 'package:flutter_g4/pages/banking/account/custom_text.dart';
import 'package:flutter_g4/pages/banking/account/payment_widget.dart';
import 'package:flutter_g4/utils/constants/constants.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final List<BankCardModel?> _bankCards = [
    BankCardModel(colorCode: 0xFFFCC21B, price: 3047.89),
    BankCardModel(colorCode: 0xFF0131AF, price: 3047.89),
  ];

  final List<PaymentModel?> _payments = [
    const PaymentModel(
        colorNumber: 0xFFFBBC05,
        image: AppImages.dogFace,
        name: 'Pet',
        precent: 25,
        price: 232),
    const PaymentModel(
        colorNumber: 0xFFDC4747,
        image: AppImages.hotdog,
        name: 'Food',
        precent: 20,
        price: 250),
    const PaymentModel(
        colorNumber: 0xFFE93B81,
        image: AppImages.car,
        name: 'Transport',
        precent: 20,
        price: 300),
    const PaymentModel(
        colorNumber: 0xFF4285F4,
        image: AppImages.creditCard,
        name: 'Credit',
        precent: 15,
        price: 500)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My cash',
          style: AppTextStyles.mediumText.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.accountColor),
        ),
        elevation: .0,
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 17, top: 5),
            child: PhysicalModel(
              shadowColor: Colors.blueGrey,
              color: Colors.transparent,
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                  AppImages.avatar,
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xFFEFF3FF),
      body: SafeArea(
          child: _AccountBody(
        bankCards: _bankCards,
        payments: _payments,
      )),
    );
  }
}

//*-------------body
class _AccountBody extends StatelessWidget {
  final List<BankCardModel?>? bankCards;
  final List<PaymentModel?>? payments;
  const _AccountBody({required this.bankCards, required this.payments});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ALL CREDIT CARD',
                style: AppTextStyles.mediumText.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: AppColors.accountColor),
              ),
              const SizedBox(
                height: 36,
              ),

              //*-------------Separated
              SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: bankCards!.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 13,
                  ),
                  itemBuilder: (context, index) =>
                      BankCardWidget(bankCardModel: bankCards![index]),
                ),
              ),
              const SizedBox(
                height: 31,
              ),
              //*-------------Texts
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CustomTextWidget(
                      text: 'Days',
                      isSelected: false,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomTextWidget(
                      text: 'Week',
                      isSelected: true,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomTextWidget(
                      text: 'Month',
                      isSelected: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //*-------------grid view
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) =>
                        PaymentWidget(payment: payments![index]!)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
