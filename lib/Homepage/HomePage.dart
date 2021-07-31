import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:proj_ident/api/DatabaseServices.dart';
import 'Blog/Blog.dart';
import 'Home.dart';
import 'Tab3.dart';
import 'blogmenu.dart';

class HomePagestl extends StatelessWidget {
  const HomePagestl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int countblogterbaca = 0;
  final TextEditingController judulController = TextEditingController();
  final TextEditingController penulisController = TextEditingController();
  final TextEditingController urlgambarController = TextEditingController();

  final ButtonStyle untukKonsultasiButton = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Color(0xFF5d1a77),
    elevation: 10,
    minimumSize: Size(150, 48),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
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
                    Text('iDent',
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
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                ),
                child: (_selectedIndex == 0)
                    ? Home()
                    : (_selectedIndex == 1)
                        ? BlogMenu()
                        : (_selectedIndex == 2)
                            ? Tab3()
                            : Container(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.4),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Color(0xFF7c1aa2),
              gap: 8,
              activeColor: Color(0xFF7c1aa2),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 500),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              textStyle: GoogleFonts.pathwayGothicOne(
                  fontWeight: FontWeight.normal, fontSize: 16),
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.newspaper,
                  text: 'Artikel',
                ),
                GButton(
                  icon: LineIcons.userCircle,
                  text: 'Info',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class BlogPopulerCard extends StatelessWidget {
  final String? bab;
  final String? judul;
  final String? penulis;
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
  final bool? posting;
  final String? id;

  //// Pointer to Update Function
  final Function? onUpdate;
  //// Pointer to Delete Function
  final Function? onDelete;

  BlogPopulerCard(
      this.bab,
      this.judul,
      this.posting,
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
      this.id,
      {this.onUpdate,
      this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          (posting == true)
              ? Padding(
                  padding: EdgeInsets.only(
                    left: 8,
                    right: 8,
                  ),
                  child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 10,
                          child: InkWell(
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Ink.image(
                                            image: NetworkImage(
                                              '$urlgambar1',
                                            ),
                                            colorFilter: ColorFilter.mode(
                                                Colors.grey,
                                                BlendMode.softLight),
                                            height: 200,
                                            width: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                if (onUpdate != null) onUpdate!();
                                DatabaseServices.terbacaBlog(id);
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return blogstl(
                                        bab: '$bab',
                                        judul: '$judul',
                                        text1: '$text1',
                                        text2: '$text2',
                                        text3: '$text3',
                                        text4: '$text4',
                                        text5: '$text5',
                                        text6: '$text6',
                                        text7: '$text7',
                                        text8: '$text8',
                                        text9: '$text9',
                                        text10: '$text10',
                                        sumber1: '$sumber1',
                                        sumber2: '$sumber2',
                                        sumber3: '$sumber3',
                                        urlgambar1: '$urlgambar1',
                                        urlgambar2: '$urlgambar2',
                                        penulis: '$penulis');
                                  },
                                ));
                              }))),
                )
              : Container(),
        ],
      ),
    );

  }

}

class BlogCard extends StatelessWidget {
  final String? bab;
  final String? judul;
  final String? penulis;
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
  final bool? posting;
  final String? id;

  //// Pointer to Update Function
  final Function? onUpdate;
  //// Pointer to Delete Function
  final Function? onDelete;

  BlogCard(
      this.bab,
      this.judul,
      this.posting,
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
      this.id,
      {this.onUpdate,
      this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          (posting == true)
              ? Padding(
                  padding: EdgeInsets.only(
                    left: 8,
                    right: 8,
                  ),
                  child: SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width - 8,
                      child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 10,
                          child: InkWell(
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Ink.image(
                                                image: NetworkImage(
                                                  '$urlgambar1',
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
                                        width: 10,
                                      ),
                                      SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Text(
                                                bab!,
                                                style: GoogleFonts
                                                    .pathwayGothicOne(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 20),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Text(
                                                judul!,
                                                style: GoogleFonts
                                                    .pathwayGothicOne(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              onTap: () {
                                if (onUpdate != null) onUpdate!();
                                DatabaseServices.terbacaBlog(id);
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return blogstl(
                                        bab: '$bab',
                                        judul: '$judul',
                                        text1: '$text1',
                                        text2: '$text2',
                                        text3: '$text3',
                                        text4: '$text4',
                                        text5: '$text5',
                                        text6: '$text6',
                                        text7: '$text7',
                                        text8: '$text8',
                                        text9: '$text9',
                                        text10: '$text10',
                                        sumber1: '$sumber1',
                                        sumber2: '$sumber2',
                                        sumber3: '$sumber3',
                                        urlgambar1: '$urlgambar1',
                                        urlgambar2: '$urlgambar2',
                                        penulis: '$penulis');
                                  },
                                ));
                              }))),
                )
              : Container(),
        ],
      ),
    );
  }
}
