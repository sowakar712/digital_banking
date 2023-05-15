import 'dart:convert';
import 'dart:io';
import 'package:digital_banking/screens/AuthPage/SignUp/password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../wedget/textWedget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../Components/Constant.dart';
import '../../dashBoardPage/moreMenuPage/changePassword1/changePassword.dart';
import 'changePassword.dart';

class VerifyForgotOTP extends StatefulWidget {
  String? HasCode1;
  String? email;


  VerifyForgotOTP({Key? key,this.HasCode1,this.email}) : super(key: key);

  @override
  State<VerifyForgotOTP> createState() => _VerifyForgotOTPState();
}
class _VerifyForgotOTPState extends State<VerifyForgotOTP> {
  final GlobalKey<FormState> _emailVerificationFormKey = GlobalKey<FormState>();
  TextEditingController emailVerificationController1=TextEditingController();
  String pincode="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Form(
            key:_emailVerificationFormKey,
            child:  ListTile(
              title: Column(
                children: [
                  SizedBox(
                      height:20
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top:8.0,
                      bottom:8.0,
                      left:MediaQuery.of(context).size.width*0.3,
                      right:MediaQuery.of(context).size.width*0.3,
                    ),
                    child: Image(
                      image: AssetImage("assets/images/splash.png",),
                    ),
                  ),
                  SizedBox(
                      height:16
                  ),
                  Center(
                    child: text1(
                        size: 24,
                        color: Color(0xFF222222),
                        text: 'Verify Your Email',
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(
                      height:10
                  ),
                  text1(
                      textAlign: TextAlign.center,
                      size: 16,
                      color: Color(0xFF59585A),
                      text: 'A Verifcation code has been sent to your email   ${widget.email}  ',
                      fontWeight: FontWeight.w400
                  ),
                  SizedBox(
                      height:30
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        cursorColor: Color(0xFF222222),
                        onChanged: (str){
                          setState(() {
                            pincode=str;
                            print(pincode);

                          });

                        },
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20.0,
                            // height: 0.6,
                            color: Colors.black),
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Verification Code";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          // hintText: "Enter Your Email",
                          // hintStyle: GoogleFonts.openSans(
                          //   fontSize: 16.0,
                          //   fontWeight: FontWeight.w400,
                          //   color: Color(0xFF222222),
                          // ),
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
                        controller: emailVerificationController1,
                        onSaved: (value) {},
                        textInputAction: TextInputAction.next,
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.11,
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
                            authenticateOtpEmail();

                          },

                          child:  text1(
                              size: 16,
                              color: Color(0xFFFFFFFF),
                              text: 'Verify Your Email',
                              fontWeight: FontWeight.w600
                          )

                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          text1(
                              textAlign: TextAlign.center,
                              size: 16,
                              color: Color(0xFF59585A),
                              text: 'Didn’t receive any code?  ',
                              fontWeight: FontWeight.w400
                          ),
                          InkWell(
                            child:  text1(
                                textAlign: TextAlign.center,
                                size: 16,
                                color: Color(0xFF0057FC),
                                text: 'Resend',
                                fontWeight: FontWeight.w700,
                                textdecoration: TextDecoration.underline
                            ),
                            onTap: (){
                              // if (widget.password!.isNotEmpty)
                              reSendOTP();
                            },
                          ),


                        ],
                      ),



                      // SizedBox(
                      //   height:                      MediaQuery.of(context).size.height*0.2,
                      //
                      // )


                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Future authenticateOtpEmail() async {
    EasyLoading.show(status: "Loading...");
    try {
      var headers = {
        'Cookie': 'XSRF-TOKEN=eyJpdiI6InBYTVQxUmVyRHo3Z1FycVY5ZmRNSlE9PSIsInZhbHVlIjoicW43RG80TjdlSGFORCtndnFoMGZvZDlub3ROem5jUTFKTjBoVDI0dnpEb3hubDFzejIzVmpQZHJwVFVmeTRqWVVFMHcvbGJzZWQ5UDllZWlWOGhVVnR5bUxqM1NXMEVLTFpJSFNWTnpKWEEyc0t4UDJxQXVmR0IreVVvOEsrcXAiLCJtYWMiOiIzYTFiYTBhZmFkNjI5YjY2ZDBkNjIxN2QwMzE2ZjE4NmRmZDNlZGQ3YzUzMDUxZmZjYmJkMTBlZjIyMGU4NmNlIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IlVRclNORXhTOW8wVkdydTYrS2lIdVE9PSIsInZhbHVlIjoiZVlXK3pTNUozL1NtSnYwNmhPM0h5SXNzQzd5bVF2ckZqMitPVVk4QWs3ZDF5Ui82Z1Y2OU9BeGVhZ1hjL0J0V0JST2J2UHBXVGJsSitpcnUySUpnYzlNK3NZanhjUmtZblFFYU9jWkcxazZwZTNwQmpIYXY5M1BFRnZvenFWTDYiLCJtYWMiOiJlZjQ2NzA3YmY3ZWRkMWQ0NTE2ZjY5MTFhZTQwMmY5ZDYyYmYyZmRmMjIwNGEwOTQ0Y2Y4YTJlYmIzNTJjODdlIiwidGFnIjoiIn0%3D'
      };
      print(pincode);
      // print(widget.HasCode1.toString());
      // print( Uri.parse(Constant.authenticate_otp_email+pincode+"&hash="+widget.HasCode1.toString()));
      var request = http.MultipartRequest('POST', Uri.parse(Constant.authenticate_otp_email+pincode+"&hash="+widget.HasCode1.toString()));
      request.headers.addAll(headers);
      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);

      if (response.statusCode == 200) {
        EasyLoading.showSuccess("OTP Verified Successfully");
        Get.off(ChangePassword1());
        print(jsonBody['success']['otp']);
      } else {
        EasyLoading.dismiss();
        print(jsonBody['success']);
        EasyLoading.showError(jsonBody['error']['otp']);
      }

    } catch (e) {
      EasyLoading.showError("Oops!");
      if (e is SocketException) {
        showLongToast("Could not connect to internet");
      }
    }
  }
  Future reSendOTP() async {
    EasyLoading.show(status: "Loading...");
    try {

      var request = http.MultipartRequest('POST', Uri.parse(Constant.reSend_Email+"${widget.email}"));
      print(request);
      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);
      print(jsonBody.toString());

      if (response.statusCode == 200) {
        EasyLoading.showSuccess("OTP Sent Successfully");
        print(jsonBody['success']['hash']);
        setState((){
          widget.HasCode1=jsonBody['success']['hash'];
        });
      } else {
        EasyLoading.dismiss();
        print(jsonBody['success']);
        EasyLoading.showError(jsonBody['error']['otp']);
      }

    } catch (e) {
      EasyLoading.showError("Oops!");
      if (e is SocketException) {
        showLongToast("Could not connect to internet");
      }
    }
  }
}