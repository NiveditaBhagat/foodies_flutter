import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_flutter/Colors.dart';
import 'package:foodies_flutter/authentication/signup_screen.dart';
import 'package:foodies_flutter/authentication/verify.dart';
import 'package:foodies_flutter/maps_screens/google_maps.dart';
import 'package:foodies_flutter/widgets/button_orange.dart';
import 'package:foodies_flutter/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
    static String verify=""; 

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController countrycode = TextEditingController();
   final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var phone ='';

  @override
  void initState() {
    
    countrycode.text = "+91";
    super.initState();
  }
 void _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (userCredential.user != null) {
        print('User logged in successfully: ${userCredential.user!.email}');
      }
    } catch (e) {
      print('Error logging in: $e');
    }
  }
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
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 13.h,),
                    Text(
                       'Please log in to get started',
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
                      
                      children: [
                          
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                
                                'Login with phone',
                              
                                style: TextStyle(
                                  
                                  color: BoldTextColor,
                                  fontSize: 16.sp,
                                ),
                                ),
                            ),
                          ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                                       height: 55.h,
                                       decoration: BoxDecoration(
                                         color: Colors.white,
                                           border: Border.all(width: 1, color: Colors.grey),
                                           borderRadius: BorderRadius.circular(10)),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           SizedBox(
                                             width: 10.w,
                                           ),
                                           SizedBox(
                                             width: 40.w,
                                             child: TextField(
                                              cursorColor: OrangeColor,
                                       controller: countrycode,
                                           keyboardType: TextInputType.number,
                                     decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                             ),
                                           ),
                                           Text(
                                             "|",
                                             style: TextStyle(fontSize: 33, color: Colors.grey),
                                           ),
                                           SizedBox(
                                             width: 10..h,
                                           ),
                                           Expanded(
                          child: TextField(
                            cursorColor: OrangeColor,
                            onChanged: (value){
                              phone=value;
                            },
                                             keyboardType: TextInputType.phone,
                                             decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone",
                                             ),
                                           ))
                                         ],
                                       ),
                                     ),
                       ),             
              SizedBox(height: 10.h,),
                         CustumButton(onTap: ()async{
                          await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${countrycode.text+phone}',
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        LoginScreen.verify=verificationId;
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Verify()));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                       );
                         }, text: "SEND OTP"),
                         Padding(
                           padding:  EdgeInsets.only(top: 30.h, left: 15.w, right: 15.w ),
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Text("Don't have an account? ",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: SmallTextColor,
                                ),
                                ),
                                   InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                                    },
                                     child: Text("SIGN UP",
                                  style: TextStyle(
                                  fontSize: 14.sp,
                                   color: OrangeColor,
                                   fontWeight: FontWeight.bold,
                                     ),
                                    ),
                                   ),
                                
                            ],
                           ),
                         ),
                         SizedBox(
                          height: 40,
                         ),
                            Text("Or",
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: SmallTextColor,
                                ),
                            ),
                            SizedBox(height: 15.h,),
                              CustumTextFeild(hintText: 'Email' , isObscureText: false,controller: _emailController,),
                              SizedBox(height: 15.h,),
                                CustumTextFeild(hintText: 'Password' , isObscureText: true,controller: _passwordController,),
                                SizedBox(height: 20,),
                                CustumButton(onTap: (){
                                  _login();
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MapScreen()), (route) => false);
                                }, text: "LOG IN"),
                                SizedBox(height: 15.h,),
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