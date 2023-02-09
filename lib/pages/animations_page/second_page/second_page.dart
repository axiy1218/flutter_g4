import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController? _animationController;

  late final Animation<double>? _animation;

  late final Animation<Offset>? _offsetAnimation;

  late final Animation<Color?>? _colorAnimation;

  final Tween<double> _tween = Tween(begin: 0, end: 1);

  final Tween<Offset> _offsetTween =
      Tween(begin: Offset.zero, end: const Offset(0, 1));

  final ColorTween _colorTween =
      ColorTween(begin: Colors.blue, end: Colors.red);

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = _tween.animate(_animationController!);
    _offsetAnimation = _offsetTween.animate(_animationController!);
    _colorAnimation = _colorTween.animate(_animationController!);
    _animationController!.addStatusListener((status) {
      debugPrint('ANIMATION STATUS:::$status');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second'),
      ),
      body: SafeArea(
        child: AnimatedBuilder(
            animation: _colorAnimation!,
            builder: (context, _) {
              return Container(
                color: _colorAnimation!.value,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //*fade transition
                    FadeTransition(
                      opacity: _animation!,
                      child: const FlutterLogo(
                        size: 80,
                      ),
                    ),
                    //*rotation transition
                    RotationTransition(
                      turns: _animation!,
                      child: const FlutterLogo(
                        size: 70,
                      ),
                    ),
                    //*scale transition
                    ScaleTransition(
                      scale: _animation!,
                      child: const FlutterLogo(
                        size: 80,
                      ),
                    ),

                    //*slide transition
                    SlideTransition(
                      position: _offsetAnimation!,
                      child: const FlutterLogo(
                        size: 100,
                      ),
                    ),
                    //* size transition
                    LimitedBox(
                      maxHeight: 100,
                      maxWidth: 100,
                      child: SizeTransition(
                        sizeFactor: _animation!,
                        child: const FlutterLogo(size: 100),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animationController!.status == AnimationStatus.completed
              ? _animationController!.reverse()
              : _animationController!.forward();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
