class User {
  final String uid;
  final String email;
  User({this.uid, this.email});
}

class UserData {
  final String uid;
  final String email;
  final String avatarURL;
  final String nama;
  final String nik;
  final String tgllahir;
  final String namaAyah;
  final String pekerjaanAyah;
  final String namaIbu;
  final String pekerjaanIbu;
  final String alamat;
  final String noTlp;

  UserData(
      {this.uid,
      this.email,
      this.avatarURL,
      this.nama,
      this.nik,
      this.tgllahir,
      this.namaAyah,
      this.pekerjaanAyah,
      this.namaIbu,
      this.pekerjaanIbu,
      this.alamat,
      this.noTlp});
}
