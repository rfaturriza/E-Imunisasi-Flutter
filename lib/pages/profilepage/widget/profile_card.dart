import 'package:e_imunisasi/models/user.dart';
import 'package:flutter/material.dart';
import 'package:e_imunisasi/services/database.dart';
import 'package:provider/provider.dart';
import 'package:e_imunisasi/pages/profilepage/personalpage.dart';
import 'package:e_imunisasi/services/auth.dart';

class ProfileCard extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid, email: user.email).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                child: Center(
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        shadowColor: Colors.deepOrange[100],
                        elevation: 5.0,
                        child: Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 16.0),
                              leading: userData.avatarURL == null
                                  ? CircleAvatar(
                                      foregroundColor: Colors.white,
                                      radius: 50.0,
                                      child: Text(
                                        userData.nama.substring(0, 1),
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )
                                  : CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          NetworkImage(userData.avatarURL),
                                    ),
                              title: Text(
                                userData.nama,
                                style: TextStyle(fontSize: 20.0),
                              ),
                              subtitle: Text(userData.email),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PersonalPage()));
                              },
                            ),
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
                            SizedBox(height: 20.0)
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
