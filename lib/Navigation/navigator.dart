import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../Screens/home.dart';
import '../Screens/profile.dart';
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
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 133, 179, 232),
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        unselectedItemColor: const Color.fromARGB(255, 8, 63, 110),
        selectedItemColor: Colors.black,
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
