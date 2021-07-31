import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  static CollectionReference usercount =
      FirebaseFirestore.instance.collection('count');
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference userdata = firestore.collection('user_data');
  static CollectionReference count = firestore.collection('count');
  static CollectionReference blog = firestore.collection('blog');
  static CollectionReference datadokter = firestore.collection('data_dokter');

  static Future<void> updateData(
      String? documentId,
      String nama,
      String alamat,
      int? agama,
      String telepon,
      String pekerjaan,
      String suku,
      int? gender,
      String umur,
      String keluhan,
      String? gambar) async {
    await userdata.doc(documentId).set(
      {
        'nama': nama,
        'alamat': alamat,
        'agama': (agama == 1)
            ? 'Islam'
            : (agama == 2)
                ? 'Protestan'
                : (agama == 3)
                    ? 'Katolik'
                    : (agama == 4)
                        ? 'Budha'
                        : (agama == 5)
                            ? 'Hindu'
                            : ' ',
        'telepon': telepon,
        'pekerjaan': pekerjaan,
        'suku': suku,
        'gender': (gender == 1) != null ? 'Laki - Laki' : 'Perempuan',
        'umur': umur,
        'keluhan': keluhan,
        'urlgambar': gambar
      },
    );
  }

  static Future<void> updateDataKeDokter(
      String? id,
      String? antrian,
      String nama,
      String alamat,
      int? agama,
      String telepon,
      String pekerjaan,
      String suku,
      int? gender,
      String umur,
      String keluhan,
      String? gambar) async {
    await datadokter.doc(id).collection('pasien').doc(antrian).set(
      {
        'nama': nama,
        'alamat': alamat,
        'agama': (agama == 1)
            ? 'Islam'
            : (agama == 2)
            ? 'Protestan'
            : (agama == 3)
            ? 'Katolik'
            : (agama == 4)
            ? 'Budha'
            : (agama == 5)
            ? 'Hindu'
            : ' ',
        'telepon': telepon,
        'pekerjaan': pekerjaan,
        'suku': suku,
        'gender': (gender == 1) != null ? 'Laki - Laki' : 'Perempuan',
        'umur': umur,
        'keluhan': keluhan,
        'urlgambar': gambar
      },
    );
  }

  static Future<void> terbacaBlog(String? id) async {

    await blog.doc(id).update(
      {
        'terbaca': int.tryParse('terbaca')! + 1,
      },
    );
  }

  static Future<void> updateOnline(String? id) async {

    await datadokter.doc(id).update(
      {
        'online': false,
      },
    );
  }

  static Future<void> kritikdansaran(String keluhan) async {
    await userdata.doc().set(
      {
        'keluhan': keluhan,
      },
    );
  }

  static Future<DocumentSnapshot> get_dokter(String id) async {
    return await datadokter.doc(id).get();
  }

  static Future<void> deleteuser(String id) async {
    await userdata.doc(id).delete();
  }
}
