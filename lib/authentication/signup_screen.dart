import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_flutter/Colors.dart';
import 'package:foodies_flutter/widgets/button_orange.dart';
import 'package:foodies_flutter/widgets/text_field.dart';
import 'package:foodies_flutter/maps_screens/google_maps.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void _signUp() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (userCredential.user != null) {
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'name': _nameController.text,
          'email': _emailController.text,
          'password': _passwordController.text, // Note: Storing passwords in plain text is not secure, consider hashing.
        });

        print('User signed up and data saved in Firestore.');
      }
    } catch (e) {
      print('Error signing up user: $e');
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
                    CustumTextFeild(hintText: 'Name' , isObscureText: false,controller: _nameController,),
                    SizedBox(height: 26.h,),
                       Text(
                          'EMAIL',
                          style: TextStyle(
                            color: BoldTextColor,
                            fontSize: 14.sp,
                          ),
                        ),
                         SizedBox(height: 10.h,),
                         CustumTextFeild(hintText: 'Email' , isObscureText: false,controller: _emailController,),
                       
                          SizedBox(height: 26.h,),
                          Text(
                          'PASSWORD',
                          style: TextStyle(
                            color: BoldTextColor,
                            fontSize: 14.sp,
                          ),
                        ),
                         SizedBox(height: 10.h,),
                        CustumTextFeild(hintText: 'Password' , isObscureText: true,controller: _passwordController,),
                           SizedBox(height: 46.h,),
                        CustumButton(onTap: (){
                          _signUp();
                           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MapScreen()), (route) => false);
                        }, text: 'SIGN UP'),
                        SizedBox(height: 200.h,)
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