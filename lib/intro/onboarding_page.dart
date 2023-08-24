import 'package:flutter/material.dart';
import 'package:foodies_flutter/Colors.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_flutter/intro/intro_screens/intro_screen1.dart';

import 'intro_screens/intro_screen2.dart';
import 'intro_screens/intro_screen3.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController _controller=PageController();
  bool isLastPage=false;

   @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        isLastPage = _controller.page == 2;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
           

            children: [
             IntroOne(),
             IntroTwo(),
             IntroThree()
            ],
          ),
          Container(
            
            child: isLastPage ?
            Positioned(
              left: 160.w,
             bottom: 76.h,
              child: SmoothPageIndicator(
                controller: _controller, 
                count: 3,
                effect: WormEffect(
                    dotHeight: 12.h,
                    dotWidth: 12.h,
                    type: WormType.normal,
                    activeDotColor: OrangeColor,
                  ),
               
                ),
            ): Positioned(
                 left: 70.w,
                  bottom: 76.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _controller.jumpToPage(2);
                        },
                        child: Text('Skip',
                         style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold
                         ),
                        ),
                      ),
                      SizedBox(width: 70.w,),
                         SmoothPageIndicator(
                          controller: _controller, 
                           count: 3,
                          effect: WormEffect(
                            dotHeight: 12.h,
                          dotWidth: 12.h,
                              type: WormType.normal,
                             activeDotColor: OrangeColor,
                          ),
                          ),
                           SizedBox(width: 70.w,),
                          GestureDetector(
                             onTap: () {
                          _controller.nextPage(duration: Duration(
                            microseconds: 500,
                          ), curve: Curves.easeIn);
                        },
                            child: Text(
                              'Next',
                              style: TextStyle(
                                color: OrangeColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold
                              ),
                              
                              ),
                          ),
                    ],
                ),
              ),
          ) ,
        ],
      ),
    );
  }
}