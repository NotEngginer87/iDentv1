import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../HomePage.dart';

class blogstl extends StatefulWidget {
  blogstl({
    this.bab,
    this.judul,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
    this.text5,
    this.text6,
    this.text7,
    this.text8,
    this.text9,
    this.text10,
    this.sumber1,
    this.sumber2,
    this.sumber3,
    this.urlgambar1,
    this.urlgambar2,
    this.penulis,
  });
  final String? bab;
  final String? judul;
  final String? text1;
  final String? text2;
  final String? text3;
  final String? text4;
  final String? text5;
  final String? text6;
  final String? text7;
  final String? text8;
  final String? text9;
  final String? text10;

  final String? sumber1;
  final String? sumber2;
  final String? sumber3;
  final String? urlgambar1;
  final String? urlgambar2;
  final String? penulis;

  @override
  _blogstlState createState() => _blogstlState();
}

class _blogstlState extends State<blogstl> {

  int k1 = 0;
  int k2 = 0;
  int k3 = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.text1 != '') {
      k1 += 1;
    }
    if (widget.text2 != '') {
      k1 += 1;
    }
    if (widget.text3 != '') {
      k1 += 1;
    }
    if (widget.text4 != '') {
      k1 += 1;
    }
    if (widget.text5 != '') {
      k1 += 1;
    }
    if (widget.text6 != '') {
      k1 += 1;
    }
    if (widget.text7 != '') {
      k2 += 1;
    }
    if (widget.text8 != '') {
      k2 += 1;
    }
    if (widget.text9 != '') {
      k2 += 1;
    }
    if (widget.text10 != '') {
      k2 += 1;
    }
    if (widget.sumber1 != '') {
      k3 += 1;
    }
    if (widget.sumber2 != '') {
      k3 += 1;
    }
    if (widget.sumber3 != '') {
      k3 += 1;
    }

    return WillPopScope(
      onWillPop: () async {
        return Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
              return HomePagestl();
            })) as FutureOr<bool>;
      },
      child: Scaffold(
        body: Column(children: [
          Container(
            height: 80,
            color: Color(0xFF5d1a77),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Blog',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white)),
                    SizedBox(
                      height: 10,
                    ),
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
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                ),
                child: Padding(
                  padding:
                  EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 8),
                  child: ListView(
                    padding: EdgeInsets.all(10),
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.bab!,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.judul!,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 10,
                        child: Ink.image(
                          image: NetworkImage(
                            widget.urlgambar1!,
                          ),
                          height: MediaQuery.of(context).size.width - 20,
                          width: MediaQuery.of(context).size.width - 20,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      (k1 > 0)
                          ? Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  (widget.text1 != '')
                                      ? Column(
                                    children: [
                                      Text(
                                        widget.text1!,
                                        style: GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight.w600,
                                            fontSize: 16,
                                            color: Colors.black),
                                        textAlign:
                                        TextAlign.justify,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  )
                                      : Container(),
                                  (widget.text2 != '')
                                      ? Column(
                                    children: [
                                      Text(
                                        widget.text2!,
                                        style: GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight.w600,
                                            fontSize: 16,
                                            color: Colors.black),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  )
                                      : Container(),
                                  (widget.text3 != '')
                                      ? Column(
                                    children: [
                                      Text(
                                        widget.text3!,
                                        style: GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight.w600,
                                            fontSize: 16,
                                            color: Colors.black),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  )
                                      : Container(),
                                  (widget.text4 != '')
                                      ? Column(
                                    children: [
                                      Text(
                                        widget.text4!,
                                        style: GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight.w600,
                                            fontSize: 16,
                                            color: Colors.black),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  )
                                      : Container(),
                                  (widget.text5 != '')
                                      ? Column(
                                    children: [
                                      Text(
                                        widget.text5!,
                                        style: GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight.w600,
                                            fontSize: 16,
                                            color: Colors.black),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  )
                                      : Container(),
                                  (widget.text6 != '')
                                      ? Column(
                                    children: [
                                      Text(
                                        widget.text6!,
                                        style: GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight.w600,
                                            fontSize: 16,
                                            color: Colors.black),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  )
                                      : Container(),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                          : Container(),
                      SizedBox(
                        height: 8,
                      ),
                      (widget.urlgambar2 != '')
                          ? Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 10,
                        child: Ink.image(
                          image: NetworkImage(
                            '$widget.urlgambar2',
                          ),
                          height: MediaQuery.of(context).size.width - 20,
                          width: MediaQuery.of(context).size.width - 20,
                          fit: BoxFit.cover,
                        ),
                      )
                          : Container(),
                      SizedBox(
                        height: 10,
                      ),
                      (k2 > 0)
                          ? Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 10,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  (widget.text7 != '')
                                      ? Column(
                                    children: [
                                      Text(
                                        widget.text7!,
                                        textDirection:
                                        TextDirection.ltr,
                                        style: GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight.w600,
                                            fontSize: 16,
                                            color: Colors.black),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  )
                                      : Container(),
                                  (widget.text8 != '')
                                      ? Column(
                                    children: [
                                      Text(
                                        widget.text8!,
                                        style: GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight.w600,
                                            fontSize: 16,
                                            color: Colors.black),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  )
                                      : Container(),
                                  (widget.text9 != '')
                                      ? Column(
                                    children: [
                                      Text(
                                        widget.text9!,
                                        style: GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight.w600,
                                            fontSize: 16,
                                            color: Colors.black),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  )
                                      : Container(),
                                  (widget.text10 != '')
                                      ? Column(
                                    children: [
                                      Text(
                                        widget.text10!,
                                        style: GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight.w600,
                                            fontSize: 16,
                                            color: Colors.black),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  )
                                      : Container(),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                          : Container(),
                      SizedBox(
                        height: 8,
                      ),
                      (k3 > 0)
                          ? Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 10,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  (widget.sumber1 != '')
                                      ? Column(
                                    children: [
                                      Text(
                                        widget.sumber1!,
                                        style: GoogleFonts.poppins(
                                            decoration:
                                            TextDecoration
                                                .underline,
                                            fontWeight:
                                            FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.blue),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  )
                                      : Container(),
                                  (widget.sumber2 != '')
                                      ? Column(
                                    children: [
                                      Text(
                                        widget.sumber2!,
                                        style: GoogleFonts.poppins(
                                            decoration:
                                            TextDecoration
                                                .underline,
                                            fontWeight:
                                            FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.blue),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  )
                                      : Container(),
                                  (widget.sumber3 != '')
                                      ? Column(
                                    children: [
                                      Text(
                                        widget.sumber3!,
                                        style: GoogleFonts.poppins(
                                            decoration:
                                            TextDecoration
                                                .underline,
                                            fontWeight:
                                            FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.blue),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  )
                                      : Container(),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                          : Container(),
                      SizedBox(
                        height: 8,
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
