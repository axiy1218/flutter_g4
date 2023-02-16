import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_g4/model/crypto.dart';
import 'package:flutter_g4/model/crypto_tile_model.dart';
import 'package:flutter_g4/pages/crypto_pack/widget/crypto_card.dart';
import 'package:flutter_g4/pages/crypto_pack/widget/custom_cripto_tile.dart';
import 'package:flutter_g4/utils/constants/constants.dart';

class CryptoView extends StatefulWidget {
  const CryptoView({super.key});

  @override
  State<CryptoView> createState() => _CryptoViewState();
}

class _CryptoViewState extends State<CryptoView> {
  final List<CryptoModel> _crypto = [
    CryptoModel(
        name: 'BTC',
        price: 10.123,
        precent: 8.1,
        logo: AppImages.bitCoin,
        color: AppColors.cryptoColor.value),
    const CryptoModel(
        name: 'ETH',
        price: 500,
        precent: 8.1,
        logo: AppImages.etherium,
        color: 0xFFDCDCDC),
    CryptoModel(
        name: 'BTC',
        price: 10.123,
        precent: 8.1,
        logo: AppImages.bitCoin,
        color: AppColors.cryptoColor.value),
    const CryptoModel(
        name: 'ETH',
        price: 500,
        precent: 8.1,
        logo: AppImages.etherium,
        color: 0xFFDCDCDC),
  ];

  final List<CryptoTileModel> _cryptoTile = [
    const CryptoTileModel(
        name: 'BTC',
        price: 10.123,
        precent: 8.1,
        logo: AppImages.bitCoin,
        color: 0xFFF7931A),
    const CryptoTileModel(
        name: 'ETH',
        price: 500,
        precent: 8.1,
        logo: AppImages.etherium,
        color: 0xFF54575B),
    const CryptoTileModel(
        name: 'BTC',
        price: 10.123,
        precent: 8.1,
        logo: AppImages.bitCoin,
        color: 0xFFF7931A),
    const CryptoTileModel(
        name: 'ETH',
        price: 500,
        precent: 8.1,
        logo: AppImages.etherium,
        color: 0xFF54575B),
  ];
  Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: .0,
        leadingWidth: 80,
        leading: const _CustomBorder(
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(AppImages.cryptoUser),
          ),
        ),
        actions: [
          _CustomBorder(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                AppImages.menu,
                width: 23,
              ),
            ),
          ),
          const SizedBox(
            width: 31,
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                children: [
                  //*-------------Card
                  Container(
                    height: 200,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 25),
                    decoration: BoxDecoration(
                        color: AppColors.cryptoColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Total balance',
                          style: AppTextStyles.mediumText.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '123.342,62',
                                style: AppTextStyles.mediumText.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'BTC',
                                style: AppTextStyles.mediumText.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0x99ffffff)),
                              )
                            ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '120.234,21',
                          style: AppTextStyles.mediumText.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: CupertinoButton(
                            color: Colors.white,
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            child: Text(
                              'Sell',
                              style: AppTextStyles.mediumText
                                  .copyWith(color: AppColors.cryptoColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 34,
                  ),
                  //*-------------List tile

                  CupertinoListTile(
                    title: const Text('My Portfolio'),
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    trailing: OutlinedButton(
                        onPressed: () {}, child: const Text('See all')),
                  ),

                  //*-------------List view horizontal
                  SizedBox(
                    height: 140,
                    child: ListView.separated(
                        itemCount: _crypto.length,
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 14,
                            ),
                        itemBuilder: (context, index) => CryptoCard(
                              crypto: _crypto[index],
                            )),
                  ), //*-------------list

                  const SizedBox(
                    height: 34,
                  ),
                  CupertinoListTile(
                    title: const Text('My Portfolio'),
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    trailing: OutlinedButton(
                        onPressed: () {}, child: const Text('See all')),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  //*-------------list tile body

                  ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: _cryptoTile.length,
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 16,
                          ),
                      itemBuilder: (context, index) =>
                          CriptoTile(cryptoTileModel: _cryptoTile[index]))
                ],
              ),
            )),
      ),
    );
  }
}

class _CustomBorder extends StatelessWidget {
  final Widget child;
  const _CustomBorder({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 32),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          shape: BoxShape.circle),
      padding: const EdgeInsets.all(5),
      child: child,
    );
  }
}
