import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pocketklawbook/Answer.dart';
import 'package:pocketklawbook/Choose.dart';
import 'package:pocketklawbook/Cliset.dart';
import 'package:pocketklawbook/model/user_model.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'Stats.dart';

class Lawpage extends StatefulWidget {
  const Lawpage({Key? key}) : super(key: key);

  @override
  _LawpageState createState() => _LawpageState();
}

class _LawpageState extends State<Lawpage> {
  late PageController _pageController;

  int selectedIndex = 0;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then(
      (value) {
        this.loggedInUser = UserModel.fromMap(value.data());
        _pageController = PageController(initialPage: selectedIndex);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("${loggedInUser.firstName} + " " +${loggedInUser.lastName}"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, "/");
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          AnswerQuery(),
          Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.book,
              size: 56,
              color: Colors.green[400],
            ),
          ),
          Stats(),
          Cliset(),
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
            icon: Icons.edit_sharp,
            title: 'Answer Queries',
          ),
          BarItem(
            icon: Icons.book,
            title: 'Laws',
          ),
          BarItem(
            icon: Icons.assessment_sharp,
            title: 'Statistics',
          ),
          BarItem(
            icon: Icons.tune_rounded,
            title: 'Settings',
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
