import 'package:flutter/material.dart';
import 'package:flutter_g4/utils/routes/app_routes.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _count = 0;
  Alignment _alignment = Alignment.centerRight;

  EdgeInsetsGeometry _padding = const EdgeInsets.all(20);

  double _opacity = 1;

  double _position = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First'),
        actions: [
          //*-------------check

          FloatingActionButton.small(
            heroTag: 'animated positioned',
            onPressed: () {
              if (_position == 10) {
                _position = -100;
                setState(() {});
              } else {
                _position = 10;
                setState(() {});
              }
            },
            child: const Icon(Icons.play_arrow),
          ),
          //*-------------check

          FloatingActionButton.small(
            heroTag: '1',
            onPressed: () {
              _count++;
              setState(() {});
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton.small(
            heroTag: '2',
            onPressed: () {
              _count--;
              setState(() {});
            },
            child: const Icon(Icons.remove),
          )
        ],
      ),
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //& animated switcher
                AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  switchInCurve: Curves.easeIn,
                  switchOutCurve: Curves.bounceOut,
                  transitionBuilder: (child, animation) => ScaleTransition(
                    scale: animation,
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  ),
                  child: Text(
                    _count.toString(),
                    key: ValueKey<int>(_count),
                    style: const TextStyle(
                        fontSize: 50, fontWeight: FontWeight.w600),
                  ),
                ),

                //& animated Align
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(seconds: 1),
                  child: GestureDetector(
                    onTap: () {
                      if (_alignment == Alignment.centerRight) {
                        _alignment = Alignment.centerLeft;
                        setState(() {});
                      } else {
                        _alignment = Alignment.centerRight;
                        setState(() {});
                      }
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      color: Colors.red,
                    ),
                  ),
                ),
                //? animated padding
                InkWell(
                  onTap: () {
                    if (_padding == const EdgeInsets.all(20)) {
                      _padding = const EdgeInsets.all(60);
                      setState(() {});
                    } else {
                      _padding = const EdgeInsets.all(20);
                      setState(() {});
                    }
                  },
                  child: ColoredBox(
                    color: Colors.blue,
                    child: AnimatedPadding(
                      padding: _padding,
                      duration: const Duration(seconds: 1),
                    ),
                  ),
                ),

                //& opacity

                InkWell(
                  onTap: () {
                    if (_opacity == 1) {
                      _opacity = 0;
                      setState(() {});
                    } else {
                      _opacity = 1;
                      setState(() {});
                    }
                  },
                  child: AnimatedOpacity(
                    opacity: _opacity,
                    duration: const Duration(seconds: 1),
                    child: const FlutterLogo(size: 150),
                  ),
                )
              ],
            ),
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              curve: Curves.bounceIn,
              bottom: _position,
              left: 10,
              right: 10,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(AppPageRoutes.second.routeName);
                  },
                  child: const Text('Elevated Button')),
            )
          ],
        ),
      )),
    );
  }
}
