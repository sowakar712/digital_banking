import 'package:digital_banking/screens/dashBoardPage/moreMenuPage/changePassword1/successChange.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../../../Components/Constant.dart';
import '../../../../wedget/textWedget.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class OtpConfirmation1 extends StatefulWidget {
  String hash;
  String security_info;
  OtpConfirmation1(this.hash,this.security_info);

  @override
  State<OtpConfirmation1> createState() => _OtpConfirmation1State();
}

class _OtpConfirmation1State extends State<OtpConfirmation1> {
  final GlobalKey<FormState> _phoneVerificationFormKey = GlobalKey<FormState>();
  TextEditingController phoneVerificationController=TextEditingController();
  String pincode="";
  @override
  void initState() {
    print("mobilenumber=>${Constant.mobileNumber}");
    print("countryCode=>${Constant.countryCode}");
    super.initState();
  }
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
        children: [
          Form(
            key:_phoneVerificationFormKey,
            child:  ListTile(
              title: Column(
                children: [

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  text1(
                      textAlign: TextAlign.center,
                      size: 16,
                      color: Color(0xFF59585A),
                      text: 'An OTP code is sent to the phone number ${Constant.countryPhoneCode}${Constant.mobileNumber}',
                      fontWeight: FontWeight.w400
                  ),
                  SizedBox(
                      height:30
                  ),


                  OTPTextField(
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: Colors.grey.shade100,
                      borderColor: Colors.red,
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
                        height:MediaQuery.of(context).size.height*0.2,

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
                            authenticatePassword();
                          },

                          child:  text1(
                              size: 16,
                              color: Color(0xFFFFFFFF),
                              text: 'Proceed',
                              fontWeight: FontWeight.w600
                          )

                      ),



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
  Future authenticatePassword()async{
    EasyLoading.show(status: "Loading..");
    try {
      var header = {
        'Authorization': "Bearer " + "${Constant.token}"};
      var request = http.MultipartRequest(
          'POST', Uri.parse(Constant.authenticatePassword));
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

        EasyLoading.showSuccess("Password Changed Successfully");
        Get.off(SuccessChangePassword());
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
