import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocketklawbook/Choose.dart';
import 'package:pocketklawbook/Mainpage.dart';
import 'package:pocketklawbook/Lawpage.dart';

import 'model/user_model.dart';

class Cliset extends StatefulWidget {
  @override
  _ClisetState createState() => _ClisetState();
}

class _ClisetState extends State<Cliset> {
  PageController page = PageController();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then(
      (value) {
        this.loggedInUser = UserModel.fromMap(value.data());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setttings"),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: page,
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              // backgroundColor: Colors.amber
              // openSideMenuWidth: 200
            ),
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                  ),
                  child: Image.asset(
                    'assets/logo.jpg',
                  ),
                ),
                Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Delete account',
                onTap: () {
                  page.jumpToPage(0);
                },
                icon: Icons.delete,
              ),
              SideMenuItem(
                priority: 1,
                title: 'Logout',
                onTap: () {
                  page.jumpToPage(1);
                },
                icon: Icons.logout_sharp,
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          maxLines: 1,
                          maxLength: 50,
                          textAlign: TextAlign.start,
                          decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.red)),
                              hintText: 'E-mail',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10),
                                child: const Icon(
                                  Icons.email,
                                  color: Colors.black87,
                                ),
                              ),
                              prefixText: ' ',
                              suffixStyle:
                                  const TextStyle(color: Colors.green)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          maxLines: 1,
                          maxLength: 50,
                          obscureText: true,
                          textAlign: TextAlign.start,
                          decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.red)),
                              hintText: 'Password',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10),
                                child: const Icon(
                                  Icons.password,
                                  color: Colors.black87,
                                ),
                              ),
                              prefixText: ' ',
                              suffixStyle:
                                  const TextStyle(color: Colors.green)),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: Text("Delete",
                                style: GoogleFonts.ubuntu(fontSize: 13)),
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                  width: 2,
                                  color: Colors.black87,
                                ),
                                primary: Colors.red[700],
                                onPrimary: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Text("DO YOU WANT TO LOG OUT?",
                              style: GoogleFonts.oswald(
                                  fontSize: 30, fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _signOut();
                            },
                            child: Text(
                              "YES",
                            ),
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                  width: 0.5,
                                  color: Colors.black87,
                                ),
                                primary: Colors.grey[700],
                                onPrimary: Colors.black87,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Mainpage()));
                            },
                            child: Text(
                              "NO",
                            ),
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                  width: 0.5,
                                  color: Colors.black87,
                                ),
                                primary: Colors.greenAccent[700],
                                onPrimary: Colors.black87,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed('/');
  }
}
