import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:e_imunisasi/models/user.dart';
import 'package:path/path.dart';

class DatabaseService {
  final String uid;
  final String email;
  DatabaseService({this.uid, this.email});

  //Colection Reference
  final CollectionReference imunisasiCollection =
      Firestore.instance.collection('eimunisasi');
  final CollectionReference anakCollection =
      Firestore.instance.collection('anak/balita');
  final CollectionReference medisCollection =
      Firestore.instance.collection('tenagamedis');

  // Future updateUserData(
  //     String nama,
  //     String nik,
  //     String tgllahir,
  //     String namaAyah,
  //     String pekerjaanAyah,
  //     String namaIbu,
  //     String pekerjaanIbu,
  //     String alamat,
  //     String noTlp) async {
  //   return await imunisasiCollection.document(uid).setData({
  //     'nama': nama,
  //     'nik': nik,
  //     'tgllahir': tgllahir,
  //     'namaAyah': namaAyah,
  //     'pekerjaanAyah': pekerjaanAyah,
  //     'namaIbu': namaIbu,
  //     'pekerjaanIbu': pekerjaanIbu,
  //     'alamat': alamat,
  //     'noTelp': noTlp,
  //   }, merge: true);
  // }

  Future updateUserData(
      String nama,
      String nik,
      String tgllahir,
      String namaAyah,
      String pekerjaanAyah,
      String namaIbu,
      String pekerjaanIbu,
      String alamat,
      String noTlp) async {
    return await imunisasiCollection
        .document('anakCollection')
        .collection('personalData')
        .document(uid)
        .setData({
      'nama': nama,
      'nik': nik,
      'tgllahir': tgllahir,
      'namaAyah': namaAyah,
      'pekerjaanAyah': pekerjaanAyah,
      'namaIbu': namaIbu,
      'pekerjaanIbu': pekerjaanIbu,
      'alamat': alamat,
      'noTelp': noTlp,
    }, merge: true);
  }

  // Future uploadAvatar(String avatarURL) async {
  //   return await imunisasiCollection.document(uid).setData({
  //     'avatarURL': avatarURL,
  //   }, merge: true);
  // }

  Future uploadAvatar(String avatarURL) async {
    return await imunisasiCollection
        .document('anakCollection')
        .collection('personalData')
        .document(uid)
        .setData({
      'avatarURL': avatarURL,
    }, merge: true);
  }
  //list from snapshot
  // List<Peltops> _listFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.documents.map((e) {
  //     return Peltops(
  //       name: e.data['name'] ?? '',
  //       strength: e.data['strength'] ?? 0,
  //       sugars: e.data['sugars'] ?? '0',
  //     );
  //   }).toList();
  // }

  // USerdata from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      email: email,
      avatarURL: snapshot.data['avatarURL'] ?? '',
      nama: snapshot.data['nama'],
      nik: snapshot.data['nik'] ?? '',
      tgllahir: snapshot.data['tgllahir'] ?? '',
      namaAyah: snapshot.data['namaAyah'] ?? '',
      pekerjaanAyah: snapshot.data['pekerjaanAyah'] ?? '',
      namaIbu: snapshot.data['namaIbu'] ?? '',
      pekerjaanIbu: snapshot.data['pekerjaanIbu'] ?? '',
      alamat: snapshot.data['alamat'] ?? '',
      noTlp: snapshot.data['noTelp'] ?? '',
    );
  }

  //Get Peltops Stream
  // Stream<List<Peltops>> get peltops {
  //   return imunisasiCollection.snapshots().map(_listFromSnapshot);
  // }

  //get user doc stream
  Stream<UserData> get userData {
    return imunisasiCollection
        .document('anakCollection')
        .collection('personalData')
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }

  //Upload Image firebase Storage
  static Future<String> uploadImage(File imageFile) async {
    String fileName = basename(imageFile.path);
    StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask task = ref.putFile(imageFile);
    StorageTaskSnapshot snapshot = await task.onComplete;

    return await snapshot.ref.getDownloadURL();
  }
}
