import 'dart:async';

import 'package:flutter/material.dart';

import '../HomePage.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  TextEditingController controllerkeluhan = TextEditingController();
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Kebijakan Privasi',
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

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(12)),
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
                                Text(
                                  'Kenali iDent lebih dekat!',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 8,
                                ),

                              ],
                            ),
                          ),
                        ),

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
