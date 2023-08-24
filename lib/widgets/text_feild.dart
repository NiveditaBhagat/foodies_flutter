import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Colors.dart';

class CustumTextFeild extends StatefulWidget {
  final String ?hintText;
  final bool? isObscureText;
  CustumTextFeild ({
   required this.hintText,
   required this.isObscureText,
   });

  @override
  State<CustumTextFeild > createState() => _CustumTextFeildState();
}

class _CustumTextFeildState extends State<CustumTextFeild > {
  @override
  Widget build(BuildContext context) {
    return     TextField(
      obscureText: widget.isObscureText!,
                            cursorColor: OrangeColor,
                            decoration: InputDecoration(
                              hintText: widget.hintText!,
                              hintStyle: TextStyle(
                                fontSize: 14.sp,
                                color: SmallTextColor,
                              
                              ),
                                 filled: true,
                                 fillColor: textFieldColor,
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          ), 
                                  
                            ),
                           
                     
                          );
  }
}