import 'package:flutter/material.dart';
import '../bukusehatpage/bukusehatpage.dart';
import '../infopage/infopage.dart';
import '../kalenderpage/kalenderpage.dart';
import '../profilepage/profilepage.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    KalenderPage(),
    BukuSehatPage(),
    InfoPage(),
    ProfilPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Kalender'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Buku Sehat'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('Informasi'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profil'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.black38,
        elevation: 20.0,
        showUnselectedLabels: true,
        selectedIconTheme: IconThemeData(size: 26.0),
        onTap: _onItemTapped,
      ),
    );
  }
}
