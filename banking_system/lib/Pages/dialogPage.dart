import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget dialogBox(BuildContext context){
  return Center(
    child: AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10.0,
      backgroundColor: Color.fromRGBO(10,10,60,1),
      insetPadding: EdgeInsets.all(25.sp),
      icon: Icon(Icons.warning_rounded,color: Colors.white,size: 50.sp,),
      title: Text('Invalid Transaction'),
      titleTextStyle: GoogleFonts.itim(
        color: Colors.white,
        fontSize: 17.sp,
        fontWeight: FontWeight.bold,
      ),
      titlePadding: EdgeInsets.only(top: 0.sp,left: 15.sp,),
      content: Text('You entered an invalid amount, as the entered transaction balance is greater than the current balance of customer.'),
      contentTextStyle: GoogleFonts.itim(
        color: Colors.white,
        fontSize: 15.sp,
        fontWeight: FontWeight.normal,
      ),
      contentPadding: EdgeInsets.only(top: 20.sp,left: 30.sp,bottom: 20.sp,right: 20.sp,),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadowColor: Colors.amber,
            padding: EdgeInsets.all(5.sp),
            elevation: 3.sp,
            backgroundColor: Colors.deepPurple[900],
            foregroundColor: Colors.black,
          ),
          child: Text('Okay',
            style: GoogleFonts.itim(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.only(left: 15.sp,bottom: 15.sp,right: 15.sp),
    ),
  );
}






