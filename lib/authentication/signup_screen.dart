import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_flutter/Colors.dart';
import 'package:foodies_flutter/widgets/button_orange.dart';
import 'package:foodies_flutter/widgets/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Container(
          color: BoldTextColor,
          child: Column(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                height: 233.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30,),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 13.h,),
                    Text(
                       'Please sign up to get started',
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 16.sp,
                        
                       ),
                     ),
                  ],
                ),
              ),
                   
                Container(
                  
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(24.r), topRight: Radius.circular(24.r))
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(24.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NAME',
                          style: TextStyle(
                            color: BoldTextColor,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(height: 10.h,),
                    CustumTextFeild(hintText: 'Name' , isObscureText: false,),
                    SizedBox(height: 26.h,),
                       Text(
                          'EMAIL',
                          style: TextStyle(
                            color: BoldTextColor,
                            fontSize: 14.sp,
                          ),
                        ),
                         SizedBox(height: 10.h,),
                         CustumTextFeild(hintText: 'Email' , isObscureText: false,),
                          SizedBox(height: 26.h,),
                         Text(
                          'PHONE NO.',
                          style: TextStyle(
                            color: BoldTextColor,
                            fontSize: 14.sp,
                          ),
                        ),
                         SizedBox(height: 10.h,),
                         CustumTextFeild(hintText: 'Phone no.' , isObscureText: false,),
                          SizedBox(height: 26.h,),
                          Text(
                          'PASSWORD',
                          style: TextStyle(
                            color: BoldTextColor,
                            fontSize: 14.sp,
                          ),
                        ),
                         SizedBox(height: 10.h,),
                        CustumTextFeild(hintText: 'Password' , isObscureText: true,),
                           SizedBox(height: 26.h,),
                        CustumButton(onTap: (){}, text: 'SIGN UP')
                      ],
                    ),
                  ),
                            ),
            ],
          ),
        ),
      ),
    );
  }
}