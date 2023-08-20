import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 63, 110),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            size: 25,
            color: Color.fromARGB(255, 8, 63, 110),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 25),
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
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 38),
                child: Center(
                  child: Text(
                    'About',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 8, 63, 110),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Text(
                  'App Developer:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                title: Text(
                  "Mohammad Ehsan Nicksarisht",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Text(
                  'Version:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                title: Text(
                  "0.0.1",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "SimBank is an app for accessing different packages of all sim card available in Afghanistan.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
