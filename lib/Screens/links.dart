import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Links extends StatelessWidget {
  const Links({Key? key}) : super(key: key);

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
                    'Links',
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5),
                      child: GestureDetector(
                        onTap: () {
                          Alert(
                            context: context,
                            title: "Emergency Numbers",
                            content: ListView(
                              children: [
                                ListTile(
                                  title: Text("data"),
                                )
                              ],
                            ),
                          ).show();
                        },
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
                          child: const Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.contact_phone_outlined,
                                  size: 30,
                                  color: Colors.red,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                    "Emergency Numbers",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 8, 63, 110)),
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Icon(
                                    CupertinoIcons.right_chevron,
                                    color: Color.fromARGB(255, 8, 63, 110),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5),
                      child: GestureDetector(
                        onTap: () {},
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
                          child: const Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.web,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                    "Popular Webs",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 8, 63, 110)),
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Icon(
                                    CupertinoIcons.right_chevron,
                                    color: Color.fromARGB(255, 8, 63, 110),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5),
                      child: GestureDetector(
                        onTap: () {},
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
                                  child: SpinKitThreeBounce(
                                    color: Colors.green,
                                    size: 30,
                                  )),
                              const Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                    "Historical Places",
                                    style: TextStyle(
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
      required this.text,
      required this.onPressed,
      required this.logo});

  final IconData logo;
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
                child: Icon(
                  logo,
                  size: 30,
                  color: const Color.fromARGB(255, 8, 63, 110),
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
