import 'package:flutter/material.dart';
import 'package:banking_system/Classes/customer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:banking_system/Pages/transferScreen.dart';

class CustomerDetailPage extends StatelessWidget {
  final Customer customer;
  final String imagePath;
  CustomerDetailPage({required this.customer,required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('CUSTOMER DETAILS:',
            style: GoogleFonts.itim(color:Colors.black,fontWeight:FontWeight.bold,fontSize:17.sp,),
          ),
          automaticallyImplyLeading: false,
          elevation: 0.sp,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 10.sp,right: 10.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(imagePath,width: 150.w,height: 150.h,),
                SizedBox(height: 20.sp,),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Name = ',style: GoogleFonts.itim(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,),
                      ),
                      TextSpan(text: customer.name,style: GoogleFonts.itim(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,),
                      ),
                    ]
                  ),
                ),
                SizedBox(height: 20.sp,),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Email Address = ',style: GoogleFonts.itim(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,),
                      ),
                      TextSpan(text: customer.emailAddress,style: GoogleFonts.itim(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,),
                      ),
                    ]
                  ),
                ),
                SizedBox(height: 20.sp,),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Account Number = ',style: GoogleFonts.itim(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,),
                      ),
                      TextSpan(text: customer.accountNumber.toString(),style: GoogleFonts.itim(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,),
                      ),
                    ]
                  ),
                ),
                SizedBox(height: 20.sp,),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Phone Number = ',style: GoogleFonts.itim(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,),
                      ),
                      TextSpan(text: customer.phoneNumber,style: GoogleFonts.itim(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,),
                      ),
                    ]
                  ),
                ),
                SizedBox(height: 20.sp,),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'CNIC Number = ',style: GoogleFonts.itim(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,),
                      ),
                      TextSpan(text: customer.cnic,style: GoogleFonts.itim(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,),
                      ),
                    ]
                  ),
                ),
                SizedBox(height: 20.sp,),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Current Balance = ',style: GoogleFonts.itim(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,),
                      ),
                      TextSpan(text: 'PKR '+ customer.currentBalance.toStringAsFixed(2),style: GoogleFonts.itim(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,),
                      ),
                    ]
                  ),
                ),
                SizedBox(height: 20.sp,),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Region = ',style: GoogleFonts.itim(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,),
                      ),
                      TextSpan(text: customer.region,style: GoogleFonts.itim(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,),
                      ),
                    ]
                  ),
                ),
                SizedBox(height: 45.sp,),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.only(top:15.sp, bottom: 15.sp,left: 30.sp,right: 30.sp),
                    elevation: 10.sp,
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromRGBO(0,0,120,1),
                  ),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder:(context)=> TransferMoneyScreen(user: customer,)));
                  },
                  icon: Icon(Icons.transfer_within_a_station_rounded,size: 25.sp,),
                  label: Text('Money Transaction',
                    style: GoogleFonts.itim(fontWeight: FontWeight.normal,fontSize: 17.sp,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




