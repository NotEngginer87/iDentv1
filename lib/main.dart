import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:hive/hive.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'Homepage/HomePage.dart';
import 'model/monster.dart';
import 'onboarding_page.dart';
import 'splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var appDocumentDirectory =
      await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(MonsterAdapter());

  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {

      Widget example1 = SplashScreenView(
        navigateRoute: ganteng(),
        duration: 10000,
        imageSize: (MediaQuery.of(context).size.width* 0.75 ).toInt(),
        imageSrc: "assets/icons/logoident-min.png",
        text: "iDent",
        speed: 100,
        textStyle: GoogleFonts.pathwayGothicOne(
            fontWeight: FontWeight.normal, fontSize: 24),
        backgroundColor: Colors.white,
      );

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    final FirebaseAuth auth = FirebaseAuth.instance;



    return example1;
  }
}
