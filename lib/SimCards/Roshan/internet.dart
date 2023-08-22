import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Internet extends StatefulWidget {
  const Internet({super.key});

  @override
  State<Internet> createState() => _InternetState();
}

class _InternetState extends State<Internet>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 8, 63, 110),
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 8, 63, 110),
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 11.0),
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
            automaticallyImplyLeading: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            backgroundColor: Colors.grey.shade300,
            centerTitle: true,
            title: const Text(
              'Roshan-Internet',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 8, 63, 110),
              ),
            ),
            bottom: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(5), // Creates border
                color: const Color.fromARGB(255, 8, 63, 110),
              ),
              unselectedLabelColor: const Color.fromARGB(255, 8, 63, 110),
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              physics: const ScrollPhysics(),
              tabs: const [
                Tab(
                  child: Text(
                    'Daily',
                  ),
                ),
                Tab(
                  child: Text(
                    'Weekly',
                  ),
                ),
                Tab(
                  child: Text(
                    'Monthly',
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: const [
              Daily(),
              Weekly(),
              Monthly(),
            ],
          ),
        ),
      ),
    );
  }
}

class Daily extends StatefulWidget {
  const Daily({Key? key}) : super(key: key);

  @override
  State<Daily> createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  var collection = FirebaseFirestore.instance.collection("packages");
  late List items;
  bool isLoaded = false;

  Future getPackageList() async {
    List tempList = [];
    var data = await collection.get();
    data.docs.forEach((element) {
      tempList.add(element.data());
    });
    setState(() {
      items = tempList;
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: isLoaded
                  ? ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PackageCard(
                          price: 5,
                          duration: 'njjn',
                          activation: 'jj',
                          deactivation: 'kk',
                          bundle: 'll',
                          active: () {
                            buildAlert(context, "OK", "Do you want to active?",
                                    "S5")
                                .show();
                          },
                          deactive: () {
                            buildAlert(context, "OK",
                                    "Do you want to deactive?", "US5")
                                .show();
                          },
                        );
                      },
                      // PackageCard(
                      //   bundle: '50 MB',
                      //   price: 5,
                      //   duration: '1 day(s)',
                      //   activation: "S5 to 555",
                      //   deactivation: 'US5 to 555',
                      //   active: () {
                      //     buildAlert(context, "OK", "Do you want to active?", "S5")
                      //         .show();
                      //   },
                      //   deactive: () {
                      //     buildAlert(
                      //             context, "OK", "Do you want to deactive?", "US5")
                      //         .show();
                      //   },
                      // ),
                      // PackageCard(
                      //   bundle: '200 MB',
                      //   price: 30,
                      //   duration: '1 day(s)',
                      //   activation: "D200 to 555",
                      //   deactivation: 'UD200 to 555',
                      //   active: () {
                      //     buildAlert(
                      //             context, "OK", "Do you want to active?", "D200")
                      //         .show();
                      //   },
                      //   deactive: () {
                      //     buildAlert(context, "OK", "Do you want to deactive?",
                      //             "UD200")
                      //         .show();
                      //   },
                      // ),
                      // PackageCard(
                      //   bundle: '1 GB',
                      //   price: 50,
                      //   duration: '1 day(s)',
                      //   activation: "D1 to 555",
                      //   deactivation: 'UD1 to 555',
                      //   active: () {
                      //     buildAlert(context, "OK", "Do you want to active?", "D1")
                      //         .show();
                      //   },
                      //   deactive: () {
                      //     buildAlert(
                      //             context, "OK", "Do you want to deactive?", "UD1")
                      //         .show();
                      //   },
                      // ),
                      // PackageCard(
                      //   bundle: '3 GB',
                      //   price: 90,
                      //   duration: '1 day(s)',
                      //   activation: "3GB to 555",
                      //   deactivation: 'U3GB to 555',
                      //   active: () {
                      //     buildAlert(context, "OK", "Do you want to active?", "3GB")
                      //         .show();
                      //   },
                      //   deactive: () {
                      //     buildAlert(
                      //             context, "OK", "Do you want to deactive?", "U3GB")
                      //         .show();
                      //   },
                      // ),
                    )
                  : Text("no data"),
            ),
          ],
        ),
      ),
    );
  }

  Alert buildAlert(BuildContext context, String ok, String description,
      String activationCode) {
    return Alert(
      context: context,
      type: AlertType.info,
      desc: description,
      buttons: [
        DialogButton(
          onPressed: () {
            launch('sms:555?body=$activationCode');
            Navigator.pop(context);
          },
          width: 120,
          child: Text(
            ok,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    );
  }
}

class Weekly extends StatelessWidget {
  const Weekly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  PackageCard(
                    bundle: '10 GB',
                    price: 800,
                    duration: '1 week(s)',
                    activation: "2231 to 888",
                    deactivation: '1020 to 888',
                    active: () {},
                    deactive: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Monthly extends StatelessWidget {
  const Monthly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  PackageCard(
                    bundle: '10 GB',
                    price: 1000,
                    duration: '1 month(s)',
                    activation: "2231 to 888",
                    deactivation: '1020 to 888',
                    active: () {},
                    deactive: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  const PackageCard({
    super.key,
    required this.price,
    required this.duration,
    required this.activation,
    required this.deactivation,
    required this.bundle,
    required this.active,
    required this.deactive,
  });

  final String bundle;
  final int price;
  final String duration;
  final String activation;
  final String deactivation;
  final Function() active;
  final Function() deactive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
              )
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 8, 63, 110),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0, // soften the shadow
                        spreadRadius: 1.0, //extend the shadow
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      bundle,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(
                  CupertinoIcons.money_dollar,
                  size: 30,
                  color: Color.fromARGB(255, 8, 63, 110),
                ),
                const Text(
                  "Price : ",
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 8, 63, 110)),
                ),
                Text(
                  '$price AFs',
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 8, 63, 110)),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(
                  CupertinoIcons.time,
                  size: 30,
                  color: Color.fromARGB(255, 8, 63, 110),
                ),
                const Text(
                  "Duration : ",
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 8, 63, 110)),
                ),
                Text(
                  duration,
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 8, 63, 110)),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(
                  Icons.done,
                  size: 30,
                  color: Color.fromARGB(255, 8, 63, 110),
                ),
                const Text(
                  "Activation Code : ",
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 8, 63, 110)),
                ),
                Text(
                  activation,
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 8, 63, 110)),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(
                  Icons.close,
                  size: 30,
                  color: Color.fromARGB(255, 8, 63, 110),
                ),
                const Text(
                  "Deactivation Code : ",
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 8, 63, 110)),
                ),
                Text(
                  deactivation,
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 8, 63, 110)),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: active,
                      color: CupertinoColors.activeGreen,
                      child: const Text(
                        "Active",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      onPressed: deactive,
                      color: Colors.red,
                      child: const Text(
                        "Deactive",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
