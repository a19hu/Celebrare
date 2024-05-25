// stful
import 'dart:async';
import 'package:celebrare/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(245, 255, 255, 255),
          statusBarIconBrightness: Brightness.dark,
        ),
        toolbarHeight: 0,
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(right: 50, left: 50),
          color: Colors.white,
          child: Image.asset('asset/celebrare.webp')),
    );
  }
}
