import 'dart:ui';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:proj_ident/agora/pages/call.dart';
import 'package:proj_ident/api/DatabaseServices.dart';
import 'package:proj_ident/model/monster.dart';

class ButtonKonsultasi extends StatelessWidget {
  final String? nama;
  final String? namadokter;
  final String? id;
  final String channelName;
  final String app_id;
  final String token;
  final String asal;
  final String urlgambar;
  final ClientRole role;
  final String antrian;

  final String namapasien;
  final String alamat;
  final int agama;
  final String telepon;
  final String pekerjaan;
  final String suku;
  final int gender;
  final String umur;
  final String keluhan;
  final String gambar;

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }

  ButtonKonsultasi(
    this.nama,
    this.id,
    this.namadokter,
    this.channelName,
    this.app_id,
    this.token,
    this.antrian,
    this.asal,
    this.urlgambar,
    this.role,
    this.namapasien,
    this.alamat,
    this.agama,
    this.telepon,
    this.pekerjaan,
    this.suku,
    this.gender,
    this.umur,
    this.keluhan,
    this.gambar,
  );

  @override
  Widget build(BuildContext context) {
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
    if (nama == namadokter) {
      return ElevatedButton(
        style: untukKonsultasiButton,
        child: Row(children: [
          Text(
            'Konsultasi',
            style: GoogleFonts.pathwayGothicOne(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24),
          ),
        ]),
        onPressed: () async {
          await _handleCameraAndMic(Permission.camera);
          await _handleCameraAndMic(Permission.microphone);
          DatabaseServices.updateOnline(id);
          DatabaseServices.updateDataKeDokter(
            id,
            antrian,
            namapasien,
            alamat,
            agama,
            telepon,
            pekerjaan,
            suku,
            gender,
            umur,
            keluhan,
            gambar,
          );
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CallPage(
                        channelName: '$channelName',
                        role: ClientRole.Broadcaster,
                        app_id: '$app_id',
                        token: '$token',
                        antrian: '$antrian',
                      )));
          var monstersBox = Hive.box("monsters");
          monstersBox.add(Monster(nama, asal, urlgambar));
        },
      );
    } else {
      return Container();
    }
  }
}

class konfirmasipembayaran extends StatelessWidget {
  konfirmasipembayaran({
    required this.channelName,
    required this.role,
    required this.app_id,
    required this.token,
    required this.nama,
    required this.asal,
    required this.urlgambar,
    required this.antrian,
    required this.namapasien,
    required this.alamat,
    required this.agama,
    required this.telepon,
    required this.pekerjaan,
    required this.suku,
    required this.gender,
    required this.umur,
    required this.keluhan,
    required this.gambar,
  });

  final String channelName;
  final String app_id;
  final String token;
  final String nama;
  final String asal;
  final String urlgambar;
  final ClientRole role;
  final String antrian;

  final String? namapasien;
  final String? alamat;
  final int? agama;
  final String? telepon;
  final String? pekerjaan;
  final String? suku;
  final int? gender;
  final String? umur;
  final String? keluhan;
  final String? gambar;

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }

  final Stream<int> _bids = (() async* {
    for (int i = 1; i <= 100000000; i++) {
      await Future<void>.delayed(Duration(seconds: 1));
      yield 1;
    }
  })();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('data_dokter');

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

    int bulanke = DateTime.now().month;

    int controller;

    if (bulanke == 1) String namabulan = 'Januari';
    if (bulanke == 2) String namabulan = 'Februari';
    if (bulanke == 3) String namabulan = 'Maret';
    if (bulanke == 4) String namabulan = 'April';
    if (bulanke == 5) String namabulan = 'Mei';
    if (bulanke == 6) String namabulan = 'Juni';
    if (bulanke == 7) String namabulan = 'Juli';
    if (bulanke == 8) String namabulan = 'Agustus';
    if (bulanke == 9) String namabulan = 'September';
    if (bulanke == 10) String namabulan = 'Oktober';
    if (bulanke == 11) String namabulan = 'November';
    if (bulanke == 12) String namabulan = 'Desember';

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
                    Text('Konfirmasi pembayaran',
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
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                  ),
                  child: ListView(
                    padding: EdgeInsets.all(10),
                    children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 10,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              left: 20,
                              top: 208,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text('Nama',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.black)),
                              ),
                            ),
                            Positioned(
                              left: 110,
                              top: 208,
                              child: Text(': ' + nama,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.black)),
                            ),
                            Positioned(
                              left: 20,
                              top: 240,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text('Asal',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.black)),
                              ),
                            ),
                            Positioned(
                              left: 110,
                              top: 240,
                              child: Text(': ' + asal,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.black)),
                            ),
                            Container(
                              height: 270,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 200,
                                    child: Ink.image(
                                      image: NetworkImage(
                                        '$urlgambar',
                                      ),
                                      height: 240,
                                      width: 160,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
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
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 12, right: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tanggal konsultasi : ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    DateTime.now().day.toString() +
                                        ' / ' +
                                        DateTime.now().month.toString() +
                                        ' / ' +
                                        DateTime.now().year.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Pukul : ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  StreamBuilder(
                                      stream: _bids,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<int> snapshot) {
                                        if (snapshot.hasData) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                DateTime.now().hour.toString() +
                                                    ' : ' +
                                                    DateTime.now()
                                                        .minute
                                                        .toString() +
                                                    ' : ' +
                                                    DateTime.now()
                                                        .second
                                                        .toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          return CircularProgressIndicator();
                                        }
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
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
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 12, right: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Harga : ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Biaya konsultasi : ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Rp 20.000,00',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Diskon : ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'BAKSOSWIL FKG UNAND 2021 : ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Rp 20.000,00',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.black,
                                height: 16,
                                thickness: 2,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Grand Total : ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Rp 0,00',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
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
                          padding: EdgeInsets.only(
                              left: 16, right: 16, top: 8, bottom: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Syarat dan Ketentuan : ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Setelah mengisi formulir, Anda akan diarahkan ke tampilan video call untuk melakukan konsultasi secara langsung bersama dokter gigi. Jika anda memilih untuk keluar aplikasi atau kembali ke halaman sebelumnya, maka data tidak akan terekam, dan Anda diminta untuk mengisi form kembali',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Kami sangat menjunjung tinggi kode etik dokter dan dokter gigi serta demi menjaga privasi pasien, konsultasi hanya akan bersifat dua arah, antara Anda dengan dokter gigi di dalam video call. ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Kami selaku developer iDent menjamin jawaban Anda tidak akan terekam oleh pihak ketiga dan hanya akan disimpan oleh dokter gigi untuk kepentingan pelayanan medis yang akan diberikan.',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  )),
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('bayar',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                color: Colors.black)),
                        Text('Rp 0,00',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black)),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: StreamBuilder(
                      stream: users.snapshots(),
                      builder: (_, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: snapshot.data.docs
                                .map<Widget>((e) => ButtonKonsultasi(
                                      e.data()['nama'],
                                      e.data()['id'],
                                      nama,
                                      channelName,
                                      app_id,
                                      token,
                                      antrian,
                                      asal,
                                      urlgambar,
                                      role,
                                      namapasien!,
                                      alamat!,
                                      agama!,
                                      telepon!,
                                      pekerjaan!,
                                      suku!,
                                      gender!,
                                      umur!,
                                      keluhan!,
                                      gambar!,
                                    ))
                                .toList(),
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
