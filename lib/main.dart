import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sim_bank/translations/codegen_loader.g.dart';
import 'Navigation/navigator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final prefs = await SharedPreferences.getInstance();
  Locale? savedLocale;
  if (prefs.containsKey('locale')) {
    savedLocale = Locale.fromSubtags(languageCode: prefs.getString('locale')!);
  }
  runApp(
    EasyLocalization(
      path: "assets/translations",
      supportedLocales: const [
        Locale('en'),
        Locale('fa'),
      ],
      fallbackLocale: const Locale('en'),
      startLocale: savedLocale,
      assetLoader: const CodegenLoader(),
      child: const Navigation(),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 7)).then((value) {
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute(
          builder: (context) => const Navigation(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      home: const Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: 150,
                image: AssetImage("assets/logo.jpg"),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SIM",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "B",
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 60,
                    ),
                  ),
                  Text(
                    "ANK",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SpinKitDancingSquare(
                color: Colors.yellow,
                size: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
