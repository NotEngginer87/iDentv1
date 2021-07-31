import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class BlogMenu extends StatefulWidget {
  const BlogMenu({Key? key}) : super(key: key);

  @override
  _BlogMenuState createState() => _BlogMenuState();
}

class _BlogMenuState extends State<BlogMenu> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference blog = firestore.collection('blog');

    return ListView(
      children: [
        StreamBuilder(
          stream: blog.snapshots(),
          builder: (_, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: snapshot.data.docs
                    .map<Widget>((e) => BlogCard(
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
                            blog
                                .doc(e.data()['id'])
                                .update({'terbaca': e.data()['terbaca'] + 1});
                          },
                        ))
                    .toList(),
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
      ],
    );
  }
}
