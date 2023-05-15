import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../wedget/textWedget.dart';
import 'SecurePinQRCode.dart';

class QRSummary extends StatefulWidget {
  const QRSummary({Key? key}) : super(key: key);

  @override
  State<QRSummary> createState() => _QRSummaryState();
}

class _QRSummaryState extends State<QRSummary> {
  final acNameController=TextEditingController();
  final sortCodeController=TextEditingController();
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
            text: "Money Request",
            size: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: ListView(
        children: [
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
                          size: 16,
                          color: Color(0xFF222222),
                          text: 'Name Of Payer',
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
                        hintText: "Michael Cole",
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
                          size: 16,
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
                        hintText: "12312314312",
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
                      controller: sortCodeController,
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
                          size: 16,
                          color: Color(0xFF222222),
                          text: 'Sort Code',
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
                        hintText: "124144",
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
                          size: 16,
                          color: Color(0xFF222222),
                          text: 'Amount',
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
                        hintText: "£100.00",
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
                      controller: refController,
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
                          size: 16,
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
                        hintText: "Refund For Rent",
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
                      controller: refController,
                      keyboardType: TextInputType.number,
                      // onSaved: (value) {
                      //   accountName.text = value!;
                      // },
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
                  Get.off(SecurePinQRCode());
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
    );
  }
}
