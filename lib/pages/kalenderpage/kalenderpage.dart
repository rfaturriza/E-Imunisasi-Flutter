import 'package:e_imunisasi/pages/notifpage/notifpage.dart';
import 'package:flutter/material.dart';

class KalenderPage extends StatefulWidget {
  @override
  _KalenderPageState createState() => _KalenderPageState();
}

class _KalenderPageState extends State<KalenderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "Kalender",
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
