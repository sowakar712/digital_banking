import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Components/Constant.dart';
import '../../../../wedget/backButton.dart';
import '../../../../wedget/textWedget.dart';

class SecurePinOTPNew extends StatefulWidget {
  String hash;
  String security_info;

  SecurePinOTPNew({Key? key,required this.hash,required this.security_info}) : super(key: key);

  @override
  State<SecurePinOTPNew> createState() => _SecurePinOTPNewState();
}

class _SecurePinOTPNewState extends State<SecurePinOTPNew> {
  final GlobalKey<FormState> _phoneVerificationFormKey = GlobalKey<FormState>();
  TextEditingController phoneVerificationController=TextEditingController();
  String pincode="";

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
                    height:MediaQuery.of(context).size.height*0.08,
                  ),
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
                      text: 'A Verifcation code has been sent to your phone Number ${Constant.countryPhoneCode}${Constant.mobileNumber}',
                      fontWeight: FontWeight.w400
                  ),
                  SizedBox(
                      height:30
                  ),


                  OTPTextField(
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: Colors.grey.shade300,
                    ),

                    length:6,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth:40,
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box,


                    onCompleted: (pin) {
                      setState((){
                        pincode=pin;
                      });
                      print("Completed: " + pin);
                    },
                    onChanged: (pin) {
                      print("Changed: $pin");
                    },
                  ),
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
                            transactionPin();

                          },

                          child:  text1(
                              size: 16,
                              color: Color(0xFFFFFFFF),
                              text: 'Verify Phone Number',
                              fontWeight: FontWeight.w600
                          )

                      ),

                      SizedBox(height:MediaQuery.of(context).size.height*0.4,)


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

  Future transactionPin()async{
    EasyLoading.show(status: "Loading..");
    try {
      var header = {
        'Authorization': "Bearer " + "${Constant.token}"};
      var request = http.MultipartRequest(
          'POST', Uri.parse(Constant.OTPtransactionPin));
      request.fields.addAll({
        'otp': pincode,
        'hash': widget.hash,
        'security_info': widget.security_info
      });
      request.headers.addAll(header);

      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);


      if (response.statusCode == 200 || response.statusCode == 201) {
        print(jsonBody.toString());
        EasyLoading.showSuccess("PIN Setted Successfully",);
        Get.back();
      }
      else {
        EasyLoading.showError("Please Enter Valid OTP");
      }
    }
    catch (e) {
      EasyLoading.showError("Oops!");
      if (e is SocketException) {
        showLongToast("Could not connect to internet");
      }
    }
  }

}