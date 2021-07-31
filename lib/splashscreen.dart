import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj_ident/Homepage/HomePage.dart';
import 'package:proj_ident/onboarding_page.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(
                'assets/icons/logoident-min.png',
              ),
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.width * 0.75,
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text('iDent',
                    style: GoogleFonts.pathwayGothicOne(
                        fontWeight: FontWeight.normal, fontSize: 24)),
                Text('v 1.0.0',
                    style: GoogleFonts.pathwayGothicOne(
                        fontWeight: FontWeight.normal, fontSize: 12)),
                Image(
                  image: AssetImage(
                    'assets/icons/logoident-min.png',
                  ),
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.width * 0.75,
                ),],
            )
          ],
        ),
      ),
    );
  }
}

class ganteng extends StatelessWidget {
  const ganteng({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print("There is a user logged in");
            return HomePage();
          } else {
            return OnboardingScreen();
          }
        });
  }
}