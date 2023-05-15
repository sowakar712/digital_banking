import 'dart:convert';
import 'dart:io';

import 'package:digital_banking/screens/AuthPage/Forgot/verifyOTP1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Components/Constant.dart';
import '../../../wedget/backButton.dart';
import '../../../wedget/textWedget.dart';
import 'package:http/http.dart' as http;


class Forgot extends StatefulWidget {
  const Forgot({Key? key}) : super(key: key);

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          SizedBox(height: 5),
          Row(
            children: [
              BackButtonAppBar(),
            ],
          ),          Padding(
            padding: EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: MediaQuery.of(context).size.width * 0.3,
              right: MediaQuery.of(context).size.width * 0.3,
            ),
            child: Image(
              image: AssetImage("assets/images/splash.png"),
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: text1(
                size: 24,
                color: Color(0xFF222222),
                text: 'Forgot Password',
                fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.04,
              right: MediaQuery.of(context).size.width * 0.04,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 18),
                      text1(
                          size: 16,
                          color: Colors.grey.shade500,
                          text: 'Enter the reset code sent to your email',
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 12),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: text1(
                            size: 16,
                            color: Color(0xFF222222),
                            text: 'Email',
                            fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                        cursorColor: Color(0xFF222222),
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18.0,
                            // height: 0.6,
                            color: Colors.black),
                        autofocus: false,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Email";
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA_Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return ("Please Enter Valid Email");
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "demo@semo.com",
                          hintStyle: GoogleFonts.openSans(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF222222),
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
                        controller: emailController,
                        onSaved: (value) {},
                        textInputAction: TextInputAction.next,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.11,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFF0057FC),
                                  fixedSize: Size(
                                    MediaQuery.of(context).size.width * 0.9,
                                    MediaQuery.of(context).size.height * 0.06,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  )),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  verifyEmail();
                                }
                              },
                              child: text1(
                                  size: 16,
                                  color: Color(0xFFFFFFFF),
                                  text: 'Reset Password',
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
  Future verifyEmail() async {
    EasyLoading.show(status: "Loading...");
    try {

      var request = http.MultipartRequest('POST', Uri.parse(Constant.send_otp_email+emailController.text));
      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);

      if (response.statusCode == 200) {
        print("Success");
        EasyLoading.showSuccess("OTP Sent Successfully");
        setState(() {
          print(Constant.send_otp_email+emailController.text);
        });
        print(jsonBody['success']['hash']);
        print(jsonBody['success']['otp']);

        Get.off(VerifyForgotOTP(email: emailController.text,HasCode1: jsonBody['success']['hash']),
            duration: Duration(milliseconds: 20),
            //duration of transitions, default 1 sec
            transition: Transition.leftToRight);
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError(jsonBody['error']['email']);
      }

    } catch (e) {
      EasyLoading.showError("Oops!");
      if (e is SocketException) {
        showLongToast("Could not connect to internet");
      }
    }
  }

}
