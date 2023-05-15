import 'package:digital_banking/screens/AuthPage/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojah_financial/flutter_dojah_financial.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Components/Constant.dart';
import '../../../utils/tierMoney.dart';
import '../../../wedget/backButton.dart';
import '../../../wedget/textWedget.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'dojahVerify.dart';


class SetPassword1 extends StatefulWidget {
  const SetPassword1({Key? key}) : super(key: key);

  @override
  State<SetPassword1> createState() => _SetPassword1State();
}

class _SetPassword1State extends State<SetPassword1> {
  final passcontroller = TextEditingController();
  final cpasscontroller = TextEditingController();
  bool passwordVisible = true;
  bool cpasswordVisible = true;
  final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();

  void initState() {
    tokenId();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          SizedBox(height: 5),
          Row(
            children: [
              BackButtonAppBar(),
            ],
          ),
          Padding(
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
          SizedBox(height: 10),
          Center(
            child: text1(
                size: 24,
                color: Color(0xFF222222),
                text: 'Create New Password',
                fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.04,
              right: MediaQuery.of(context).size.width * 0.04,
            ),
            child: Form(
              key: _passwordFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 18),
                      text1(
                          size: 16,
                          color: Colors.grey.shade500,
                          text: 'Enter your password and get secured',
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
                            text: 'New Password',
                            fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                        cursorColor: Color(0xFF222222),
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20.0,
                            // height: 0.6,
                            color: Colors.black),
                        autofocus: false,
                        obscureText: passwordVisible,
                        obscuringCharacter: "*",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter New Password";
                          }
                          else if(value.length<10)
                          {
                            return "Your Password must be at least 10 character";

                          }
                          else if (!RegExp(r"(?=.*[A-Z])(?=.*\W)").hasMatch(value!)) {
                            return ("Please Enter Valid Password");
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              passwordVisible
                                  ? Icons.visibility_off_sharp
                                  : Icons.visibility_sharp,

                              color: Color(0xFF292D32),
                              size: 27,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                          hintText: "Enter Your New Password",
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
                        controller: passcontroller,
                        onSaved: (value) {},
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: 20),

                      text1(
                          size: 14,
                          color: Colors.grey.shade500,
                          text: 'Password must be atleast 10 characters and contain at least 1 special character and one upper case character.',
                          fontWeight: FontWeight.w500),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: text1(
                            size: 16,
                            color: Color(0xFF222222),
                            text: 'Confirm Password',
                            fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                        cursorColor: Color(0xFF222222),
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20.0,
                            // height: 0.6,
                            color: Colors.black),
                        autofocus: false,
                        obscureText: cpasswordVisible,
                        obscuringCharacter: "*",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Confirm Password";
                          }
                          else if(value!=passcontroller.text){
                            return "Password Mismatch";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              cpasswordVisible
                                  ? Icons.visibility_off_sharp
                                  : Icons.visibility_sharp,

                              color: Color(0xFF292D32),
                              size: 27,
                            ),
                            onPressed: () {
                              setState(() {
                                cpasswordVisible = !cpasswordVisible;
                              });
                            },
                          ),
                          hintText: "Enter Your Confirm Password",
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
                        controller: cpasscontroller,
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
                                if(_passwordFormKey.currentState!.validate()){
                                  setState(() {
                                    Constant.password=passcontroller.text;
                                    Constant.conformPassword=cpasscontroller.text;
                                  });
                                  validatePassword();
                                }
                              },
                              child: text1(
                                  size: 16,
                                  color: Color(0xFFFFFFFF),
                                  text: 'Proceed',
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            height: 50,
                          ),

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
  String? token;
  tokenId()async{
    token=await TierMoneyPreference().getString("token");
    print("Token=>Bearer${token}");
  }
  Future validatePassword()async{
    // EasyLoading.show(status: "Loading..");
    print(passcontroller.text+cpasscontroller.text);
    try{
      var request =http.MultipartRequest('POST',Uri.parse(Constant.validatePassword));
      request.fields.addAll({
        'password':passcontroller.text,
        'password_confirmation': cpasscontroller.text,
      });
      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);
      if(response.statusCode==200||response.statusCode==201){
        // EasyLoading.dismiss();
        Get.to(DojahVerify());
      }
      else {
        print(jsonBody['error']['password']);
        // EasyLoading.showError(jsonBody['error']['password']);
      }
    }
    catch (e) {
      // EasyLoading.showError("Oops!");
      if (e is SocketException) {
        showLongToast("Could not connect to internet");
      }
    }
  }
}
