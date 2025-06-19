import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/UI/Screens/DashBaord.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashBoard(),)),);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: Center(
        child: Image.asset("assets/images/gif/logo_.gif"),
      ),
    );
  }
}