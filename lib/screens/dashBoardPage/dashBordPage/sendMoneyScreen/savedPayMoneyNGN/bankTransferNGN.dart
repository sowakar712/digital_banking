import 'package:digital_banking/screens/dashBoardPage/dashBordPage/addFund/successAddFund.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../Components/Constant.dart';
import '../../../../../wedget/textWedget.dart';
import '../savePayMoney1/bankDetails.dart';
import 'bankDetailsNGN.dart';
class BankTransferNGN extends StatefulWidget {
  String? Name;
  String? AccountNumber;
  String? SortCode;
  String? Reference;
  BankTransferNGN(this.Name,this.AccountNumber,this.SortCode,this.Reference);

  @override
  State<BankTransferNGN> createState() => _BankTransferNGNState();
}

class _BankTransferNGNState extends State<BankTransferNGN> {
  final acNameController=TextEditingController();
  final bankNameController=TextEditingController();
  final acNoController=TextEditingController();
  final refController=TextEditingController();
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
            text: "Bank Transfer",
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
                          text: "Balance\t\t",
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
            AbsorbPointer(
              absorbing: true,
              child: Form(
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
                      TextFormField(
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
                          labelStyle: new TextStyle(color: Colors.green),
                          // border: OutlineInputBorder(
                          //   borderSide: BorderSide(
                          //       color: Color(0xFF0057FC),
                          //       width: 2
                          //   ),
                          //   borderRadius: BorderRadius.circular(05),
                          // ),
                        ),
                        controller: acNameController,
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          // accountName.text = value!;
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      Padding(
                        padding:
                        EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: text1(
                            size: 17,
                            color: Color(0xFF222222),
                            text: 'Bank Name',
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      TextFormField(
                        cursorColor: Colors.black,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18.0,
                            // height: 0.6,
                            color: Colors.black),
                        autofocus: false,

                        decoration: InputDecoration(
                          hintText: "${widget.SortCode}",
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
                                width: 0.8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          border:  OutlineInputBorder(

                          ),
                          labelStyle: new TextStyle(color: Colors.green),
                          // border: OutlineInputBorder(
                          //   borderSide: BorderSide(
                          //       color: Color(0xFF0057FC),
                          //       width: 2
                          //   ),
                          //   borderRadius: BorderRadius.circular(05),
                          // ),
                        ),
                        controller: bankNameController,
                        keyboardType: TextInputType.number,
                        // onSaved: (value) {
                        //   accountName.text = value!;
                        // },
                        textInputAction: TextInputAction.next,
                      ),
                      Padding(
                        padding:
                        EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: text1(
                            size: 17,
                            color: Color(0xFF222222),
                            text: 'Account Number',
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      TextFormField(
                        cursorColor: Colors.black,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18.0,
                            // height: 0.6,
                            color: Colors.black),
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: "${widget.AccountNumber}",
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
                                width: 0.8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          border:  OutlineInputBorder(

                          ),
                          // border: OutlineInputBorder(
                          //   borderSide: BorderSide(
                          //       color: Color(0xFF0057FC),
                          //       width: 2
                          //   ),
                          //   borderRadius: BorderRadius.circular(05),
                          // ),
                        ),
                        controller: acNoController,
                        keyboardType: TextInputType.number,
                        // onSaved: (value) {
                        //   accountName.text = value!;
                        // },
                        textInputAction: TextInputAction.next,
                      ),
                      Padding(
                        padding:
                        EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: text1(
                            size: 17,
                            color: Color(0xFF222222),
                            text: 'Reference',
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      TextFormField(
                        cursorColor: Colors.black,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18.0,
                            // height: 0.6,
                            color: Colors.black),
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: "${widget.Reference}",
                          hintStyle:  GoogleFonts.openSans(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
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
                          border:  OutlineInputBorder(),

                        ),
                        controller: refController,
                        keyboardType: TextInputType.number,

                        textInputAction: TextInputAction.next,
                      ),

                      SizedBox(
                        height:45,
                      ),
                      SizedBox(
                          height:MediaQuery.of(context).size.height/38
                      ),



                    ],
                  ),
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
                    print("Hey");


                    Get.to(BankDetailsNGN(widget.Name));
                    // if (_formKey.currentState!.validate()) {
                    //   Get.to(VerifyPassword(),
                    //       duration: Duration(milliseconds: 20),
                    //       //duration of transitions, default 1 sec
                    //       transition: Transition.leftToRight);
                    // }
                  },

                  child: text1(
                      size: 16,
                      color: Color(0xFFFFFFFF),
                      text: 'Next',
                      fontWeight: FontWeight.w600)),
            ),





          ],
        ),
      ),


    );
  }
}
