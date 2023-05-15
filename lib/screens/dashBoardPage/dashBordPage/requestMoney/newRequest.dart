import 'dart:convert';
import 'dart:io';

import 'package:digital_banking/screens/dashBoardPage/dashBordPage/requestMoney/staticMoneyRequest.dart';
import 'package:digital_banking/screens/dashBoardPage/dashBordPage/sendMoneyScreen/newPayMoney1/securePinAddPay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../Components/Constant.dart';
import '../../../../../wedget/textWedget.dart';
import 'package:http/http.dart' as http;


class NewPayRequest extends StatefulWidget {
  const NewPayRequest({Key? key}) : super(key: key);

  @override
  State<NewPayRequest> createState() => _NewPayRequestState();
}

class _NewPayRequestState extends State<NewPayRequest> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController fnController=TextEditingController();
  TextEditingController lnController=TextEditingController();
  TextEditingController acnoController=TextEditingController();
  TextEditingController sortController=TextEditingController();
  TextEditingController refController=TextEditingController();
  TextEditingController cmpController=TextEditingController();

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
            text: "New Money Request",
            size: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Form(
              key: _formKey,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height:MediaQuery.of(context).size.height*0.02,
                  ),

                  text1(
                      size: 16,
                      color: Color(0xFF222222),
                      text: 'Fill in this details to request for new money',
                      fontWeight: FontWeight.w400
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height*0.04,
                  ),

                  text1(
                      size: 16,
                      color: Color(0xFF222222),
                      text: 'Name',
                      fontWeight: FontWeight.w600
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height*0.01,
                  ),
                  TextFormField(

                    cursorColor: Color(0xFF222222),
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        // height: 0.6,
                        color: Colors.black),
                    autofocus: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter the name of the pay";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter the name of the pay",
                      hintStyle: GoogleFonts.openSans(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade700,
                      ),
                      contentPadding:
                      EdgeInsets.only(left: 16, top: 15, bottom: 15),
                      filled: true,
                      fillColor: Color(0xFFEDEDED),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(4)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(4)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(4)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(4)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(4)),
                      labelStyle: new TextStyle(color: Colors.green),
                    ),
                    controller: acnoController,
                    onSaved: (value) {},
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height*0.02,
                  ),

                  text1(
                      size: 16,
                      color: Color(0xFF222222),
                      text: 'Amount',
                      fontWeight: FontWeight.w600
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height*0.01,
                  ),
                  TextFormField(
                    cursorColor: Color(0xFF222222),
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        // height: 0.6,
                        color: Colors.black),
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Amount";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter the amount",
                      hintStyle: GoogleFonts.openSans(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade700,
                      ),
                      contentPadding:
                      EdgeInsets.only(left: 16, top: 15, bottom: 15),
                      filled: true,
                      fillColor: Color(0xFFEDEDED),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(4)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(4)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(4)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(4)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(4)),
                      labelStyle: new TextStyle(color: Colors.green),
                    ),
                    controller: sortController,
                    onSaved: (value) {},
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height*0.02,
                  ),

                  text1(
                      size: 16,
                      color: Color(0xFF222222),
                      text: 'Reference',
                      fontWeight: FontWeight.w600
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height*0.01,
                  ),
                  TextFormField(
                    cursorColor: Color(0xFF222222),
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        // height: 0.6,
                        color: Colors.black),
                    autofocus: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Reference";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Your reference",
                      hintStyle: GoogleFonts.openSans(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade700,
                      ),
                      contentPadding:
                      EdgeInsets.only(left: 16, top: 15, bottom: 15),
                      filled: true,
                      fillColor: Color(0xFFEDEDED),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(4)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(4)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(4)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(4)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(4)),
                      labelStyle: new TextStyle(color: Colors.green),
                    ),
                    controller: refController,
                    onSaved: (value) {},
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height*0.1,
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary:  Color(0xFFF0057FC),
                          fixedSize:  Size(
                            MediaQuery.of(context).size.width*0.9,
                            MediaQuery.of(context).size.height*0.06,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          )
                      ),
                      onPressed: () async {

                        if (_formKey.currentState!.validate()) {
                          Get.to(StaticRequestMoney());

                        }
                      },

                      child:  text1(
                          size: 16,
                          color: Color(0xFFFFFFFF),
                          text: 'Next',
                          fontWeight: FontWeight.w600
                      )

                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),

          ],
        ),
      ),

    );  }
}
