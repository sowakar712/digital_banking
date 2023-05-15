import 'dart:async';
import 'package:digital_banking/screens/AuthPage/SignUp/securePinOTP.dart';
import 'package:digital_banking/screens/dashBoardPage/moreMenuPage/securePin/secureConfirmOTP.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../../../../wedget/textWedget.dart';
import '../../../../Components/Constant.dart';
import '../../../../wedget/backButton.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ConfirmSecurePinNew extends StatefulWidget {
  String CreatePin;
  ConfirmSecurePinNew(this.CreatePin);

  @override
  State<ConfirmSecurePinNew> createState() => _ConfirmSecurePinNewState();
}

class _ConfirmSecurePinNewState extends State<ConfirmSecurePinNew> {
  String pincode="";
  String text = '';
  List<String> OTPText=['','','','','',''];
  OtpFieldController otpController = OtpFieldController();
  bool error=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          Expanded(
            flex:1,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.width * 0.04,),
                Row(
                  children: [
                    BackButtonAppBar(),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 0.0,
                    bottom: MediaQuery.of(context).size.width * 0.005,
                    left: MediaQuery.of(context).size.width * 0.3,
                    right: MediaQuery.of(context).size.width * 0.3,
                  ),
                  child: Image(
                    image: AssetImage("assets/images/splash.png"),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.01,),
                Center(
                  child: text1(
                      size: 24,
                      color: Color(0xFF222222),
                      text: 'Confirm Your PIN',
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 16),
                Center(
                  child: text1(
                      textAlign: TextAlign.center,

                      size: 16,
                      color: Color(0xFF222222),
                      text: 'Create a transactional PIN to protect your account.',
                      fontWeight: FontWeight.w400),
                ),
                Form(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.width * 0.02,),

                      AbsorbPointer(
                        absorbing: true,
                        child: OTPTextField(
                          controller: otpController,
                          otpFieldStyle: OtpFieldStyle(

                            backgroundColor: Colors.grey.shade300,
                          ),
                          // obscureText: true,



                          length:6,


                          outlineBorderRadius: 1000,

                          width: MediaQuery.of(context).size.width*0.9,
                          fieldWidth:45,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.box,
                          keyboardType: TextInputType.number,




                          onCompleted: (pin) {
                            setState((){

                              pincode=pin;
                            });
                            print("Completed: " + pin);
                          },


                          onChanged: (pin) {
                            print(otpController);

                          },
                        ),
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
                              text: "Password MisMatch"
                          ),
                        ),
                      ):Container(),
                    ],
                  ),



                ),
              ],
            ),
          ),
          Expanded(
            flex:1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                NumericKeyboard(


                    onKeyboardTap: (String value){
                      setState(() {
                        if(text.length<=5)
                        {
                          text = text + value;
                          print(text);
                        }


                        if(text.length==1){
                          OTPText[0]=text;
                          print(OTPText);
                          otpController.set(OTPText);

                        }else if(text.length==2){
                          OTPText[1]=text.substring(1, text.length);
                          print(OTPText);
                          otpController.set(OTPText);
                        }else if(text.length==3){
                          OTPText[2]=text.substring(2, text.length );
                          print(OTPText);
                          otpController.set(OTPText);
                        }else if(text.length==4){
                          OTPText[3]=text.substring(3, text.length);
                          print(OTPText);
                          otpController.set(OTPText);
                        }else if(text.length==5){
                          OTPText[4]=text.substring(4, text.length);
                          print(OTPText);
                          otpController.set(OTPText);
                        }else if(text.length==6){
                          OTPText[5]=text.substring(5, text.length);
                          print(OTPText);
                          otpController.set(OTPText);
                        }

                        print(text);




                        // print(otpController);
                      });
                    },
                    textColor: Colors.black,
                    leftButtonFn: () {
                      setState(() {
                        text = text.substring(0, text.length - 1);
                        print(text);

                        if(text.length==1){
                          OTPText[1]='';
                          otpController.set(OTPText);

                        }else if(text.length==2){
                          OTPText[2]='';
                          otpController.set(OTPText);

                        }else if(text.length==3){
                          OTPText[3]='';
                          otpController.set(OTPText);

                        }else if(text.length==0){
                          OTPText[0]='';
                          otpController.set(OTPText);
                        }else if(text.length==4){
                          OTPText[4]='';
                          otpController.set(OTPText);
                        }else if(text.length==5){
                          OTPText[5]='';
                          otpController.set(OTPText);
                        }

                      });
                    },
                    rightIcon: Icon(Icons.check_circle, color: Colors.black,size: 43,),
                    leftIcon: Icon(Icons.backspace, color: Colors.black,),

                    rightButtonFn : () async {

                      print('right button clicked');
                      if(text.length==6) {
                        if(text==widget.CreatePin){
                          print("Transaction Pin : " + text);
                          setState(() {
                            error = false;
                          });
                          transactionPin();


                        }
                        else {
                          print("hiu");
                          setState(() {
                            error = true;
                          });
                        }
                      }
                      else{
                        print("hiu");
                        setState((){
                          error=true;


                        });

                        // Get.snackbar(
                        //
                        //     'User 123',
                        //     'Successfully created',
                        //     snackPosition: SnackPosition.TOP
                        // );
                      }
                    },
                    // leftIcon: Icon(Icons.check, color: Colors.red,),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween
                ),
              ],
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
          'POST', Uri.parse(Constant.transactionPin));
      request.fields.addAll({
        'pin': text,
        'confirm_pin': widget.CreatePin
      });
      request.headers.addAll(header);

      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);


      if (response.statusCode == 200 || response.statusCode == 201) {
        print(jsonBody.toString());
        print(jsonBody['success']['hash'].toString());
        print(jsonBody['success']['security_info'].toString());

        String hash=jsonBody['success']['hash'];
        String security_info=jsonBody['success']['security_info'];

        EasyLoading.showSuccess("OTP Sent Successfully");

        Get.off(
            SecurePinOTPNew(hash:hash,security_info: security_info),
            duration: Duration(milliseconds: 20),
            transition: Transition.leftToRight);

      }
      else {
        EasyLoading.showError("Please Enter Valid Pin");
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
