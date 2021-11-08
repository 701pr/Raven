import 'package:flutter/material.dart';
import 'package:pocketklawbook/Cliset.dart';
import 'package:pocketklawbook/Consult.dart';
import 'package:pocketklawbook/Splash.dart';
import 'package:pocketklawbook/main.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  late PageController _pageController;
  int selectedIndex = 0;

  User? clients = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("clients")
        .doc(clients!.uid)
        .get()
        .then(
      (value) {
        this.loggedInUser = UserModel.fromMap(value.data());
        _pageController = PageController(initialPage: 0);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          Consult(),
          Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.book,
              size: 56,
              color: Colors.green[400],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.announcement,
              size: 56,
              color: Colors.amber,
            ),
          ),
          Cliset()
        ],
      ),
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Colors.white,
        onButtonPressed: (index) {
          setState(() {
            selectedIndex = index;
          });
          _pageController.animateToPage(selectedIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad);
        },
        iconSize: 30,
        activeColor: Color(0xFF01579B),
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            icon: Icons.live_help,
            title: 'Consult',
          ),
          BarItem(
            icon: Icons.book,
            title: 'Laws',
          ),
          BarItem(
            icon: Icons.announcement,
            title: 'Queries',
          ),
          BarItem(
            icon: Icons.tune_rounded,
            title: 'Settings',
          ),
        ],
      ),
    );
  }
}
