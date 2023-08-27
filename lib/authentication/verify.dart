import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_flutter/Colors.dart';
import 'package:foodies_flutter/authentication/login_screen.dart';
import 'package:foodies_flutter/maps_screens/google_maps.dart';
import 'package:foodies_flutter/widgets/button_orange.dart';
import 'package:lottie/lottie.dart';

import 'package:pinput/pinput.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  TextEditingController countryController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    
    countryController.text = "+91";
    super.initState();
  }
  var code="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         margin: EdgeInsets.only(left: 25.w, right: 25.w),
         alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Container(
                 
                  width: 280.w,
                  height: 250.h,
                  child: Lottie.asset('assets/otp.json')),
                    
                  Text(
                    "OTP VERIFICATION",
                    style: TextStyle(
                      fontSize: 20.h,
                      color: BoldTextColor,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                   SizedBox(
                height: 20.h,
              ),
                   Pinput(
                  length: 6,
                   showCursor: true,
                   onChanged: (value) {
                     code=value;
                   },
                ),
                  SizedBox(
                height: 20.h,
              ),
              CustumButton(
                onTap: () async{
                      try{
                        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: LoginScreen.verify, smsCode: code);

                   // Sign the user in (or link) with the credential
                       await auth.signInWithCredential(credential);
                       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MapScreen()), (route) => false);
                      }catch(e){
                        print('wrong otp');
                      }
                      
                    }, 
                text: "VERIFY"
                )
              
            ],
          ),
        ),
      )
    );
  }
}

