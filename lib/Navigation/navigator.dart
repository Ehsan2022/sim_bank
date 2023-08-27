import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sim_bank/translations/locale_keys.dart';
import '../Screens/home.dart';
import '../Screens/links.dart';
import '../Screens/settings.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex = 1;

  List<Widget> body = [
    const Settings(),
    const Home(),
    const Links(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 8, 63, 110),
        body: body[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          unselectedItemColor: Colors.grey.shade400,
          selectedItemColor: Colors.white,
          selectedFontSize: 16,
          selectedIconTheme: const IconThemeData(size: 40),
          elevation: 0,
          iconSize: 32,
          currentIndex: currentIndex,
          onTap: (newIndex) {
            setState(() {
              currentIndex = newIndex;
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
