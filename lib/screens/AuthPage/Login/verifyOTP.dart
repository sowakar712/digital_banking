import 'dart:convert';
import 'dart:io';

import 'package:digital_banking/utils/tierMoney.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Components/Constant.dart';
import '../../../wedget/backButton.dart';
import '../../../wedget/textWedget.dart';
import '../../dashBoardPage/dashBordPage/dashBoardPage.dart';
import '../SignUp/securePin.dart';

class VerifyOTP extends StatefulWidget {
  String? email;
  String? password;
  bool? pinStatus;

  VerifyOTP({Key? key, this.email, this.password,this.pinStatus}) : super(key: key);

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final pnocontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tokenId();
  }
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
                text: 'OTP Code',
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
                        textAlign: TextAlign.center,
                          size: 16,
                          color: Colors.grey.shade500,
                          text:
                              'An OTP code is sent to your email\n${widget.email}.',
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
                            text: 'OTP',
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
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter OTP";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Your OTP",
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
                        controller: pnocontroller,
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
                                  if (widget.password!.isNotEmpty) {
                                    LoginOtpVerification();
                                  }
                                  // else
                                  //   Get.off(ChangePassword(),
                                  //       duration: Duration(milliseconds: 20),
                                  //       //duration of transitions, default 1 sec
                                  //       transition: Transition.leftToRight);
                                }
                              },
                              child: text1(
                                  size: 16,
                                  color: Color(0xFFFFFFFF),
                                  text: widget.password!.isNotEmpty
                                      ? 'Verify'
                                      : 'Reset Password',
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              text1(
                                  size: 16,
                                  color: Color(0xFF222222),
                                  text: 'Didn’t receive any code? ',
                                  fontWeight: FontWeight.w500),
                              InkWell(
                                onTap: () {
                                  if (widget.password!.isNotEmpty) reSendOTP();
                                },
                                child: text1(
                                    size: 16,
                                    color: Color(0xFF0057FC),
                                    text: 'Resend',
                                    fontWeight: FontWeight.w500),
                              )
                            ],
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
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(
      //       left:50,
      //       right:20
      //   ),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       ElevatedButton(
      //
      //           style: ElevatedButton.styleFrom(
      //               primary:  Color(0xFFF0057FC),
      //               fixedSize:  Size(
      //                   MediaQuery.of(context).size.width*0.9,
      //                   MediaQuery.of(context).size.height*0.06,
      //
      //               ),
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(6),
      //               )
      //           ),
      //           onPressed: () async {
      //
      //             Get.offAll(Login(),
      //                 duration: Duration(milliseconds: 20), //duration of transitions, default 1 sec
      //                 transition: Transition.leftToRight
      //             );
      //
      //           },
      //
      //           child:  text1(
      //               size: 16,
      //               color: Color(0xFFFFFFFF),
      //               text: 'Login',
      //               fontWeight: FontWeight.w600
      //           )
      //       ),
      //       SizedBox(
      //         height: 5,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           text1(
      //               size: 16,
      //               color: Color(0xFF222222),
      //               text: 'Don’t have an account yet?',
      //               fontWeight: FontWeight.w500
      //           ),
      //           text1(
      //               size: 16,
      //               color: Color(0xFF0057FC),
      //               text: 'Sign Up',
      //               fontWeight: FontWeight.w500
      //           ),
      //         ],
      //       ),
      //
      //
      //       SizedBox(
      //         height:                      MediaQuery.of(context).size.height*0.2,
      //
      //       )
      //
      //
      //     ],
      //   ),
      // ),
    );
  }

  String? token;

  tokenId() async {
    token = await TierMoneyPreference().getString("token");
    print("Token11=>Bearer${token}");
  }

  Future LoginOtpVerification() async {
    EasyLoading.show(status: "Loading...");
    try {
      var headers = {'Authorization': "Bearer " + "$token"};
      var request = http.MultipartRequest(
          'POST', Uri.parse(Constant.loginOtpVerification));
      request.headers.addAll(headers);
      request.fields.addAll({'otp': pnocontroller.text});
      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);
      print(response);
      print(jsonBody.toString());

      if (response.statusCode == 200) {
        print("Success");
        print(jsonBody['success']);
        setState((){
          Constant.token="$token";

        });
        if (widget.password!.isNotEmpty)
          {
            print("PIN STATUS "+widget.pinStatus.toString());
            if(widget.pinStatus==true){
              SharedPreferences share =
              await SharedPreferences.getInstance();
              await share.setBool('loginScreen', true);

              EasyLoading.showSuccess("Login Successfully",);

              Get.offAll(const DashBoardPage(),
                  duration: Duration(milliseconds: 20),
                  transition: Transition.leftToRight);
            }
            else{
              Get.off(const CreatePin(),
                  duration: Duration(milliseconds: 20),
                  //duration of transitions, default 1 sec
                  transition: Transition.leftToRight);
              showLongToast("Please Enter Transaction pin to continue");
              EasyLoading.dismiss();
            }
          }



        // if (TransactionScreen) {
        //   Get.offAll(const DashBoardPage());
        // } else {
        //   Get.offAll(const CreatePin());
        // }

        // else
        //   Get.off(ChangePassword(),
        //       duration: Duration(milliseconds: 20),
        //       //duration of transitions, default 1 sec
        //       transition: Transition.leftToRight);
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError(jsonBody['error']['otp']);
      }
    } catch (e) {
      EasyLoading.showError("Oops!");
      if (e is SocketException) {
        showLongToast("Could not connect to internet");
      }
    }
  }

  //reSend OTP///
  Future reSendOTP() async {
    EasyLoading.show(status: "Loading...");
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse(Constant.userLogin));
      request.fields.addAll({
        'email': widget.email.toString(),
        'password': widget.password.toString()
      });

      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);

      if (response.statusCode == 200) {
        print("Success");
        EasyLoading.showSuccess("OTP Sent Successfully");
        print(jsonBody['success']['otp']);
      } else {
        EasyLoading.dismiss();
        print(jsonBody['success']);
        EasyLoading.showError(jsonBody['success']);
      }
    } catch (e) {
      EasyLoading.showError("Oops!");
      if (e is SocketException) {
        showLongToast("Could not connect to internet");
      }
    }
  }
}
