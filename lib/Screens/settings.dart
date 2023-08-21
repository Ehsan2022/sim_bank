import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sim_bank/Screens/about.dart';
import 'package:share_plus/share_plus.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Container(
          height: 750,
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
                padding: EdgeInsets.only(top: 28.0, bottom: 8),
                child: Center(
                  child: Text(
                    'Settings',
                    style: TextStyle(
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
                          Icons.settings,
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
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, right: 15),
                          child: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 8, 63, 110),
                            child: Icon(
                              Icons.sunny,
                              size: 30,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        const Text(
                          "Light mode",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 8, 63, 110),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const divider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LanguagePage(),
                          ));
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, right: 15),
                          child: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 8, 63, 110),
                            child: Icon(
                              Icons.language,
                              size: 30,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        const Text(
                          "Language",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 8, 63, 110)),
                        ),
                      ],
                    ),
                  ),
                  const divider(),
                  GestureDetector(
                    onTap: () {
                      Share.share("text");
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, right: 15),
                          child: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 8, 63, 110),
                            child: Icon(
                              Icons.share,
                              size: 30,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        const Text(
                          "Share",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 8, 63, 110)),
                        ),
                      ],
                    ),
                  ),
                  const divider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const About(),
                          ));
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, right: 15),
                          child: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 8, 63, 110),
                            child: Icon(
                              Icons.phone_iphone,
                              size: 30,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        const Text(
                          "About",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 8, 63, 110)),
                        ),
                      ],
                    ),
                  ),
                  const divider(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        SystemNavigator.pop();
                      });
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, right: 15),
                          child: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 8, 63, 110),
                            child: Icon(
                              Icons.exit_to_app,
                              size: 30,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        const Text(
                          "Exit",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 8, 63, 110)),
                        ),
                      ],
                    ),
                  ),
                  const divider(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class divider extends StatelessWidget {
  const divider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Divider(
        thickness: 2,
        indent: 20,
        endIndent: 20,
        color: Colors.grey,
      ),
    );
  }
}

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
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
                    'Language',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 8, 63, 110),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text('English'),
              ),
              ListTile(
                title: Text('فارسی'),
              ),
              ListTile(
                title: Text('پشتو'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
