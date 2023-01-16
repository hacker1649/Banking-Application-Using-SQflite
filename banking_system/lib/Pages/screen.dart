import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:banking_system/Data Storage/database.dart';
import 'package:banking_system/Classes/customer.dart';
import 'package:banking_system/Pages/customerPage.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({Key? key}) : super(key: key);

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  List<String> imagePaths=[
    'assets/icons/man3.png',
    'assets/icons/avatar.png',
    'assets/icons/woman3.png',
    'assets/icons/bussiness-man.png',
    'assets/icons/farmer.png',
    'assets/icons/adultwoman.png',
    'assets/icons/hacker.png',
    'assets/icons/auntywoman.png',
    'assets/icons/boy.png',
    'assets/icons/baby.png',
    'assets/icons/arab-woman.png',
    'assets/icons/woman.png',
    'assets/icons/schoolgirl.png',
    'assets/icons/schoolboy.png',
    'assets/icons/businesswoman.png',
  ];
  late List<Customer> customers=[];
  bool isloading=false;
  @override
  void initState() {
    super.initState();
    refreshAllCustomerData();
  }
  Future refreshAllCustomerData() async{
    setState(() => isloading=true);
    this.customers=await DatabaseHelper.instance.readAllRecords();
    setState(() => isloading=false);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BANK ACCOUNTS:',
            style: GoogleFonts.itim(color:Colors.black,fontWeight:FontWeight.bold,fontSize:17.sp,),
          ),
          automaticallyImplyLeading: false,
          elevation: 0.sp,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: isloading
            ? CircularProgressIndicator()
            : customers.isEmpty
              ? Text('No Customer Bank Records found',style: GoogleFonts.itim(fontSize:  17.sp,fontWeight: FontWeight.normal),)
              : showCustomerRecords(),
        ),
      ),
    );
  }
  Widget showCustomerRecords(){
    return ListView.builder(
      padding: EdgeInsets.all(5.sp),
      physics: BouncingScrollPhysics(),
      itemCount: customers.length,
      itemBuilder: ((context, index){
        final currentUser=customers[index];
        final picture=imagePaths[index];
        return GestureDetector(
          onTap: () async{
            await Navigator.of(context).push(MaterialPageRoute(builder: ((context) => CustomerDetailPage(customer: currentUser,imagePath: picture,))));
          },
          child: Card(
            color: Color.fromRGBO(0,0,120,1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadowColor: Colors.black,
            elevation: 0.sp,
            child: ListTile(
              leading: Image.asset('assets/icons/user3.png',color: Colors.white,width: 35.w,height: 35.h,),
              title: Text(currentUser.name,
                style: GoogleFonts.itim(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(currentUser.emailAddress,
                style: GoogleFonts.itim(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
              trailing: Text('PKR '+currentUser.currentBalance.toStringAsFixed(2),
                style: GoogleFonts.itim(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      } 
      ),
    );
  }
}






