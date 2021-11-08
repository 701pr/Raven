import 'package:flutter/material.dart';
import 'query.dart';

class Querycard extends StatelessWidget {
  final Query query;
  final Function delete;
  Querycard({required this.query, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              query.text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.cyan[600],
              ), //TextStyle
            ), //text
            SizedBox(height: 10.0),
            Text(
              query.law,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.cyan[600],
              ),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              child: Text('Delete'),
              onPressed: () {
                delete(query);
              },
            ),
          ], //<widget>
        ),
      ), //column
    ); //card
  }
}
