import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Salam extends StatefulWidget {
  const Salam({Key? key}) : super(key: key);

  @override
  State<Salam> createState() => _SalamState();
}

class _SalamState extends State<Salam> {
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
        padding: const EdgeInsets.only(top: 25,bottom: 25),
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
                padding: EdgeInsets.only(top: 28.0,bottom: 28),
                child: Center(
                  child: Text(
                    'Salam',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 8, 63, 110),
                    ),
                  ),
                ),
              ),
              Packages(
                  text: 'Internet',
                  onPressed: () {},
                  icon: Icons.wifi,
                  enterIcon: CupertinoIcons.right_chevron),
              Packages(
                  text: 'Call',
                  onPressed: () {},
                  icon: Icons.wifi_calling_3_outlined,
                  enterIcon: CupertinoIcons.right_chevron),
              Packages(
                  text: 'Message',
                  onPressed: () {},
                  icon: Icons.email_outlined,
                  enterIcon: CupertinoIcons.right_chevron),
            ],
          ),
        ),
      ),
    );
  }
}


class Packages extends StatelessWidget {
  const Packages(
      {super.key,
        required this.text,
        required this.onPressed,
        required this.icon,
        required this.enterIcon});
  final IconData icon;
  final IconData enterIcon;
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
              color: Colors.white, borderRadius: BorderRadius.circular(10),
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
                child: Icon(icon,size: 30,color: const Color.fromARGB(255, 8, 63, 110),),
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
              Expanded(
                flex: 1,
                child: Icon(enterIcon,color: const Color.fromARGB(255, 8, 63, 110),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
