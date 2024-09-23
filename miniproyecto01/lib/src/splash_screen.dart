import 'package:flutter/material.dart';
import './home_page.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 3000),
      () => Navigator.pushReplacement(
        context, MaterialPageRoute(builder:(context) => HomePage())));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', width: 200, height: 200),
            SizedBox(height: 500),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}