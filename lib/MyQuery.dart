import 'package:flutter/material.dart';

class MyQuery extends StatefulWidget {
  const MyQuery({Key? key}) : super(key: key);

  @override
  _MyQueryState createState() => _MyQueryState();
}

class _MyQueryState extends State<MyQuery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latest Query"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 150,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1)),
              child: Text(
                "Text Area Text Area Text Area Text Area Text Area Text Area Text Area Text Area Text Area Text Area Text Area .................. Status: Answered             6th,Nov ",
                style: TextStyle(color: Colors.blueAccent, fontSize: 15),
              ),
            ),
            Container(
              height: 150,
              width: double.infinity,
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1)),
              child: Text(
                "Text Area Text Area Text Area Text Area Text Area Text Area Text Area Text Area Text Area Text Area Text Area .................. Status: Unanswered           16th,Nov ",
                style: TextStyle(color: Colors.red, fontSize: 15),
              ),
            ),
            Container(
              height: 150,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1)),
              child: Text(
                  "Text Area Text Area Text Area Text Area Text Area Text Area Text Area Text Area Text Area Text Area Text Area .................. Status: Answered             20th,Oct ",
                  style: TextStyle(color: Colors.blue, fontSize: 15)),
            )
          ]),
    );
  }
}
