import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../HomePage.dart';

class PageFoto extends StatelessWidget {
  PageFoto({Key? key}) : super(key: key);
  final ButtonStyle untukElevatedButton = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Color(0xFF5d1a77),
    elevation: 10,
    minimumSize: Size(100, 48),
  );

  var rating = 3.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                    Text('iDent',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.pathwayGothicOne(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 28)),
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
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      ElevatedButton(
                          style: untukElevatedButton,
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 360,
                                    child: Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Column(
                                        children: [
                                          Card(
                                              clipBehavior: Clip.antiAlias,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              elevation: 3,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 16,
                                                    bottom: 16,
                                                    left: 16,
                                                    right: 16),
                                                child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            'Upload fotomu ke Instagram dengan logo iDent sebagai berikut, lalu beri caption paling kreatif mengenai pengalamanmu menggunakan iDent',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .black)),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(
                                                            'Jangan lupa tag Instagram @admin_ident @baksoswilfkgua dan menggunakan hastag #iDent2021 #baksoswilfkgunand2021',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .black)),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(
                                                            'Foto dan caption paling menarik akan mendapatkan hadiah yang akan diumumkan di instagram @admin_ident',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .black)),
                                                      ],
                                                    )),
                                              )),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Text('Ambil Hadiahmu')),
                      Image(
                        image: AssetImage(
                          'assets/icons/Logo iDent pasien.png',
                        ),
                        width: MediaQuery.of(context).size.width - 10,
                        height: MediaQuery.of(context).size.width - 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 12,
                          right: 12,
                        ),
                        child: Column(
                          children: [
                            Divider(
                              color: Colors.black,
                              thickness: 2,
                            ),
                            Text('Terima kasih sudah melakukan',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.black)),
                            Text('konsultasi bersama iDent!',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.black)),
                            Text('Tetap nantikan event selanjutnya ya!',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.black)),
                            Divider(
                              color: Colors.black,
                              thickness: 2,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100.0,
                        width: double.infinity,
                        color: Color(0xFF5d1a77),
                        child: GestureDetector(
                          onTap: () {
                            print('Get started');
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return HomePagestl();
                            }));
                          },
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 30.0),
                              child: Text(
                                'Kembali ke Halaman Utama',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      RatingBarIndicator(
                        rating: 2.75,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 50.0,
                        direction: Axis.vertical,
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
