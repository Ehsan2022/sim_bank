import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../SimCards/AWCC/awcc.dart';
import '../SimCards/Etisalat/etisalat.dart';
import '../SimCards/MTN/mtn.dart';
import '../SimCards/Roshan/roshan.dart';
import '../SimCards/Salam/salam.dart';

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
          height: 800,
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
              const Padding(
                padding: EdgeInsets.only(top: 28.0, bottom: 28),
                child: Center(
                  child: Text(
                    'Sim Cards',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 8, 63, 110),
                    ),
                  ),
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
                      image: 'images/Roshan.jpeg',
                      text: 'Roshan',
                    ),
                    SimContainer(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Etisalat()));
                      },
                      image: 'images/ets.png',
                      text: 'Etisalat',
                    ),
                    SimContainer(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MTN()));
                      },
                      image: 'images/mtn.png',
                      text: 'MTN',
                    ),
                    SimContainer(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Awcc()));
                      },
                      image: 'images/afgBisim.png',
                      text: 'AWCC',
                    ),
                    SimContainer(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Salam()));
                      },
                      image: 'images/salam.png',
                      text: 'Salam',
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
