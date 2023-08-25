import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_flutter/Colors.dart';
import 'package:foodies_flutter/authentication/login_screen.dart';

import 'package:foodies_flutter/authentication/signup_screen.dart';
import 'package:foodies_flutter/widgets/button_orange.dart';
import 'package:lottie/lottie.dart';

class IntroThree extends StatefulWidget {
  const IntroThree({super.key});

  @override
  State<IntroThree> createState() => _IntroThreeState();
}

class _IntroThreeState extends State<IntroThree> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            top: 134.h,
            left: 20.w,
            child: Container(
             
              width: 370.w,
              height: 430.h,
              child: Lottie.asset('assets/delivery.json')),
          ),
            
            Positioned(
              top: 530.h,
              left: 87.w,
              child: Text(
                'Speedy Deliveries',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
            
                  ),
                
                ),
            ),
          
               Positioned(
              top: 580.h,
              left: 60.w,
              child: Text(
                'Craving satisfaction, incoming fast.',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
            
                  ),
                
                ),
            ),
               Positioned(
              top: 600.h,
              left: 40.w,
              child: Text(
                'Experience the speed of flavor delivered!',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
            
                  ),
                
                ),
            ),
            Positioned(
              top: 645.h,
              left: 26.w,
              child: CustumButton(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: ((context) => LoginScreen())));}
              
              , text: 'GET STARTED')
            ),
         
        ],
      ),
    );
  }
}