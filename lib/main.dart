import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_flutter/intro/onboarding_page.dart';

import 'intro/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  Size(375, 812),
      builder: (context, child){
      return  MaterialApp(
      debugShowCheckedModeBanner: false,
    home: child,

     
    );
    },
    child: SplashScreen(),
    );
   
  }
}


