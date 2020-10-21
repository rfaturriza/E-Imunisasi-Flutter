import 'package:e_imunisasi/pages/notifpage/notifpage.dart';
import 'package:flutter/material.dart';

class BukuSehatPage extends StatefulWidget {
  @override
  _BukuSehatPageState createState() => _BukuSehatPageState();
}

class _BukuSehatPageState extends State<BukuSehatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "Buku Sehat",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
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
    );
  }
}
