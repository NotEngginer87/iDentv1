import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:proj_ident/api/openWA.dart';

import '../onboarding_page.dart';
import 'Tab3/halaman_pengaduan.dart';

class Tab3 extends StatefulWidget {
  const Tab3({Key? key}) : super(key: key);

  @override
  _Tab3State createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference blog = firestore.collection('blog');

    _callNumber() async {
      const number = '+6282387696487'; //set the number here
      bool? res = await FlutterPhoneDirectCaller.callNumber(number);
    }

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final emaila = user!.email;

    final ButtonStyle KebijakanPrivasiButton = ElevatedButton.styleFrom(
      onPrimary: Colors.black,
      primary: Colors.white,
      minimumSize: Size(MediaQuery.of(context).size.width, 48),
      padding: EdgeInsets.symmetric(horizontal: 0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );

    final ButtonStyle KontakButton = ElevatedButton.styleFrom(
      onPrimary: Colors.black,
      primary: Colors.white,
      minimumSize: Size(MediaQuery.of(context).size.width * 2 / 3, 48),
      padding: EdgeInsets.symmetric(horizontal: 12),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );

    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(.2),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Akun',
                        style: GoogleFonts.pathwayGothicOne(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4, right: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'email: ',
                          style: GoogleFonts.pathwayGothicOne(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        Text(
                          emaila.toString(),
                          style: GoogleFonts.pathwayGothicOne(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(.2),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(Icons.info),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Informasi',
                        style: GoogleFonts.pathwayGothicOne(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    style: KebijakanPrivasiButton,
                    child: Text(
                      'Kritik dan Saran',
                      style: GoogleFonts.pathwayGothicOne(
                          fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                            return pengaduanstl();
                          }));
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                      style: KebijakanPrivasiButton,
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12)),
                                ),
                                child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 16,
                                            right: 16,
                                            top: 8,
                                            bottom: 4),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.6,
                                          height: 48,
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Hubungi Kami',
                                            style: GoogleFonts.pathwayGothicOne(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF5d1a77),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                7 /
                                                8,
                                            child: ElevatedButton(
                                                style: KontakButton,
                                                onPressed: () {
                                                  FlutterOpenWhatsapp
                                                      .sendSingleMessage(
                                                      "+6282387696487",
                                                      "Halo Admin iDent, Saya ingin menanyakan sesuatu");
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(LineIcons.whatSApp),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'WhatsApp',
                                                      style: GoogleFonts
                                                          .pathwayGothicOne(
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                          fontSize: 18),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                7 /
                                                8,
                                            child: ElevatedButton(
                                                style: KontakButton,
                                                onPressed: () {
                                                  _callNumber();
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(LineIcons.phone),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'Telepon',
                                                      style: GoogleFonts
                                                          .pathwayGothicOne(
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                          fontSize: 18),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                7 /
                                                8,
                                            child: ElevatedButton(
                                                style: KontakButton,
                                                onPressed: () {},
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.mail),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'kontakident@gmail.com',
                                                      style: GoogleFonts
                                                          .pathwayGothicOne(
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                          fontSize: 18),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ],
                                      )
                                    ]),
                              );
                            });
                      },
                      child: Text(
                        'Kontak',
                        style: GoogleFonts.pathwayGothicOne(
                            fontWeight: FontWeight.w500, fontSize: 18),
                        textAlign: TextAlign.left,
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    style: KebijakanPrivasiButton,
                    child: Text(
                      'Kenapa iDent ?',
                      style: GoogleFonts.pathwayGothicOne(
                          fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                            return OnboardingScreen();
                          }));
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  RatingBarIndicator(
                    rating: 3,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 50.0,
                    direction: Axis.vertical,
                  ),

                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
