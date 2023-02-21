import 'package:flutter/material.dart';

class ShoplistView extends StatefulWidget {
  const ShoplistView({super.key});

  @override
  State<ShoplistView> createState() => _ShoplistViewState();
}

class _ShoplistViewState extends State<ShoplistView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 13),
            child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator.adaptive()),
          ),
          SizedBox(
              width: 100,
              child: Slider.adaptive(value: .3, onChanged: (value) {}))
        ],
      ),
      body: SafeArea(
        child: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return portraitView();
          }
          return landscapeView();
        }),
      ),
    );
  }
}

Widget portraitView() {
  return GridView.count(
    shrinkWrap: true,
    crossAxisCount: 3,
    children: List<Widget>.generate(30, (index) => const FlutterLogo()),
  );
}

Widget landscapeView() {
  return GridView.count(
    crossAxisCount: 5,
    shrinkWrap: true,
    children: List<Widget>.generate(30, (index) => const FlutterLogo()),
  );
}
