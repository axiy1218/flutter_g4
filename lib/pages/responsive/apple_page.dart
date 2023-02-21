import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ApplePage extends StatefulWidget {
  const ApplePage({super.key});

  @override
  State<ApplePage> createState() => _ApplePageState();
}

class _ApplePageState extends State<ApplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PlatformMenuBar(
      menus: [
        PlatformMenu(label: 'Qonun qoidalar', menus: [
          PlatformMenuItem(
            label: 'haqida',
            onSelected: () => debugPrint('Haqoda'),
          ),
          PlatformMenuItem(
            label: 'Dastur sozlamalari',
            onSelected: () {
              debugPrint('DAstur sozlamalari ishga tushirildi');
            },
            shortcut:
                const SingleActivator(LogicalKeyboardKey.digit2, meta: true),
          ),
          const PlatformMenuItem(label: 'chiqish'),
          const PlatformMenuItemGroup(members: [
            PlatformMenuItem(label: 'korinish'),
            PlatformMenuItem(label: 'Flutter g4'),
          ]),
        ]),
      ],
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 400) {
          return desktopBody();
        }
        return mobileBody();
      }),
    ));
  }
}

Widget mobileBody() {
  return Scaffold(
    appBar: AppBar(),
    drawer: const Drawer(
      backgroundColor: Colors.blue,
    ),
  );
}

Widget desktopBody() {
  return Row(
    children: [
      const Expanded(
          flex: 4,
          child: Drawer(
            backgroundColor: Colors.blue,
          )),
      Expanded(
          flex: 8,
          child: Container(
            color: Colors.green,
          ))
    ],
  );
}
