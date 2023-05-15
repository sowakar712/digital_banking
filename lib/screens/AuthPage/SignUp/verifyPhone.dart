import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:http/http.dart' as http;
import '../../../Components/Constant.dart';
import '../../../wedget/backButton.dart';
import '../../../wedget/textWedget.dart';
import 'email.dart';

class VerificationCodeMobile extends StatefulWidget {

  String HasCode;
  VerificationCodeMobile({Key? key,required this.HasCode}) : super(key: key);

  @override
  State<VerificationCodeMobile> createState() => _VerificationCodeMobileState();
}

class _VerificationCodeMobileState extends State<VerificationCodeMobile> {

  final GlobalKey<FormState> _phoneVerificationFormKey = GlobalKey<FormState>();
  TextEditingController phoneVerificationController=TextEditingController();
  String pincode="";
  int pinlen=0;
  bool error=false;

  @override
  void initState() {
    print("mobilenumber=>${Constant.mobileNumber}");
    print("countryCode=>${Constant.countryCode}");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Form(
            key:_phoneVerificationFormKey,
            child:  ListTile(
              title: Column(
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
                        text: 'Verify Your Phone Number',
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
                      text: 'A Verification code has been sent to your phone Number ${Constant.countryPhoneCode}${Constant.mobileNumber}',
                      fontWeight: FontWeight.w400
                  ),
                  SizedBox(
                      height:30
                  ),


                  OTPTextField(
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: Colors.grey.shade300,
                    ),
                    keyboardType: TextInputType.number,
                    length:6,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth:40,
                    style: const TextStyle(
                        fontSize: 30,
                    ),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    hasError: error,
                    fieldStyle: FieldStyle.box,
                     inputFormatter: [],
                    onCompleted: (pin) {
                      setState((){
                        error=false;
                        pincode=pin;
                      });
                      print("Completed: " + pin);
                    },
                    onChanged: (pin) {
                      setState((){
                        pinlen=pin.length;
                      });
                      print("Changed: $pin");
                    },
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height*0.01,
                  ),
                  error?Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: text1(
                          textAlign: TextAlign.center,
                          color: Colors.red,
                          text: "Please Enter Valid OTP"
                      ),
                    ),
                  ):Container(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            if(pinlen==6){
                              AuthOTP();
;                            }
                            else{
                              setState((){
                                error=true;
                              });
                            }

                          },

                          child:  text1(
                              size: 16,
                              color: Color(0xFFFFFFFF),
                              text: 'Verify Phone Number',
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
                      SizedBox(
                        height:MediaQuery.of(context).size.height*0.2,
                      )


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
  //reSend OTP
  Future reSendOTP() async {
    // EasyLoading.show(status: "Loading...");
    try {
      var request = http.MultipartRequest('POST', Uri.parse(Constant.reSend_OTP));
      print(Constant.countryCode);
      print(Constant.mobileNumber);
      request.fields.addAll({
        'country_phone_code':Constant.countryPhoneCode,
        'mobile': Constant.mobileNumber,
      });

      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);


      if (response.statusCode == 200) {
        print(response.statusCode);
        print(jsonBody.toString());
        //  EasyLoading.showSuccess("OTP Sent Successfully");
        print(jsonBody['success']['otp']);
        setState((){
          widget.HasCode=jsonBody['success']['hash'];
        });
      } else {
        //    EasyLoading.dismiss();
        print(jsonBody['success']);
        setState((){
          error=true;
        });
        //    EasyLoading.showError(jsonBody['success']);
      }
    } catch (e) {
      //    EasyLoading.showError("Oops!");
      setState((){
        error=true;
      });
      if (e is SocketException) {
        showLongToast("Could not connect to internet");
      }
    }
  }

  Future AuthOTP() async {
    //  EasyLoading.show(status: "Loading...");
    try {
      var request = http.MultipartRequest('POST', Uri.parse(Constant.authenticate_OTP));
      request.fields.addAll({
        'otp': '${pincode}',
        'hash': widget.HasCode.toString()
      });
      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);
      print(response.statusCode);
      print(jsonBody.toString());
      if (response.statusCode == 200) {
        print(response.statusCode);
        //    EasyLoading.showSuccess("OTP verified Successfully");

        if(jsonBody['success']['message']==true){
          Get.off(Email1());
        }
      }
      else {
        //   EasyLoading.showError("Please Try Again");
        setState((){
          error=true;
        });
      }
    } catch (e) {
      //   EasyLoading.showError("Invalid Otp!");
      setState((){
        error=true;
      });
      if (e is SocketException) {
        showLongToast("Could not connect to internet");
      }
    }
  }
}