import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:banking_system/Classes/transaction.dart';
import 'package:banking_system/Data Storage/database.dart';

class MoneyTransactions extends StatefulWidget {
  const MoneyTransactions({Key? key}) : super(key: key);

  @override
  State<MoneyTransactions> createState() => _MoneyTransactionsState();
}

class _MoneyTransactionsState extends State<MoneyTransactions> {
  late List<Transactions> transactions=[];
  bool isloading=false;
  @override
  void initState() {
    super.initState();
    refreshAllCustomerTransactions();
  }
  Future refreshAllCustomerTransactions() async{
    setState(() => isloading=true);
    transactions=await DatabaseHelper.instance.readAllCustomerTransactions();
    setState(() => isloading=false);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('TRANSACTION HISTORY:',
            style: GoogleFonts.itim(color:Colors.black,fontWeight:FontWeight.bold,fontSize:17.sp,),
          ),
          automaticallyImplyLeading: false,
          elevation: 0.sp,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: isloading
              ? CircularProgressIndicator()
              : transactions.isEmpty
               ? Text('No Transactions yet performed',style: GoogleFonts.itim(fontSize:  17.sp,fontWeight: FontWeight.normal),)
               : showCustomerTransactions(),
        ),
      ),
    );
  }
  Widget showCustomerTransactions(){
    return ListView.builder(
      padding: EdgeInsets.all(5.sp),
      physics: BouncingScrollPhysics(),
      itemCount: transactions.length,
      itemBuilder: ((context, index){
        final currentTransaction=transactions[index];
        return GestureDetector(
          onTap: () {},
          child: Card(
            color: Color.fromRGBO(0,0,120,1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadowColor: Colors.black,
            elevation: 0.sp,
            child: ListTile(
              leading:  Icon(Icons.people_alt_rounded,size: 35.sp,color: Colors.white,),
              title: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                    children: [
                      TextSpan(text: 'From : ',style: GoogleFonts.itim(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,),
                      ),
                      TextSpan(text: currentTransaction.senderName,style: GoogleFonts.itim(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 15.sp,),
                      ),
                    ]
                ),
              ),
              subtitle: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                    children: [
                      TextSpan(text: 'To : ',style: GoogleFonts.itim(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,),
                      ),
                      TextSpan(text: currentTransaction.receiverName,style: GoogleFonts.itim(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 15.sp,),
                      ),
                    ]
                ),
              ),
              trailing: Text('PKR ${currentTransaction.transferedBalance.toStringAsFixed(2)}',
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






