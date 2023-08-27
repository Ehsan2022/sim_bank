import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sim_bank/Screens/about.dart';
import 'package:share_plus/share_plus.dart';

import '../translations/locale_keys.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 63, 110),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Container(
          height: 1300,
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
                    LocaleKeys.settings.tr(),
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
              Expanded(
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 25.0, right: 15),
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
                          Text(
                            LocaleKeys.lightMode.tr(),
                            style: const TextStyle(
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
                              builder: (context) => const LanguagePage(),
                            ));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 25.0, right: 15),
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
                          Text(
                            LocaleKeys.language.tr(),
                            style: const TextStyle(
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
                        Share.share('');
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 25.0, right: 15),
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
                          Text(
                            LocaleKeys.share.tr(),
                            style: const TextStyle(
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
                            padding:
                                const EdgeInsets.only(left: 25.0, right: 15),
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
                          Text(
                            LocaleKeys.about.tr(),
                            style: const TextStyle(
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
                            padding:
                                const EdgeInsets.only(left: 25.0, right: 15),
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
                          Text(
                            LocaleKeys.exit.tr(),
                            style: const TextStyle(
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
  Future<void> _saveLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale.toLanguageTag());
  }

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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 38),
                child: Center(
                  child: Text(
                    LocaleKeys.language.tr(),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 8, 63, 110),
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  context.setLocale(const Locale('en'));
                  _saveLocale(context.locale);
                },
                title: const Text('English'),
              ),
              ListTile(
                onTap: () {
                  setState(() {});
                  context.setLocale(const Locale('fa'));
                  _saveLocale(context.locale);
                },
                title: const Text('فارسی'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
