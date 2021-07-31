import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:proj_ident/api/openWA.dart';

import 'HomePage.dart';
import 'How to/Keuntungan.dart';
import 'How to/Tutorial.dart';
import 'How to/riwayatkonsultasi.dart';
import 'Konsultasi/user_input.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget buildEventCard(
          int cbak,
          int calnow,
          String? urlgambar,
          String? judul,
          String? juduldeskripsi1,
          String? juduldeskripsi2,
          String? deskripsi,
          String? deskripsi2,
          int? dbak,
          String? mbak,
          int? ybak) =>
      Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: (calnow <= cbak)
            ? Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Ink.image(
                        image: NetworkImage('$urlgambar'),
                        height: 120,
                        width: 240,
                        fit: BoxFit.fitWidth,
                        child: InkWell(onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12)),
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 16,
                                              right: 16,
                                              top: 8,
                                              bottom: 4),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 180,
                                                height: 48,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  dbak.toString() +
                                                      ' ' +
                                                      mbak.toString() +
                                                      ' ' +
                                                      ybak.toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF5d1a77),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(12)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 8,
                                              right: 8,
                                              top: 4,
                                              bottom: 4),
                                          child: Card(
                                            color: Color(0xFF5d1a77),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    '$juduldeskripsi1',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    juduldeskripsi2!,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    deskripsi!,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    deskripsi2!,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 8,
                                              right: 8,
                                              top: 4,
                                              bottom: 4),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              (judul == 'BAKSOSWIL FKG UNAND')
                                                  ? ElevatedButton(
                                                      style:
                                                          untukKonsultasiButton,
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        User_Input()));
                                                      },
                                                      child: Text(
                                                          'Konsultasi Gratis'),
                                                    )
                                                  : (judul == 'SEKMIT 2021')
                                                      ? ElevatedButton(
                                                          style:
                                                              untukKonsultasiButton,
                                                          onPressed: () {},
                                                          child: Text(
                                                              'Ikuti sekmit'),
                                                        )
                                                      : ElevatedButton(
                                                          style:
                                                              untukKonsultasiButton,
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child:
                                                              Text('Kembali'),
                                                        ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0,
                                        ),
                                      ]),
                                );
                              });
                        }),
                      ),
                    ],
                  ),
                ],
              )
            : Container(),
      );

  Widget buildSEKMITCard() => Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1327&q=80',
                  ),
                  height: 120,
                  width: 240,
                  fit: BoxFit.fitWidth,
                  child: InkWell(onTap: () {}),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  left: 8,
                  child: Text(
                    'SEKMIT 2021                          FKG UNAND',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget buildHelpCard(String? imgurl) => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Ink.image(
              image: NetworkImage(
                imgurl!,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return menggunakanaplikasi();
                  }));
                },
              ),
              height: 180,
              width: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      );

  Widget buildkeuntunganCard(String? imgurl) => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Ink.image(
              image: NetworkImage(
                imgurl!,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return keuntunganmenggunakanaplikasi();
                  }));
                },
              ),
              height: 180,
              width: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      );

  Widget buildSupportCard(String? telepon, String? text, String? urlgambar,
          String? helptext1, String? helptext2) =>
      Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage('$urlgambar'),
                  height: MediaQuery.of(context).size.width / 1800 * 600,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  child: InkWell(onTap: () {
                    FlutterOpenWhatsapp.sendSingleMessage("$telepon", "$text");
                  }),
                ),
              ],
            ),
          ],
        ),
      );

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
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference blog = firestore.collection('blog');
    CollectionReference tevent = firestore.collection('tanggal_event');
    CollectionReference csupport = firestore.collection('customersupport');
    CollectionReference cardimg = firestore.collection('card');

    int? dbak, mbak, ybak, cbak;
    String? mmbak;
    int? hitungterbaca = 0;

    final ButtonStyle untukRiwayatButton = ElevatedButton.styleFrom(
      onPrimary: Color(0xFF5d1a77),
      primary: Colors.white,
      elevation: 10,
      minimumSize: Size(MediaQuery.of(context).size.width / 2 - 20, 48),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );

    final ButtonStyle untukKonsultasiButton = ElevatedButton.styleFrom(
      onPrimary: Colors.white,
      primary: Color(0xFF5d1a77),
      elevation: 10,
      minimumSize: Size(MediaQuery.of(context).size.width / 2 - 20, 48),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );


    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        Container(
          child: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 4,
                    right: 4,
                    top: 20,
                    bottom: 4,
                  ),
                  child: ElevatedButton(
                    style: untukRiwayatButton,
                    child: Row(children: [
                      Padding(
                        padding: EdgeInsets.only(left: 0, right: 10),
                        child: Icon(
                          LineIcons.clipboard,
                          size: 24,
                        ),
                      ),
                      Text('Riwayat',
                          style: GoogleFonts.pathwayGothicOne(
                              fontWeight: FontWeight.w500, fontSize: 20)),
                    ]),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return tdatabase();
                      }));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 4,
                    right: 4,
                    top: 20,
                    bottom: 4,
                  ),
                  child: ElevatedButton(
                    style: untukKonsultasiButton,
                    child: Row(children: [
                      Padding(
                        padding: EdgeInsets.only(left: 0, right: 10),
                        child: Icon(
                          LineIcons.tooth,
                          size: 24,
                        ),
                      ),
                      Text('Konsultasi',
                          style: GoogleFonts.pathwayGothicOne(
                              fontWeight: FontWeight.w500, fontSize: 20)),
                    ]),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => new AlertDialog(
                          title: new Text('Fitur ini belum tersedia'),
                          content: Text(
                              'Silahkan ikuti berbagai event menarik yang ada, juga tersedia berbagai info menarik terkait kesehatan gigi dan mulut di halaman blog :D'),
                          actions: <Widget>[
                            new ElevatedButton(
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                              child: new Text('OK'),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
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
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text('Upcoming Event: ',
                      style: GoogleFonts.pathwayGothicOne(
                          fontWeight: FontWeight.normal, fontSize: 20)),
                ),
                SizedBox(
                  height: 8,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    StreamBuilder<DocumentSnapshot>(
                      stream: tevent.doc('baksos').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          Map<String, dynamic> data =
                              snapshot.data!.data() as Map<String, dynamic>;

                          String? urlgambar;
                          urlgambar = data['imgurl'];
                          String? judul_event;
                          judul_event = data['judulevent'];
                          String? juduldeskripsi1;
                          juduldeskripsi1 = data['juduldeskripsi1'];
                          String? juduldeskripsi2;
                          juduldeskripsi2 = data['juduldeskripsi2'];
                          String? deskripsi;
                          deskripsi = data['deskripsi'];
                          String? deskripsi2;
                          deskripsi2 = data['deskripsi2'];
                          dbak = data['tanggal'];
                          mbak = data['bulan'];
                          ybak = data['tahun'];
                          cbak = 365 * ybak! + 30 * mbak! + dbak!;
                          DateTime NOW = DateTime.now();

                          int ynn, mnn, dnn;
                          ynn = NOW.year;
                          mnn = NOW.month;
                          dnn = NOW.day;
                          int calnow;
                          calnow = ynn * 365 + mnn * 30 + dnn;
                          if (mbak == 1) mmbak = 'Januari';
                          if (mbak == 2) mmbak = 'Februari';
                          if (mbak == 3) mmbak = 'Maret';
                          if (mbak == 4) mmbak = 'April';
                          if (mbak == 5) mmbak = 'Mei';
                          if (mbak == 6) mmbak = 'Juni';
                          if (mbak == 7) mmbak = 'Juli';
                          if (mbak == 8) mmbak = 'Agustus';
                          if (mbak == 9) mmbak = 'September';
                          if (mbak == 10) mmbak = 'Oktober';
                          if (mbak == 11) mmbak = 'November';
                          if (mbak == 12) mmbak = 'Desember';

                          return buildEventCard(
                              cbak!,
                              calnow,
                              urlgambar,
                              judul_event,
                              juduldeskripsi1,
                              juduldeskripsi2,
                              deskripsi,
                              deskripsi2,
                              dbak,
                              mmbak,
                              ybak);
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    StreamBuilder<DocumentSnapshot>(
                      stream: tevent.doc('sekmit').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          Map<String, dynamic> data =
                              snapshot.data!.data() as Map<String, dynamic>;

                          String? urlgambar;
                          urlgambar = data['imgurl'];
                          String? judul_event;
                          judul_event = data['judulevent'];
                          String? juduldeskripsi1;
                          juduldeskripsi1 = data['juduldeskripsi1'];
                          String? juduldeskripsi2;
                          juduldeskripsi2 = data['juduldeskripsi2'];
                          String? deskripsi;
                          deskripsi = data['deskripsi'];
                          String? deskripsi2;
                          deskripsi2 = data['deskripsi2'];
                          dbak = data['tanggal'];
                          mbak = data['bulan'];
                          ybak = data['tahun'];
                          cbak = 365 * ybak! + 30 * mbak! + dbak!;
                          DateTime NOW = DateTime.now();

                          int ynn, mnn, dnn;
                          ynn = NOW.year;
                          mnn = NOW.month;
                          dnn = NOW.day;
                          int calnow;
                          calnow = ynn * 365 + mnn * 30 + dnn;
                          if (mbak == 1) mmbak = 'Januari';
                          if (mbak == 2) mmbak = 'Februari';
                          if (mbak == 3) mmbak = 'Maret';
                          if (mbak == 4) mmbak = 'April';
                          if (mbak == 5) mmbak = 'Mei';
                          if (mbak == 6) mmbak = 'Juni';
                          if (mbak == 7) mmbak = 'Juli';
                          if (mbak == 8) mmbak = 'Agustus';
                          if (mbak == 9) mmbak = 'September';
                          if (mbak == 10) mmbak = 'Oktober';
                          if (mbak == 11) mmbak = 'November';
                          if (mbak == 12) mmbak = 'Desember';

                          return buildEventCard(
                            cbak!,
                            calnow,
                            urlgambar,
                            judul_event,
                            juduldeskripsi1,
                            juduldeskripsi2,
                            deskripsi,
                            deskripsi2,
                            dbak,
                            mmbak,
                            ybak,
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    StreamBuilder<DocumentSnapshot>(
                      stream: tevent.doc('comingsoon').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          Map<String, dynamic> data =
                              snapshot.data!.data() as Map<String, dynamic>;

                          String? urlgambar;
                          urlgambar = data['imgurl'];
                          String? judul_event;
                          judul_event = data['judulevent'];
                          String? juduldeskripsi1;
                          juduldeskripsi1 = data['juduldeskripsi1'];
                          String? juduldeskripsi2;
                          juduldeskripsi2 = data['juduldeskripsi2'];
                          String? deskripsi;
                          deskripsi = data['deskripsi'];
                          String? deskripsi2;
                          deskripsi2 = data['deskripsi2'];
                          dbak = data['tanggal'];
                          mbak = data['bulan'];
                          ybak = data['tahun'];
                          cbak = 365 * ybak! + 30 * mbak! + dbak!;
                          DateTime NOW = DateTime.now();

                          int ynn, mnn, dnn;
                          ynn = NOW.year;
                          mnn = NOW.month;
                          dnn = NOW.day;
                          int calnow;
                          calnow = ynn * 365 + mnn * 30 + dnn;
                          if (mbak == 1) mmbak = 'Januari';
                          if (mbak == 2) mmbak = 'Februari';
                          if (mbak == 3) mmbak = 'Maret';
                          if (mbak == 4) mmbak = 'April';
                          if (mbak == 5) mmbak = 'Mei';
                          if (mbak == 6) mmbak = 'Juni';
                          if (mbak == 7) mmbak = 'Juli';
                          if (mbak == 8) mmbak = 'Agustus';
                          if (mbak == 9) mmbak = 'September';
                          if (mbak == 10) mmbak = 'Oktober';
                          if (mbak == 11) mmbak = 'November';
                          if (mbak == 12) mmbak = 'Desember';

                          return buildEventCard(
                              cbak!,
                              calnow,
                              urlgambar,
                              judul_event,
                              juduldeskripsi1,
                              juduldeskripsi2,
                              deskripsi,
                              deskripsi2,
                              dbak,
                              mmbak,
                              ybak);
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
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
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Text('Artikel Terpopuler',
                    style: GoogleFonts.pathwayGothicOne(
                        fontWeight: FontWeight.normal, fontSize: 20)),
                SizedBox(
                  height: 8,
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: blog
                      .orderBy('terbaca', descending: true)
                      .limit(5)
                      .snapshots(),
                  builder: (_, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: snapshot.data.docs
                                .map<Widget>((e) => BlogPopulerCard(
                                      e.data()['bab'],
                                      e.data()['judul'],
                                      e.data()['posting'],
                                      e.data()['text1'],
                                      e.data()['text2'],
                                      e.data()['text3'],
                                      e.data()['text4'],
                                      e.data()['text5'],
                                      e.data()['text6'],
                                      e.data()['text7'],
                                      e.data()['text8'],
                                      e.data()['text9'],
                                      e.data()['text10'],
                                      e.data()['sumber1'],
                                      e.data()['sumber2'],
                                      e.data()['sumber3'],
                                      e.data()['urlgambar1'],
                                      e.data()['urlgambar2'],
                                      e.data()['penulis'],
                                      e.data()['id'],
                                      onUpdate: () {
                                        blog.doc(e.data()['id']).update({
                                          'terbaca': e.data()['terbaca'] + 1
                                        });
                                      },
                                    ))
                                .toList()),
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                FutureBuilder(
                  future: blog.get(),
                  builder: (_, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      final docs = snapshot.data.docs;
                      for (int i = 0; i <= 20; i++) {
                        final countblogterbaca = docs[i].data()!;
                        final int sayang = countblogterbaca['terbaca'];

                        hitungterbaca = (hitungterbaca! + sayang);
                      }

                      return Text(
                          'Total Artikel yang Sudah Dibaca Sebanyak : ' +
                              (hitungterbaca!).truncate().toString(),
                          style: GoogleFonts.pathwayGothicOne(
                              fontWeight: FontWeight.normal, fontSize: 20));
                    }

                    return Text("loading");
                  },
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
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
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Text('Kenali iDent lebih dekat!',
                    style: GoogleFonts.pathwayGothicOne(
                        fontWeight: FontWeight.normal, fontSize: 20)),
                SizedBox(
                  height: 8,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      StreamBuilder<DocumentSnapshot>(
                        stream: cardimg.doc('keuntungan').snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            Map<String, dynamic> data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            var imgurl = data['imgurl'];

                            return buildkeuntunganCard(
                              imgurl,
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                      StreamBuilder<DocumentSnapshot>(
                        stream: cardimg.doc('cara').snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            Map<String, dynamic> data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            var imgurl = data['imgurl'];

                            return buildHelpCard(
                              imgurl,
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ])),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
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
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('iDent Support: ',
                        style: GoogleFonts.pathwayGothicOne(
                            fontWeight: FontWeight.normal, fontSize: 20)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  StreamBuilder<DocumentSnapshot>(
                    stream: csupport.doc('csupport').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Map<String, dynamic> data =
                            snapshot.data!.data() as Map<String, dynamic>;

                        String? nomor;
                        nomor = data['nomortelepon'];
                        String? imageurl;
                        imageurl = data['image'];
                        String? default_text;
                        default_text = data['text'];
                        String? text1;
                        text1 = data['helptext1'];
                        String? text2;
                        text2 = data['helptext2'];

                        return buildSupportCard(
                            nomor, default_text, imageurl, text1, text2);
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
