import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class IntroOne extends StatefulWidget {
  const IntroOne({super.key});

  @override
  State<IntroOne> createState() => _IntroOneState();
}

class _IntroOneState extends State<IntroOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            top: 184.h,
            left: 55.w,
            child: Container(
             
              width: 280.w,
              height: 350.h,
              child: Lottie.asset('assets/Girl.json')),
          ),
            
            Positioned(
              top: 519.h,
              left: 80.w,
              child: Text(
                'Embark on a Flavorful',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
            
                  ),
                
                ),
            ),
              Positioned(
              top: 541.h,
              left: 140.w,
              child: Text(
                'Journey',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
            
                  ),
                
                ),
            ),
               Positioned(
              top: 610.h,
              left: 40.w,
              child: Text(
                'Embark on a tasty journey with our app.',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
            
                  ),
                
                ),
            ),
               Positioned(
              top: 630.h,
              left: 25.w,
              child: Text(
                'Explore a variety of cuisines to satisfy cravings ',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
            
                  ),
                
                ),
            ),
             Positioned(
              top: 650.h,
              left: 75.w,
              child: Text(
                'and treat your taste buds. ',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
            
                  ),
                
                ),
            ),
        ],
      ),
    );
  }
}