import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_flutter/Colors.dart';

class CustumButton extends StatelessWidget {
  final String text;
  final Function() onTap;
   CustumButton({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                onTap: 
                 onTap,
              
                child: Container(
                
                  height: 58.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                    color: OrangeColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
  }
}
//  Navigator.push(context, MaterialPageRoute(builder: ((context) => SignUpScreen())));