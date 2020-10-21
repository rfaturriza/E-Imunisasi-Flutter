import 'package:e_imunisasi/pages/notifpage/notifpage.dart';
import 'package:e_imunisasi/pages/profilepage/widget/profile_card.dart';
import 'package:e_imunisasi/pages/widget/badge.dart';
import 'package:e_imunisasi/services/auth.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Stack(
            children: [
              badgenotif,
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NotifPage()));
                  },
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.deepOrange,
                  )),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          ProfileCard(),
          FlatButton.icon(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              onPressed: () async {
                await _auth.signOut();
              },
              color: Colors.deepOrange,
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              label: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
