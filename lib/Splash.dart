import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocketklawbook/Choose.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: Choose(),
      title: Text("Raven", style: GoogleFonts.acme(fontSize: 30)),
      image: Image.asset("assets/raven.png"),
      backgroundColor: Colors.white,
      photoSize: 100.0,
      onClick: () => print("Made by agent hitler, FBI"),
      loaderColor: Colors.black,
      loadingText: Text(
        "Loading",
        style: GoogleFonts.acme(fontSize: 30),
      ),
    );
  }
}
