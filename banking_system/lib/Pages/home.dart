import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:banking_system/Pages/screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:banking_system/Pages/transactionPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/96439-loading-bank.json',width: 200.w,height: 200.h,),
            SizedBox(height: 10.h,),
            Divider(color: Colors.grey,thickness: 3.0,indent: 25,endIndent: 25,),
            Text('BASIC BANKING SYSTEM APP',
              style: GoogleFonts.itim(fontWeight: FontWeight.bold,fontSize: 18.sp,color: Colors.black,letterSpacing:0.3,),
            ),
            Divider(color: Colors.grey,thickness: 3.0,indent: 25,endIndent: 25,),
            SizedBox(height: 45.h,),
            buttonWidget('assets/icons/customer1.png',Icons.keyboard_arrow_right,'View all Customers',CustomersPage()),
            SizedBox(height: 1.sp,),
            buttonWidget('assets/icons/transaction.png',Icons.keyboard_arrow_right,'Transaction History',MoneyTransactions()),
          ],
        ),
      ),
    );
  }
  Widget buttonWidget(String imagePath, IconData icon, String buttonText,StatefulWidget buttonClass){
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder:(context)=> buttonClass));
        },
        style: ElevatedButton.styleFrom(
          elevation: 15.0,
          padding: EdgeInsets.all(12.sp),
          shadowColor: Colors.black,
          foregroundColor: Colors.white,
          backgroundColor: Color.fromRGBO(0,0,120,1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(imagePath,color: Colors.white,width: 32.w,height: 32.h,),
                SizedBox(width: 17.w),
                Text(buttonText,
                  style: GoogleFonts.itim(fontWeight: FontWeight.normal,fontSize: 17.sp,),
                ),
              ]
            ),
            Icon(icon,size: 25.sp,),
          ],
        ),
      ),
    );
  }
}




