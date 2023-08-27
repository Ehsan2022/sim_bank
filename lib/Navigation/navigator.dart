import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sim_bank/translations/locale_keys.dart';
import '../Screens/home.dart';
import '../Screens/links.dart';
import '../Screens/settings.dart';

class NavigationScreen extends StatefulWidget {
  NavigationScreen({super.key, required this.screenIndex});

  static const String id = '/navigation';
  late int screenIndex;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List<Widget> body = [
    const Settings(),
    const Home(),
    const Links(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 8, 63, 110),
        body: body[widget.screenIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          unselectedItemColor: Colors.grey.shade400,
          selectedItemColor: Colors.white,
          selectedFontSize: 16,
          selectedIconTheme: const IconThemeData(size: 40),
          elevation: 0,
          iconSize: 32,
          currentIndex: widget.screenIndex,
          onTap: (newIndex) {
            setState(() {
              widget.screenIndex = newIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings_outlined),
              label: LocaleKeys.settings.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              label: LocaleKeys.home.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.profile_circled),
              label: LocaleKeys.links.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
