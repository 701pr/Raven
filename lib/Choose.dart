import 'package:flutter/material.dart';
import 'package:pocketklawbook/Mainpage.dart';
import 'package:pocketklawbook/clientScreens/Login.dart';

import 'Lawpage.dart';

class Choose extends StatefulWidget {
  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(maxHeight: 400),
        padding: EdgeInsets.all(32),
        alignment: Alignment.center,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text("Lawyer"),
              style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    width: 0.5,
                    color: Colors.red,
                  ),
                  primary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Mainpage()));
              },
              child: Text("Client"),
              style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    width: 0.5,
                    color: Colors.black87,
                  ),
                  primary: Colors.green,
                  onPrimary: Colors.black87,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
