import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

import '../translations/locale_keys.dart';

class Links extends StatefulWidget {
  const Links({Key? key}) : super(key: key);

  @override
  State<Links> createState() => _LinksState();
}

class _LinksState extends State<Links> {
  var eNumbersCollection = FirebaseFirestore.instance.collection("eNumbers");
  List eNumberItems = [];
  List eNumbers = [];

  Future getENumbers() async {
    try {
      await eNumbersCollection.get().then((value) {
        for (var element in value.docs) {
          eNumberItems.add(element.data());
        }
      });
      return eNumberItems;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  fetchEnumbers() async {
    dynamic resultant = await getENumbers();
    if (resultant == null) {
      print("no data available!");
    } else {
      setState(() {
        eNumbers = resultant;
      });
    }
  }

  var pWesCollection = FirebaseFirestore.instance.collection("pWebs");
  List pWebItems = [];
  List pWebs = [];

  Future getPwebs() async {
    try {
      await pWesCollection.get().then((value) {
        for (var element in value.docs) {
          pWebItems.add(element.data());
        }
      });
      return pWebItems;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  fetchPwebs() async {
    dynamic resultant2 = await getPwebs();
    if (resultant2 == null) {
      print("no data available!");
    } else {
      setState(() {
        pWebs = resultant2;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      fetchPwebs();
      fetchEnumbers();
    });
  }

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
                    LocaleKeys.links.tr(),
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
                          Icons.link,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5),
                      child: GestureDetector(
                        onTap: () {
                          Alert(
                            style: AlertStyle(
                              isButtonVisible: false,
                              titleStyle: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                              backgroundColor:
                                  const Color.fromARGB(255, 8, 63, 110),
                            ),
                            context: context,
                            title: LocaleKeys.emergencyNumbers.tr(),
                            content: Padding(
                              padding: const EdgeInsets.only(top: 38.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 20.0, // soften the shadow
                                      spreadRadius: 5.0, //extend the shadow
                                    )
                                  ],
                                ),
                                height: 400.0, // Change as per your requirement
                                width: 300, // Change as per your requirement
                                child: ListView.separated(
                                  itemCount: eNumbers.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(
                                        eNumbers[index]["name"] ?? "Not Given",
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 8, 63, 110),
                                        ),
                                      ),
                                      subtitle: Text(
                                        "${LocaleKeys.phone.tr()}: ${eNumbers[index]["phone"] ?? "Not Given"}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 8, 63, 110),
                                        ),
                                      ),
                                      trailing: IconButton(
                                          onPressed: () {
                                            launch(
                                                'tel:${eNumbers[index]["phone"] ?? "Not Given"}');
                                          },
                                          icon: const Icon(
                                            Icons.phone_forwarded,
                                            size: 30,
                                            color: CupertinoColors.activeGreen,
                                          )),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const Divider(
                                      thickness: 1,
                                      color: Colors.grey,
                                    );
                                  },
                                ),
                              ),
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
                          child: Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.contact_phone_outlined,
                                  size: 34,
                                  color: Colors.red,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                    LocaleKeys.emergencyNumbers.tr(),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5),
                      child: GestureDetector(
                        onTap: () {
                          Alert(
                            style: AlertStyle(
                              isButtonVisible: false,
                              titleStyle: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                              backgroundColor:
                                  const Color.fromARGB(255, 8, 63, 110),
                            ),
                            context: context,
                            title: LocaleKeys.popularWebs.tr(),
                            content: Padding(
                              padding: const EdgeInsets.only(top: 38.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 20.0, // soften the shadow
                                      spreadRadius: 5.0, //extend the shadow
                                    )
                                  ],
                                ),
                                height: 400.0, // Change as per your requirement
                                width: 300, // Change as per your requirement
                                child: ListView.separated(
                                  itemCount: pWebItems.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text(
                                        pWebItems[index]["name"],
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 8, 63, 110),
                                        ),
                                      ),
                                      subtitle: Text(
                                        pWebItems[index]["category"],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 8, 63, 110),
                                        ),
                                      ),
                                      trailing: IconButton(
                                          onPressed: () {
                                            launch('https://varzesh3.com/');
                                          },
                                          icon: const Icon(
                                            CupertinoIcons.search_circle,
                                            size: 40,
                                            color: CupertinoColors.activeGreen,
                                          )),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const Divider(
                                      thickness: 1,
                                      color: Colors.grey,
                                    );
                                  },
                                ),
                              ),
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
                          child: Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.web,
                                  size: 34,
                                  color: Colors.blue,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                    LocaleKeys.popularWebs.tr(),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5),
                      child: GestureDetector(
                        onTap: () {
                          Alert(
                              style: AlertStyle(
                                isButtonVisible: false,
                                titleStyle: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                                backgroundColor:
                                    const Color.fromARGB(255, 8, 63, 110),
                              ),
                              context: context,
                              title: LocaleKeys.historicalPlaces.tr(),
                              desc: LocaleKeys.comingSoon.tr(),
                              content: const SpinKitThreeBounce(
                                color: Colors.green,
                              )).show();
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
                          child: Row(
                            children: [
                              const Expanded(
                                  flex: 1,
                                  child: Icon(
                                    Icons.castle_outlined,
                                    color: CupertinoColors.activeGreen,
                                    size: 35,
                                  )),
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                    LocaleKeys.historicalPlaces.tr(),
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
