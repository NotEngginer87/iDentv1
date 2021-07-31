import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../HomePage.dart';

class pengaduanstl extends StatelessWidget {
  const pengaduanstl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return pengaduanstf();
  }
}

class pengaduanstf extends StatefulWidget {
  const pengaduanstf({Key? key}) : super(key: key);

  @override
  _pengaduanstfState createState() => _pengaduanstfState();
}

class _pengaduanstfState extends State<pengaduanstf> {
  final ButtonStyle ElevatedButtonpengaduan = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Color(0xFF5d1a77),
    elevation: 10,
    minimumSize: Size(100, 48),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );

  TextEditingController controllerkeluhan = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference pengaduan = firestore.collection('pengaduan');
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('iDent',
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
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                    ),
                    child: ListView(
                      padding: EdgeInsets.all(16),
                      children: [
                        Container(
                          height: 100,
                          padding: EdgeInsets.all(10),
                          decoration: new BoxDecoration(
                            color: Colors.grey
                                .shade300, //new Color.fromRGBO(255, 0, 0, 0.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              "Apabila #sanak mempunyai masalah terkait penggunaan aplikasi atau ingin memberi kritik dan saran yang membangun, silahkan curahkan semuanya kesini, demi kemajuan aplikasi iDent!",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          // nama
                          maxLines: 6,
                          scrollPadding: EdgeInsets.all(20),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelText: "Kritik dan Saran",
                              hintText:
                                  "Apabila #sanak mempunyai masalah terkait penggunaan aplikasi atau ingin memberi kritik dan saran yang membangun, silahkan curahkan semuanya kesini, demi kemajuan aplikasi iDent!",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),

                          autofocus: true,
                          onChanged: (value) {
                            setState(() {});
                          },
                          controller: controllerkeluhan,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                            style: ElevatedButtonpengaduan,
                            onPressed: () {
                              pengaduan.add({
                                'pengaduan': controllerkeluhan.text,
                              });

                              controllerkeluhan.text = ' ';

                              showDialog(
                                context: context,
                                builder: (context) => new AlertDialog(
                                  title: new Text('Terima Kasih Sanak!'),
                                  content: Text(
                                      'Terima kasih sudah memberikan kritik dan saran, kalian semua istimewa bagi kami. Semua kritik dan saran yang telah #sanak berikan akan kami diskusikan lebih lanjut!'),
                                  actions: <Widget>[
                                    new ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      },
                                      child: new Text('Ok'),
                                    )
                                  ],
                                ),
                              );
                            },
                            child: Text('Kirim')),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
