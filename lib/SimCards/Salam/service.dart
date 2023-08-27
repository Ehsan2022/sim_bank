import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Service extends StatefulWidget {
  const Service({Key? key}) : super(key: key);

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> with SingleTickerProviderStateMixin {
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
              'Roshan-Services',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 8, 63, 110),
              ),
            ),
          ),
          body: Container(
            color: Colors.grey.shade300,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      PackageCard(
                        bundle: 'Credit Balance',
                        active: () {
                          launch('call:*444#');
                        },
                        activation: '*444#',
                      ),
                      PackageCard(
                        bundle: 'Internet Balance',
                        active: () {
                          launch('call:*444#');
                        },
                        activation: '*444#',
                      ),
                      PackageCard(
                        bundle: 'Customer Care',
                        active: () {
                          launch('call:333');
                        },
                        activation: '333',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  const PackageCard({
    super.key,
    required this.activation,
    required this.bundle,
    required this.active,
  });

  final String bundle;

  final String activation;
  final Function() active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Container(
          height: 150,
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
              Text(
                activation,
                style: const TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 8, 63, 110)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: active,
                      color: CupertinoColors.activeGreen,
                      child: const Text(
                        "Send",
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
