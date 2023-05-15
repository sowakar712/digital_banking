import 'package:digital_banking/screens/dashBoardPage/dashBordPage/sendMoneyScreen/savePayMoney1/securePinSavePay.dart';
import 'package:digital_banking/screens/dashBoardPage/dashBordPage/sendMoneyScreen/savePayMoney1/successSavePay.dart';
import 'package:digital_banking/screens/dashBoardPage/dashBordPage/sendMoneyScreen/savedPayMoneyNGN/securePinNGN.dart';
import 'package:digital_banking/screens/dashBoardPage/dashBordPage/sendMoneyScreen/savedPayMoneyNGN/successSavePinNGN.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../Components/Constant.dart';
import '../../../../../wedget/textWedget.dart';

class BankDetailsNGN extends StatefulWidget {
  String? Name;
  BankDetailsNGN(this.Name);
  @override
  State<BankDetailsNGN> createState() => _BankDetailsNGNState();
}

class _BankDetailsNGNState extends State<BankDetailsNGN> {
  final acNameController=TextEditingController();
  final amountController=TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x00FFFFFF),
        elevation: 0,
        leading:  InkWell(
          onTap: (){
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0,8,4,8),
            child: SvgPicture.asset(
              "assets/svg/backButton.svg",

            ),
          ),
        ),

        title: text1(
            text: "Bank Details",
            size: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            SizedBox(
              height: 8,
            ),
            Center(
              child: Container(
                  width: MediaQuery.of(context).size.width/1.5,
                  height: MediaQuery.of(context).size.height/15,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade100,
                          offset: const Offset(
                              0.1,0.1
                          ),
                          blurRadius: 2.0,
                          spreadRadius: 1.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.grey.shade100,
                          offset: const Offset(0.1, 0.1),
                          blurRadius: 2.0,
                          spreadRadius: 1.0,
                        ), //BoxShadow
                      ],
                      color: Colors.white
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      text1(
                          text: "Balance\t",
                          size: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600
                      ),
                      text1(
                          text: "${Constant.acbalanceNGN}",
                          size: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600
                      ),
                    ],
                  )
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,8,20,8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                      EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: text1(
                          size: 17,
                          color: Color(0xFF222222),
                          text: 'Account Name',
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    AbsorbPointer(
                      absorbing: true,
                      child: TextFormField(

                        cursorColor: Colors.black,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18.0,
                            // height: 0.6,
                            color: Colors.black),
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: "${widget.Name}",
                          hintStyle:  GoogleFonts.openSans(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),


                          contentPadding:
                          EdgeInsets.only(left: 16, top: 10),
                          filled: true,
                          fillColor: Color(0xFFFFFFFF),
                          enabledBorder:  OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderSide:  BorderSide(
                                color: Colors.blue,
                                width: 0.8
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          border:  OutlineInputBorder(

                          ),
                        ),
                        controller: acNameController,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: text1(
                          size: 17,
                          color: Color(0xFF222222),
                          text: 'Amount',
                          fontWeight: FontWeight.w600
                      ),
                    ),

                    TextFormField(
                      cursorColor: Colors.black,
                      style:  GoogleFonts.openSans(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                      autofocus: true,
                      onChanged: (string) {
                        // string = '${_formatNumber(string.replaceAll(',', ''))}';
                        amountController.value = TextEditingValue(
                          text: string,
                          selection: TextSelection.collapsed(offset: string.length),
                        );
                      },
                      decoration: InputDecoration(
                        prefix: Text("₦"),
                        prefixStyle:  GoogleFonts.openSans(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                        hintText: "100.00",
                        hintStyle:  GoogleFonts.openSans(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        contentPadding:
                        EdgeInsets.only(left: 16, top: 10),
                        filled: true,
                        fillColor: Color(0xFFFFFFFF),
                        enabledBorder:  OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide:  BorderSide(
                              color: Colors.blue,
                              width: 0.8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        border:  OutlineInputBorder(

                        ),
                        labelStyle: new TextStyle(color: Colors.green),

                      ),

                      controller: amountController,
                      keyboardType: TextInputType.number,                      validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter an amount to proceed";
                      }
                      if (double.parse(amountController.text)>double.parse(Constant.acbalanceUK)) {
                        return "Insufficient Balance!";
                      }
                      if(int.parse(value)<=0){
                        return "Please enter valid amount";
                      }
                      return null;
                    },
                      textInputAction: TextInputAction.next,
                    ),

                    SizedBox(
                        height:MediaQuery.of(context).size.height/3
                    ),
                  ],
                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,8,20,8),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF0057FC),
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.9,
                        MediaQuery.of(context).size.height * 0.06,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                  onPressed: ()  {
                    if (_formKey.currentState!.validate()) {
                      Get.off(SecurePinNGN(widget.Name,amountController.text));
                    }
                  },

                  child: text1(
                      size: 16,
                      color: Color(0xFFFFFFFF),
                      text: 'Confirm Payment',
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),


    );  }
}
