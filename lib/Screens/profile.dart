import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sim_bank/Navigation/navigator.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Container(
          height: 800,
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
                padding: EdgeInsets.only(top: 28.0, bottom: 8),
                child: Center(
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 8, 63, 110),
                    ),
                  ),
                ),
              ),
              Padding(
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
                          CupertinoIcons.profile_circled,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 2,
                indent: 150,
                endIndent: 150,
              ),
              Padding(
                padding: EdgeInsets.all(28.0),
                child: Center(
                  child: ListTile(
                    title: Center(
                      child: Text(
                        "Mohammad Ehsan Nicksarisht",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 8, 63, 110),
                        ),
                      ),
                    ),
                    subtitle: Center(
                      child: Text(
                        "0790234314",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 8, 63, 110),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
