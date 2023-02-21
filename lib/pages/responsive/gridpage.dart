import 'package:flutter/material.dart';

class GridPage extends StatefulWidget {
  const GridPage({super.key});

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GridView.extent(
        shrinkWrap: true,
        maxCrossAxisExtent: 200,
        children: List<Widget>.generate(20, (index) => const FlutterLogo()),
      )),
    );
  }
}
