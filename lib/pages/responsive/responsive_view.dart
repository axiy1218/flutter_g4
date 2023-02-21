import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ResponsiveView extends StatefulWidget {
  const ResponsiveView({super.key});

  @override
  State<ResponsiveView> createState() => _ResponsiveViewState();
}

class _ResponsiveViewState extends State<ResponsiveView> {
  MediaQueryData? _mediaQueryData;
  final globalKey = GlobalKey();
  @override
  void didChangeDependencies() {
    _mediaQueryData = MediaQuery.of(context);
    debugPrint('DID CHANGE');

    SchedulerBinding.instance.addPostFrameCallback(postFrameCallBack);

    super.didChangeDependencies();
  }

//*-------------
  void postFrameCallBack(Duration time) {
    var context = globalKey.currentContext;
    RenderBox box = context!.findRenderObject() as RenderBox;
    debugPrint("SALOM:::${box.size}");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('BUILD');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Salom',
          key: globalKey,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: _mediaQueryData!.size.width * 0.2,
            height: _mediaQueryData!.size.width * 0.2,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
