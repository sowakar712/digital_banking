import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Components/Constant.dart';
import '../../../../wedget/textWedget.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'otpConfirmation.dart';

class ChangePassword1 extends StatefulWidget {
  const ChangePassword1({Key? key}) : super(key: key);

  @override
  State<ChangePassword1> createState() => _ChangePassword1State();
}
class _ChangePassword1State extends State<ChangePassword1> {
  final passcontroller = TextEditingController();
  final cpasscontroller = TextEditingController();
  bool passwordVisible = true;
  bool cpasswordVisible = true;
  final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x00FFFFFF),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8, 4, 8),
            child: SvgPicture.asset(
              "assets/svg/backButton.svg",

            ),
          ),
        ),

        title: text1(
            text: "Change Password",
            size: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [

          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery
                  .of(context)
                  .size
                  .width * 0.04,
              right: MediaQuery
                  .of(context)
                  .size
                  .width * 0.04,
            ),
            child: Form(
              key: _passwordFormKey,
              child: Column(
                children: [

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                      ),
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
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.01,
                      ),
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
                          if (value.length < 10) {
                            return "Password must be atleast 10 character";
                          }
                          if (value != passcontroller.text) {
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
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.11,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFF0057FC),
                                  fixedSize: Size(
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.9,
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.06,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  )),
                              onPressed: () async {
                                if (_passwordFormKey.currentState!.validate()) {
                                  setState(() {
                                    Constant.password = passcontroller.text;
                                    Constant.conformPassword =
                                        cpasscontroller.text;
                                    validatePassword();
                                  });


                                  // registerUser();
                                }
                              },
                              child: text1(
                                  size: 16,
                                  color: Color(0xFFFFFFFF),
                                  text: 'Proceed',
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            height: 5,
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
  Future validatePassword() async {
    EasyLoading.show(status: "Loading..");
    try {
      print("Enter");
      var header = {
        'Authorization': "Bearer " + "${Constant.token}"};
      var request = http.MultipartRequest(
          'POST', Uri.parse(Constant.changePassword));
      request.fields.addAll({
        'password': passcontroller.text,
        'password_confirmation': cpasscontroller.text,
      });
      request.headers.addAll(header);

      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);


      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Success");
        print(jsonBody.toString());
        print(jsonBody['success']['otp'].toString());
        String hash = jsonBody['success']['hash'];
        String security_info = jsonBody['success']['security_info'];

        EasyLoading.showSuccess("OTP Sent Successfully");
        Get.off(OtpConfirmation1(hash, security_info));
      }
      else {
        EasyLoading.showError("Please Enter Valid Pin");
      }
    }
    catch (e) {
      Get.back();
      EasyLoading.showError("Your email is not registered yet\nSo please register first");
      if (e is SocketException) {
        showLongToast("Could not connect to internet");
      }
    }
  }
}