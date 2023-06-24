import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: ProfilePage(),
));

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('내 정보'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/user.jpeg'),
                radius: 40,
              ),
            ),
            Divider(
              height: 60,
              color: Colors.grey[800],
            ),
            Text(
              '이름',
              style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2
              ),
            ),
            SizedBox(height: 10),
            Text(
              '유성경',
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30),
            Text(
              '전화번호',
              style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2
              ),
            ),
            SizedBox(height: 10),
            Text(
              '010-5564-8202',
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'keith@mail.com',
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 18,
                      letterSpacing: 1
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}