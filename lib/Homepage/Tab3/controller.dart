

import 'package:flutter/material.dart';

import '../HomePage.dart';

class controller extends StatefulWidget {
  const controller({Key? key}) : super(key: key);

  @override
  _controllerState createState() => _controllerState();
}

class _controllerState extends State<controller> {
  TextEditingController controllerkeluhan = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) {
          return HomePagestl();
        }));
    return Text('');
  }
}