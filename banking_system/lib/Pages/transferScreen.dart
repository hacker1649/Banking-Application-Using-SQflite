import 'package:banking_system/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:banking_system/Classes/customer.dart';
import 'package:banking_system/Classes/transaction.dart';
import 'package:banking_system/Data%20Storage/database.dart';

class TransferMoneyScreen extends StatefulWidget {
  final Customer user;
  TransferMoneyScreen({required this.user,});
  @override
  State<TransferMoneyScreen> createState() => _TransferMoneyScreenState();
}

class _TransferMoneyScreenState extends State<TransferMoneyScreen> {
  TextEditingController amountController=TextEditingController();
  TextEditingController receiverController=TextEditingController();
  bool  isloading=false;
  @override
  void initState(){
    super.initState();
    amountController.addListener(() => setState(() {}));
    receiverController.addListener(() => setState(() {}));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  GestureDetector(
        onTap:  () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          appBar: AppBar(
            title: Text('ENTER TRANSACTION DETAILS:',
              style: GoogleFonts.itim(color:Colors.black,fontWeight:FontWeight.bold,fontSize:17.sp,),
            ),
            automaticallyImplyLeading: false,
            elevation: 0.sp,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(15.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Lottie.asset('assets/16382-map-bank.json',width: 200.w,height: 200.h,),
                    SizedBox(height: 1.sp,),
                    textfield('CNIC Number','Enter Customer CNIC to transfer money to',receiverController,Icons.person_outline_rounded,TextInputType.text),
                    SizedBox(height: 35.sp,),
                    textfield('Transaction Amount','Enter the amount of money to transfer',amountController,Icons.money_rounded,TextInputType.number),
                    SizedBox(height: 60.sp,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.only(top:15.sp, bottom: 15.sp,left: 30.sp,right: 30.sp),
                        elevation: 10.sp,
                        foregroundColor: Colors.white,
                        backgroundColor: Color.fromRGBO(0,0,120,1),
                      ),
                      onPressed: () async{
                        setState(() => isloading=true);
                        //validating that if the amount entered by the customer is less than or equal to the customers current balance
                        if(int.parse(amountController.text)<=widget.user.currentBalance){
                          //updating the record of the customer in the database who sends the money
                          Customer senderCustomer=widget.user.copy(
                            id: widget.user.id,
                            name: widget.user.name,
                            emailAddress: widget.user.emailAddress,
                            accountNumber: widget.user.accountNumber,
                            phoneNumber: widget.user.phoneNumber,
                            cnic: widget.user.cnic,
                            currentBalance: widget.user.currentBalance - int.parse(amountController.text),
                            region: widget.user.region,
                          );
                          await DatabaseHelper.instance.updateRecord(senderCustomer);
                          //updating the record of the customer in the database who receives the money
                          Customer receiverCustomer=await DatabaseHelper.instance.readSpecificRecord(receiverController.text);
                          receiverCustomer=receiverCustomer.copy(
                            id: receiverCustomer.id,
                            name: receiverCustomer.name,
                            emailAddress: receiverCustomer.emailAddress,
                            accountNumber: receiverCustomer.accountNumber,
                            phoneNumber: receiverCustomer.phoneNumber,
                            cnic: receiverCustomer.cnic,
                            currentBalance: receiverCustomer.currentBalance + int.parse(amountController.text),
                            region: receiverCustomer.region,
                          );
                          await DatabaseHelper.instance.updateRecord(receiverCustomer);
                          //updating the transaction history table  after every transaction has been committed
                          Transactions instance=Transactions(
                            senderName: senderCustomer.name,
                            receiverName: receiverCustomer.name,
                            transferedBalance: int.parse(amountController.text),
                          );
                          await DatabaseHelper.instance.insertCustomerTransaction(instance);
                          setState(() => isloading=false);
                          Navigator.push(context,MaterialPageRoute(builder:(context)=> MyHomePage()));
                        }
                      },
                      child: Text('Commit Transaction',
                        style: GoogleFonts.itim(fontWeight: FontWeight.normal,fontSize: 17.sp,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget textfield(String ltext,String htext,TextEditingController textController,IconData source,TextInputType resource){
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[400],
        contentPadding: const EdgeInsets.symmetric(vertical: 11.0),
        prefixIcon: Icon(source,size: 23.0,color: Colors.black,),
        suffixIcon: textController.text.isEmpty
            ? Container(width: 0,)
            : IconButton(
                icon: const Icon(Icons.close,color: Colors.black,),
                onPressed: () => textController.clear(),
        ),
        hintText: htext,
        hintStyle: GoogleFonts.itim(
          color: Colors.grey[800],
          fontSize: 13.sp,
          fontWeight: FontWeight.bold,
        ),
        labelText: ltext,
        labelStyle: GoogleFonts.itim(
          color: Colors.black,
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2.sp),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2.sp),
        ),
      ),
      style: GoogleFonts.itim(
        color: Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: Colors.black,
      cursorHeight: 22.0,
      cursorRadius: const Radius.circular(10),
      cursorWidth: 3.0,
      keyboardAppearance: Brightness.dark,
      keyboardType: resource,
      textAlign: TextAlign.start,
    );
  }
}


