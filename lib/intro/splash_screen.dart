import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodies_flutter/intro/onboarding_page.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () { 
        Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => IntroScreen())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Lottie.asset('assets/foodies.json'),
        ),
      ),
    );
  }
}