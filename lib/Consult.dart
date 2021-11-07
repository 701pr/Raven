import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_plus/dropdown_plus.dart';

class Consult extends StatefulWidget {
  @override
  _ConsultState createState() => _ConsultState();
}

class _ConsultState extends State<Consult> {
  final List<Map<String, dynamic>> _roles = [
    {"name": "Divorce/ Matrimonial issue", "desc": "", "role": 1},
    {"name": "Property issue", "desc": "", "role": 2},
    {"name": "Family & inheritance issue", "desc": "", "role": 3},
    {"name": "Cheque/Loan/Recovery issue", "desc": "", "role": 4},
    {"name": "Employment issue", "desc": "", "role": 5},
    {"name": "Criminal issue", "desc": "", "role": 6},
    {"name": "Consumer issue", "desc": "", "role": 7},
    {"name": "Accident & Insurance issue", "desc": "", "role": 8},
    {"name": "Armed force tribunal matter", "desc": "", "role": 9},
    {"name": "Business/corporate/start-up issue", "desc": "", "role": 10},
    {"name": "Civil", "desc": "", "role": 11},
    {"name": "Supreme court matter", "desc": "", "role": 12},
    {"name": "Muslim law", "desc": "", "role": 13},
    {"name": "Immigration issue", "desc": "", "role": 14},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Consult",
          style: GoogleFonts.abel(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            /*    TextDropdownFormField(
              options: ["Male", "Female"],
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  labelText: "Gender"),
              dropdownHeight: 120,
            ),*/
            SizedBox(
              height: 16,
            ),
            DropdownFormField<Map<String, dynamic>>(
              onEmptyActionPressed: () async {},
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  labelText: "Select area of law"),
              onSaved: (dynamic str) {},
              onChanged: (dynamic str) {},
              validator: (dynamic str) {},
              displayItemFn: (dynamic item) => Text(
                (item ?? {})['name'] ?? '',
                style: TextStyle(fontSize: 16),
              ),
              findFn: (dynamic str) async => _roles,
              selectedFn: (dynamic item1, dynamic item2) {
                if (item1 != null && item2 != null) {
                  return item1['name'] == item2['name'];
                }
                return false;
              },
              filterFn: (dynamic item, str) =>
                  item['name'].toLowerCase().indexOf(str.toLowerCase()) >= 0,
              dropdownItemFn: (dynamic item, int position, bool focused,
                      bool selected, Function() onTap) =>
                  ListTile(
                title: Text(item['name']),
                subtitle: Text(
                  item['desc'] ?? '',
                ),
                tileColor:
                    focused ? Color.fromARGB(20, 0, 0, 0) : Colors.transparent,
                onTap: onTap,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 15,
            ),
            Theme(
              data: new ThemeData(
                primaryColor: Colors.redAccent,
                primaryColorDark: Colors.red,
              ),
              child: new TextField(
                maxLines: 1,
                maxLength: 50,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: 'Subject',
                    labelText: 'Subject',
                    prefixIcon: const Icon(
                      Icons.subject,
                      color: Colors.green,
                    ),
                    prefixText: ' ',
                    suffixStyle: const TextStyle(color: Colors.green)),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Theme(
              data: new ThemeData(
                primaryColor: Colors.redAccent,
                primaryColorDark: Colors.red,
              ),
              child: new TextFormField(
                autocorrect: true,
                maxLines: 5,
                maxLength: 1000,
                textAlign: TextAlign.start,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: 'Type your query',
                    helperText: 'Keep it concise.',
                    labelText: 'Query',
                    alignLabelWithHint: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 15, bottom: 77),
                      child: const Icon(
                        Icons.announcement,
                        color: Colors.green,
                      ),
                    ),
                    prefixText: ' ',
                    suffixStyle: const TextStyle(color: Colors.green)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child:
                      Text("Submit", style: GoogleFonts.ubuntu(fontSize: 13)),
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        width: 0,
                        color: Colors.grey,
                      ),
                      primary: Colors.black87,
                      onPrimary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
