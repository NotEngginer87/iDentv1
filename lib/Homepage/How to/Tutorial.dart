import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../HomePage.dart';

class menggunakancard extends StatelessWidget {
  menggunakancard(this.imgurl, this.deskripsi);

  final String? imgurl;
  final String? deskripsi;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 40) * 9 / 11,
      height: (MediaQuery.of(context).size.width - 40) * 9 / 11,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [

            SizedBox(
              width: MediaQuery.of(context).size.width * 3 / 4 - 60,
              height: MediaQuery.of(context).size.width * 3 / 4 - 60,
              child: Column(
                children: [
                  Expanded(
                    child: Ink.image(
                      image: NetworkImage(imgurl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: SizedBox(
                    child: Text(
                      deskripsi!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class menggunakanaplikasi extends StatelessWidget {
  const menggunakanaplikasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference carakonsultasi = firestore.collection('carakonsultasi');
    CollectionReference carabacablog = firestore.collection('carabacablog');

    return WillPopScope(
      onWillPop: () async {
        return Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomePagestl();
        })) as FutureOr<bool>;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cara Menggunakan iDent'),
          backgroundColor: Color(0xFF5d1a77),
          centerTitle: true,
          titleTextStyle: GoogleFonts.pathwayGothicOne(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 24)
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Color(0xFF5d1a77),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                  ),
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 8, bottom: 8, left: 16, right: 16),
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
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 8, bottom: 8, left: 16, right: 16),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Colors.black.withOpacity(.15),
                                        )
                                      ],
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 16, right: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Center(
                                            child: Text(
                                              'Cara Menggunakan Layanan Konsultasi',
                                              textAlign: TextAlign.center,
                                              style:
                                                  GoogleFonts.pathwayGothicOne(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 20),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                StreamBuilder<QuerySnapshot>(
                                  stream: carakonsultasi.snapshots(),
                                  builder: (_, AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Padding(
                                          padding: EdgeInsets.all(12),
                                          child: Row(
                                              children: snapshot.data.docs
                                                  .map<Widget>((e) =>
                                                      menggunakancard(
                                                          e.data()['imgurl'],
                                                          e.data()[
                                                              'deskripsi']))
                                                  .toList()),
                                        ),
                                      );
                                    } else {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 8, bottom: 8, left: 16, right: 16),
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
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 8, bottom: 8, left: 16, right: 16),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Colors.black.withOpacity(.15),
                                        )
                                      ],
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 16, right: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Center(
                                            child: Text(
                                              'Cara Membaca Artikel iDent',
                                              textAlign: TextAlign.center,
                                              style:
                                                  GoogleFonts.pathwayGothicOne(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 20),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                StreamBuilder<QuerySnapshot>(
                                  stream: carabacablog.snapshots(),
                                  builder: (_, AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Padding(
                                          padding: EdgeInsets.all(12),
                                          child: Row(
                                              children: snapshot.data.docs
                                                  .map<Widget>((e) =>
                                                      menggunakancard(
                                                          e.data()['imgurl'],
                                                          e.data()[
                                                              'deskripsi']))
                                                  .toList()),
                                        ),
                                      );
                                    } else {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
