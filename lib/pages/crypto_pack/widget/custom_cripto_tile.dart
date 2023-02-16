import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_g4/model/crypto_tile_model.dart';
import 'package:flutter_g4/utils/constants/constants.dart';

class CriptoTile extends StatelessWidget {
  final CryptoTileModel cryptoTileModel;
  const CriptoTile({super.key, required this.cryptoTileModel});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return SizedBox(
      height: 88,
      width: double.infinity,
      child: ColoredBox(
        color: const Color(0xFFF9FAFF),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white),
                    alignment: Alignment.center,
                    child: Image.asset(
                      AppImages.yellowBitcoin,
                      width: 26,
                      height: 26,
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                        text: '${cryptoTileModel.name}\n',
                        style: AppTextStyles.mediumText.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(cryptoTileModel.color!.toInt())),
                        children: [
                          TextSpan(text: '${cryptoTileModel.precent}%')
                        ]),
                  ),
                )),
            Expanded(
                flex: 5,
                child: Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 28,
                    width: 70,
                    child: LineChart(
                      LineChartData(
                          minX: 0,
                          maxX: 10,
                          minY: 0,
                          maxY: 10,
                          extraLinesData:
                              ExtraLinesData(extraLinesOnTop: false),
                          borderData: FlBorderData(show: false),
                          titlesData: FlTitlesData(
                              show: false,
                              rightTitles: AxisTitles(
                                  axisNameWidget: const SizedBox.shrink(),
                                  sideTitles: SideTitles(showTitles: false)),
                              leftTitles: AxisTitles(
                                  axisNameWidget: const SizedBox.shrink(),
                                  sideTitles: SideTitles(showTitles: false))),
                          lineBarsData: [
                            LineChartBarData(
                                gradient: const LinearGradient(
                                    colors: [Colors.red, Colors.yellow]),
                                spots: List<FlSpot>.generate(
                                  10,
                                  (index) => FlSpot(index.toDouble(),
                                      random.nextDouble() * 10),
                                ),
                                dotData: FlDotData(show: false))
                          ]),
                    ),
                  ),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                        text: '\$${cryptoTileModel.price}\n',
                        style: AppTextStyles.mediumText.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text: '${cryptoTileModel.precent}%',
                            style: AppTextStyles.mediumText.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black26),
                          )
                        ]),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
