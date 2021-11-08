import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
        backgroundColor: Colors.black87,
      ),
      body: ListView(children: <Widget>[
        Center(
            child: Text(
          '',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
        DataTable(
          columns: [
            DataColumn(
                label: Text('Today',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('Queries Resolved : 1611')),
            ]),
            DataRow(cells: [
              DataCell(Text('Income : 1500')),
            ]),
            DataRow(cells: [
              DataCell(Text('Total',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            ]),
            DataRow(cells: [
              DataCell(Text('Queries Resolved : 2611')),
            ]),
            DataRow(cells: [
              DataCell(Text('Income : 3000')),
            ]),
          ],
        ),
      ]),
    );
  }
}
