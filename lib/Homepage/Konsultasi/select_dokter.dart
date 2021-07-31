import 'dart:ui';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'konfirmasipembayaran.dart';

class dokterCard extends StatelessWidget {
  final String? nama;
  final String? asal;
  final bool? online;
  final urlgambar;
  final String? channel_name;
  final String? app_id;
  final String? token;
  final String? antrian;

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

  //// Pointer to Update Function
  final Function? onUpdate;
  //// Pointer to Delete Function
  final Function? onDelete;

  dokterCard(
    this.nama,
    this.asal,
    this.online,
    this.urlgambar,
    this.channel_name,
    this.app_id,
    this.token,
    this.antrian, {
    this.onUpdate,
    this.onDelete,
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          online!
              ? Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 10,
                      child: InkWell(
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Ink.image(
                                  image: NetworkImage(
                                    '$urlgambar',
                                  ),
                                  height: 144,
                                  width: 96,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  140) *
                                              0.9,
                                      child: Text(nama!,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              color: Colors.black)),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  140) *
                                              0.9,
                                      child: Text('Asal: ' + asal!,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: Colors.black)),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  140) *
                                              0.9,
                                      child: Text(
                                          online! ? 'online' : 'tdk aktif',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: Colors.black)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => konfirmasipembayaran(
                                        channelName: '$channel_name',
                                        role: ClientRole.Broadcaster,
                                        app_id: '$app_id',
                                        token: '$token',
                                        nama: '$nama',
                                        asal: '$asal',
                                        urlgambar: '$urlgambar',
                                        antrian: '$antrian',
                                        namapasien: namapasien,
                                        alamat: alamat,
                                        agama: agama,
                                        telepon: telepon,
                                        pekerjaan: pekerjaan,
                                        suku: suku,
                                        gender: gender,
                                        umur: umur,
                                        keluhan: keluhan,
                                        gambar: gambar,
                                      )));
                        },
                      )),
                )
              : Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Card(
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Ink.image(
                                      image: NetworkImage(
                                        '$urlgambar',
                                      ),
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fitWidth,
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: Text(nama!,
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black)),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: Text(asal!,
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black)),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: Text(
                                                online!
                                                    ? 'online'
                                                    : 'Sepertinya dokternya sedang ada pasien',
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Colors.black)),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          konfirmasipembayaran(
                                            channelName: '$channel_name',
                                            role: ClientRole.Broadcaster,
                                            app_id: '$app_id',
                                            token: '$token',
                                            nama: '$nama',
                                            asal: '$asal',
                                            urlgambar: '$urlgambar',
                                            antrian: '$antrian',
                                            namapasien: namapasien,
                                            alamat: alamat,
                                            agama: agama,
                                            telepon: telepon,
                                            pekerjaan: pekerjaan,
                                            suku: suku,
                                            gender: gender,
                                            umur: umur,
                                            keluhan: keluhan,
                                            gambar: gambar,
                                          )));
                            },
                          )),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}

class SelectDokter extends StatelessWidget {
  final TextEditingController judulController = TextEditingController();
  final TextEditingController penulisController = TextEditingController();
  final TextEditingController urlgambarController = TextEditingController();

  final String? antrian;

  final String? nama;
  final String? alamat;
  final int? agama;
  final String? telepon;
  final String? pekerjaan;
  final String? suku;
  final int? gender;
  final String? umur;
  final String? keluhan;
  final String? gambar;

  SelectDokter({
    Key? key,
    this.antrian,
    this.nama,
    this.alamat,
    this.agama,
    this.telepon,
    this.pekerjaan,
    this.suku,
    this.gender,
    this.umur,
    this.keluhan,
    this.gambar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('data_dokter');

    return Scaffold(
      backgroundColor: Colors.white,
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
                    Text('Pilih Dokter Gigimu',
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
                  child: ListView(
                    padding: EdgeInsets.all(16),
                    children: [
                      StreamBuilder(
                          stream: users
                              .orderBy('id', descending: false)
                              .snapshots(),
                          builder: (_, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 8, left: 16, right: 16),
                                    child: Card(
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      elevation: 10,
                                      child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Dokter tersedia',
                                                    style: GoogleFonts
                                                        .pathwayGothicOne(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 24),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),
                                  Column(
                                    children: snapshot.data.docs
                                        .map<Widget>((e) => Column(
                                              children: [
                                                if (e.data()['online'] == true)
                                                  dokterCard(
                                                    e.data()['nama'],
                                                    e.data()['asal'],
                                                    e.data()['online'],
                                                    e.data()['urlgambar'],
                                                    e.data()['channel_name'],
                                                    e.data()['app_id'],
                                                    e.data()['token'],
                                                    antrian,
                                                    namapasien: nama,
                                                    alamat: alamat,
                                                    agama: agama,
                                                    telepon: telepon,
                                                    pekerjaan: pekerjaan,
                                                    suku: suku,
                                                    gender: gender,
                                                    umur: umur,
                                                    keluhan: keluhan,
                                                    gambar: gambar,
                                                    onUpdate: () {},
                                                  ),
                                              ],
                                            ))
                                        .toList(),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Card(
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      elevation: 3,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 16,
                                            bottom: 16,
                                            left: 16,
                                            right: 16),
                                        child: SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Text(
                                              'Jika tidak ada dokter yang bisa dipilih, tunggulah paling lama sekitar 20 menit lagi',
                                              style: TextStyle(fontSize: 16),
                                              textAlign: TextAlign.justify,
                                            )),
                                      )),
                                ],
                              );
                            } else {
                              return Center(child: Text('Tunggu sebentar'));
                            }
                          }),
                    ],
                  )),
            ),
          ),
          Container(
            height: 50,
            color: Color(0xFF5d1a77),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Nomor Antrian: ' + antrian!,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white)),
                  ],
                ),
              ],
            ),

            //ini pengganti appbar yg di modif
          ),
        ],
      ),
    );
  }
}
