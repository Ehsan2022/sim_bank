import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sim_bank/translations/locale_keys.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Call extends StatefulWidget {
  const Call({Key? key}) : super(key: key);

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> with SingleTickerProviderStateMixin {
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
            title: Text(
              LocaleKeys.call.tr(),
              style: const TextStyle(
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
              tabs: [
                Tab(
                  child: Text(
                    LocaleKeys.daily.tr(),
                  ),
                ),
                Tab(
                  child: Text(
                    LocaleKeys.weekly.tr(),
                  ),
                ),
                Tab(
                  child: Text(
                    LocaleKeys.monthly.tr(),
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

class Daily extends StatelessWidget {
  const Daily({Key? key}) : super(key: key);

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
                    bundle: '1.5 َAFs/min',
                    price: 1.99,
                    duration: '1 day(s)',
                    activation: "199 to 555",
                    deactivation: 'D199 to 555',
                    active: () {
                      buildAlert(context, "OK", "Do you want to active?", "199")
                          .show();
                    },
                    deactive: () {
                      buildAlert(
                              context, "OK", "Do you want to deactive?", "D199")
                          .show();
                    },
                  ),
                  PackageCard(
                    bundle: '150 min',
                    price: 35,
                    duration: '1 day(s)',
                    activation: "35 to 555",
                    deactivation: 'D35 to 555',
                    active: () {
                      buildAlert(context, "OK", "Do you want to active?", "35")
                          .show();
                    },
                    deactive: () {
                      buildAlert(
                              context, "OK", "Do you want to deactive?", "D35")
                          .show();
                    },
                  ),
                  PackageCard(
                    bundle: '40 min',
                    price: 15,
                    duration: '1 day(s)',
                    activation: "40 to 555",
                    deactivation: 'D40 to 555',
                    active: () {
                      buildAlert(context, "OK", "Do you want to active?", "40")
                          .show();
                    },
                    deactive: () {
                      buildAlert(
                              context, "OK", "Do you want to deactive?", "D40")
                          .show();
                    },
                  ),
                ],
              ),
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
  final double price;
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
          height: 283,
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
                Text(
                  "${LocaleKeys.price.tr()} : ",
                  style: const TextStyle(
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
                Text(
                  "${LocaleKeys.duration.tr()} : ",
                  style: const TextStyle(
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
                Text(
                  "${LocaleKeys.activationCode.tr()} : ",
                  style: const TextStyle(
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
                Text(
                  "${LocaleKeys.deactivationCode.tr()} : ",
                  style: const TextStyle(
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
                      child: Text(
                        LocaleKeys.active.tr(),
                        style: const TextStyle(
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
                      child: Text(
                        LocaleKeys.deactive.tr(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
