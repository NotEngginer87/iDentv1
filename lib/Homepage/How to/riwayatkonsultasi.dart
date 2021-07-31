import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:proj_ident/model/monster.dart';

import '../HomePage.dart';

class tdatabase extends StatelessWidget {
  const tdatabase({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomePagestl();
        })) as FutureOr<bool>;
      } as Future<bool> Function()?,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 80,
              color: Color(0xFF5d1a77),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Riwayat Konsultasi',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.pathwayGothicOne(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 24)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Color(0xFF5d1a77),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  child: FutureBuilder(
                    future: Hive.openBox("monsters"),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError)
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        var monstersBox = Hive.box("monsters");
                        if (monstersBox.length == 0) {
                          Text('anda belum melakukan konsultasi');
                        }

                        return ValueListenableBuilder(
                          valueListenable: monstersBox.listenable(),
                          builder: (BuildContext context, Box<dynamic> value,
                              Widget? child) {
                            return Container(
                              margin: EdgeInsets.all(16),
                              child: ListView.builder(
                                itemCount: monstersBox.length,
                                itemBuilder: (context, index) {
                                  Monster monster = monstersBox.getAt(index);
                                  return Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 10,
                                    child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              height: 150,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: Ink.image(
                                                      image: NetworkImage(
                                                        monster.urlgambar!,
                                                      ),
                                                      height: 120,
                                                      width: 200,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                SizedBox(
                                                  child: Text(monster.nama!,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .black)),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                SizedBox(
                                                  child: Text(monster.asal!,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .black)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      } else
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                    },
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
