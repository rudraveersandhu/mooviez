import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quad_movies/root_page.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Navigate to the HomePage after a delay
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RootPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset(
          'assets/moviez.json', // Replace with your Lottie JSON file

          height: 200,
          fit: BoxFit.cover,
          repeat: false
        ),
      ),
    );
  }
}
