import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:proj_ident/api/DatabaseServices.dart';
import '../HomePage.dart';
import 'dart:io';
import 'dart:ui';

import 'package:path/path.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'select_dokter.dart';

class User_Input extends StatefulWidget {
  const User_Input({Key? key}) : super(key: key);

  @override
  _User_InputState createState() => _User_InputState();
}

class _User_InputState extends State<User_Input> {
  //style raise button
  final ButtonStyle sepertiRaisedButton = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Color(0xFF5d1a77),
    minimumSize: Size(90, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );
  int? _valuegender = 1;
  int? _valueagama = 1;

  String? documentId;

  // Controller
  TextEditingController controllernama = TextEditingController();
  TextEditingController controllerumur = TextEditingController();
  TextEditingController controllergender = TextEditingController();
  TextEditingController controllerpekerjaan = TextEditingController();
  TextEditingController controllersuku = TextEditingController();
  TextEditingController controlleragama = TextEditingController();
  TextEditingController controlleralamat = TextEditingController();
  TextEditingController controllertelepon = TextEditingController();
  TextEditingController controllerkeluhan = TextEditingController();
  // Controller

  late bool switchnama = false;
  late bool switchpekerjaan = false;
  late bool switchtelepon = false;
  late bool switchalamat = false;
  late bool switchumur = false;
  late bool switchsuku = false;
  late bool switchkeluhan = false;
  late bool switchfoto = false;
  late bool consent = false;

  //image
  String? imageUrl;

  String? $gambar;

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              'upload : $percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container(
              width: 0,
              height: 0,
            );
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference count = firestore.collection('count');

    return MaterialApp(
      home: Scaffold(
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
                      Text('Rekam Medis',
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
                      padding: EdgeInsets.all(32),
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: new BoxDecoration(
                            color: Colors.grey
                                .shade300, //new Color.fromRGBO(255, 0, 0, 0.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SizedBox(
                              child: Column(
                            children: [
                              Text(
                                'Informasi ini berguna untuk kepentingan rekam medis, mohon diisi dengan jujur ya!',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Semua data wajib diisi agar bisa lanjut ke tahap konsultasi.',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          // nama
                          scrollPadding: EdgeInsets.all(20),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelText: "Nama Lengkap",
                              hintText: "Nama sesuai identitas",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),

                          autofocus: true,
                          onChanged: (value) {
                            setState(() {
                              switchnama = true;
                            });
                          },
                          controller: controllernama,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text('Jenis Kelamin: '),
                        ),
                        DropdownButton(
                            value: _valuegender,
                            elevation: 10,
                            isExpanded: true,
                            items: [
                              DropdownMenuItem(
                                child: Text("Laki - Laki"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Perempuan"),
                                value: 2,
                              ),
                            ],
                            onChanged: (dynamic value) {
                              setState(() {
                                _valuegender = value;
                              });
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          // nama
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Usia",
                            hintText: "20 tahun",
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onChanged: (value) {
                            setState(() {
                              switchumur = true;
                            });
                          },
                          controller: controllerumur,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text('Agama:'),
                        ),
                        DropdownButton(
                            value: _valueagama,
                            elevation: 10,
                            isExpanded: true,
                            items: [
                              DropdownMenuItem(
                                child: Text("Islam"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Protestan"),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                  child: Text("Katolik"), value: 3),
                              DropdownMenuItem(child: Text("Buddha"), value: 4),
                              DropdownMenuItem(child: Text("Hindu"), value: 5),
                              DropdownMenuItem(
                                  child: Text("Konghucu"), value: 6),
                            ],
                            onChanged: (dynamic value) {
                              setState(() {
                                _valueagama = value;
                              });
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          // nama
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Pekerjaan",
                            hintText: "Pegawai, Petani, Supir, dan lain-lain",
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onChanged: (value) {
                            setState(() {
                              switchpekerjaan = true;
                            });
                          },
                          controller: controllerpekerjaan,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          // suku
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Suku",
                            hintText:
                                "Jawa, Melayu, Minang, Bugis, dan lain-lain",
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onChanged: (value) {
                            setState(() {
                              switchsuku = true;
                            });
                          },
                          controller: controllersuku,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          // nama
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Alamat",
                            hintText: "Alamat saat ini",
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onChanged: (value) {
                            setState(() {
                              switchalamat = true;
                            });
                          },
                          controller: controlleralamat,

                          keyboardType: TextInputType.streetAddress,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          // nama
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Nomor HP",
                            hintText: "08XXXXXXXXXX",
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onChanged: (value) {
                            setState(() {
                              switchtelepon = true;
                            });
                          },
                          controller: controllertelepon,
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: new BoxDecoration(
                            color: Colors.grey
                                .shade300, //new Color.fromRGBO(255, 0, 0, 0.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Isilah kolom dibawah ini berdasarkan keluhan yang dirasakan, dengan jujur dan terperinci. Gunakan bahasamu sendiri ya!',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Keluhan",
                            hintText:
                                "Contoh: Gigi geraham paling belakang saya sakit seperti ditusuk-tusuk, apalagi saat minum air dingin. Nyerinya hilang timbul, saya sudah minum obat dari warung tapi masih sakit.",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          maxLines: 5,
                          onChanged: (value) {
                            setState(() {
                              switchkeluhan = true;
                            });
                          },
                          controller: controllerkeluhan,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: new BoxDecoration(
                            color: Colors.grey
                                .shade300, //new Color.fromRGBO(255, 0, 0, 0.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Upload foto yang berkaitan dengan keluhanmu, usahakan fotonya dengan resolusi terbaik agar memudahkan dalam proses diagnosis penyakit, terima kasih!",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: <Widget>[
                            (imageUrl != null)
                                ? Card(
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
                                              image: NetworkImage(imageUrl!),
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              fit: BoxFit.cover,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width - 100,
                                    height:
                                        MediaQuery.of(context).size.width - 100,
                                    child: InkWell(
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, right: 10, top: 32),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Upload Foto',
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                'Tap Here',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black87),
                                              ),
                                            ],
                                          )),
                                      onTap: () {
                                        uploadImage();
                                        switchfoto = true;
                                      },
                                    ),
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )),
              ),
            ),
            (switchnama == true)
                ? (switchpekerjaan == true)
                    ? (switchtelepon == true)
                        ? (switchalamat == true)
                            ? (switchumur == true)
                                ? (switchsuku == true)
                                    ? (switchkeluhan == true)
                                        ? (imageUrl != null)
                                            ? FutureBuilder<DocumentSnapshot>(
                                                future:
                                                    count.doc('count').get(),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot<
                                                            DocumentSnapshot>
                                                        snapshot) {
                                                  if (snapshot.hasError) {
                                                    return Text(
                                                        "Something went wrong");
                                                  }

                                                  if (snapshot.hasData &&
                                                      !snapshot.data!.exists) {
                                                    return Text(
                                                        "Document does not exist");
                                                  }

                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.done) {
                                                    Map<String, dynamic> data =
                                                        snapshot.data!.data()
                                                            as Map<String,
                                                                dynamic>;
                                                    documentId = data['count']
                                                        .toString();
                                                    return StreamBuilder(
                                                      stream: count.snapshots(),
                                                      builder: (_,
                                                          AsyncSnapshot
                                                              snapshot) {
                                                        if (snapshot.hasData) {
                                                          return Column(
                                                            children: snapshot
                                                                .data!.docs
                                                                .map<Widget>(
                                                                    (e) =>
                                                                        Column(
                                                                          children: [
                                                                            AddUserCountCard(
                                                                              e.data()['count'],
                                                                              documentId,
                                                                              controllernama.text,
                                                                              controlleralamat.text,
                                                                              _valueagama,
                                                                              controllertelepon.text,
                                                                              controllerpekerjaan.text,
                                                                              controllersuku.text,
                                                                              _valuegender,
                                                                              controllerumur.text,
                                                                              controllerkeluhan.text,
                                                                              imageUrl,
                                                                              onUpdate: () {
                                                                                count.doc('count').update({
                                                                                  'count': e.data()['count'] + 1
                                                                                });
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ))
                                                                .toList(),
                                                          );
                                                        } else {
                                                          return Text(
                                                              'Loading');
                                                        }
                                                      },
                                                    );
                                                  }

                                                  return Text("loading");
                                                },
                                              )
                                            : Container()
                                        : Container()
                                    : Container()
                                : Container()
                            : Container()
                        : Container()
                    : Container()
                : Container(),
          ],
        ),
      ),
    );
  }

  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile? image;

    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      image = await _picker.getImage(source: ImageSource.gallery);

      var file = File(image!.path);

      final fileName = basename(file.path);
      final destination = 'gambarpasien/$fileName';

      if (image != null) {
        //Upload to Firebase
        var snapshot = await _storage
            .ref()
            .child(destination)
            .putFile(file)
            .whenComplete(() => null);

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Path Received');
      }
    } else {
      print('Grant Permissions and try again');
    }
  }
}

class AddUserCountCard extends StatelessWidget {
  final int? count;
  final Function? onUpdate;
  final String? documentId;
  final String nama;
  final String alamat;
  final int? agama;
  final String telepon;
  final String pekerjaan;
  final String suku;
  final int? gender;
  final String umur;
  final String keluhan;
  final String? gambar;

  AddUserCountCard(
      this.count,
      this.documentId,
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
      {this.onUpdate});

  final ButtonStyle untukElevatedButtonSubmit = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Color(0xFF5d1a77),
    elevation: 10,
    minimumSize: Size(100, 48),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );
  @override
  final ButtonStyle sepertiRaisedButton = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Color(0xFF5d1a77),
    minimumSize: Size(90, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: untukElevatedButtonSubmit,
      onPressed: () {
        DatabaseServices.updateData(
          documentId,
          nama,
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

        if (onUpdate != null) onUpdate!();
        showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text(
              'PERHATIAN!!!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            content: Container(
              height: 240,
              child: Column(
                children: [
                  Text(
                    'Setelah ini #sanak akan memilih dokter untuk konsultasi, Jika #sanak  keluar dari aplikasi, atau kembali ke halaman sebelumnya, maka data tidak akan terekam, dan #sanak diminta untuk mengisi form kembali data yang sudah diisikan hanya akan digunakan oleh dokter gigi.',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Kami selaku developer iDent menjamin data #sanak tidak akan terekam oleh pihak ketiga dan hanya akan disimpan oleh dokter gigi untuk kepentingan pelayanan medis yang akan diberikan',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              new ElevatedButton(
                style: sepertiRaisedButton,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return SelectDokter(
                      antrian: documentId,
                      nama: nama,
                      alamat: alamat,
                      agama: agama,
                      telepon: telepon,
                      pekerjaan: pekerjaan,
                      suku: suku,
                      gender: gender,
                      umur: umur,
                      keluhan: keluhan,
                      gambar: gambar,
                    );
                  }));
                },
                child: new Text('Konsultasi'),
              )
            ],
          ),
        );
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.only(left: 0, right: 10),
          child: Icon(
            LineIcons.tooth,
            size: 24,
          ),
        ),
        Text(
          'Konsultasi',
          style: TextStyle(fontSize: 16),
        ),
      ]),
    );
  }
}
