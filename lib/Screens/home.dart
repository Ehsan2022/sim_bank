import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../SimCards/AWCC/awcc.dart';
import '../SimCards/Etisalat/etisalat.dart';
import '../SimCards/MTN/mtn.dart';
import '../SimCards/Roshan/roshan.dart';
import '../SimCards/Salam/salam.dart';
import '../translations/locale_keys.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Container(
          height: 1300,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 20.0, // soften the shadow
                spreadRadius: 5.0, //extend the shadow
              )
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28.0, bottom: 28),
                child: Center(
                  child: Text(
                    LocaleKeys.simCards.tr(),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 8, 63, 110),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 12.0),
                child: Center(
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Color.fromARGB(255, 8, 63, 110),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Color.fromARGB(255, 8, 63, 110),
                        child: Icon(
                          Icons.sim_card_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 18.0),
                child: Divider(
                  color: Colors.grey,
                  thickness: 2,
                  indent: 150,
                  endIndent: 150,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    SimContainer(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Roshan()));
                      },
                      image: 'assets/Roshan.jpeg',
                      text: LocaleKeys.roshan.tr(),
                    ),
                    SimContainer(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Etisalat()));
                      },
                      image: 'assets/ets.png',
                      text: LocaleKeys.etisalat.tr(),
                    ),
                    SimContainer(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MTN()));
                      },
                      image: 'assets/mtn.png',
                      text: LocaleKeys.mtn.tr(),
                    ),
                    SimContainer(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Awcc()));
                      },
                      image: 'assets/afgBisim.png',
                      text: LocaleKeys.awcc.tr(),
                    ),
                    SimContainer(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Salam()));
                      },
                      image: 'assets/salam.png',
                      text: LocaleKeys.salam.tr(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SimContainer extends StatelessWidget {
  const SimContainer(
      {super.key,
      required this.image,
      required this.text,
      required this.onPressed});

  final String image;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0, // soften the shadow
                spreadRadius: 2.0, //extend the shadow
              )
            ],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  image,
                  height: 60,
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 8, 63, 110)),
                  ),
                ),
              ),
              const Expanded(
                  flex: 1,
                  child: Icon(
                    CupertinoIcons.right_chevron,
                    color: Color.fromARGB(255, 8, 63, 110),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
