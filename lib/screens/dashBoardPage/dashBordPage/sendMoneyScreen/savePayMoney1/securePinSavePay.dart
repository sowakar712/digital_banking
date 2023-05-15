import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:digital_banking/screens/dashBoardPage/dashBordPage/sendMoneyScreen/savePayMoney1/successSavePay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../../../Components/Constant.dart';
import '../../../../../wedget/backButton.dart';
import '../../../../../wedget/textWedget.dart';

class SecurePinSavedPayee extends StatefulWidget {
  String? Name;
  String Amount;
  SecurePinSavedPayee(this.Name,this.Amount);

  @override
  State<SecurePinSavedPayee> createState() => _SecurePinSavedPayeeState();
}

class _SecurePinSavedPayeeState extends State<SecurePinSavedPayee> {
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
            flex:0,
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
                      text: 'Enter Your Pin',
                      fontWeight: FontWeight.w600),
                ),
                Form(
                  child:                   Column(
                    children: [
                      SizedBox(
                          height:30
                      ),
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
                              text: "Please Enter 6 digit Transaction Pin"
                          ),
                        ),
                      ):Container(),
                      SizedBox(

                        height:MediaQuery.of(context).size.height /6.5,

                      ),


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

                    rightButtonFn : () {

                      print('right button clicked');
                      if(text.length==6) {
                        print("Transaction Pin : "+text);
                        setState((){
                          error=false;
                        });
                        // Get.off(()=>SuccessSavePay1(widget.Name));
                        authenticateTransPin();
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
  Future authenticateTransPin() async {
    EasyLoading.show(status: "Loading...");

    try {
      var headers={
        'Authorization':"Bearer " + "${Constant.token}",
      };
      var request = http.MultipartRequest('POST', Uri.parse(Constant.validateTransaction));
      request.fields.addAll({
        'pin': text
      });
      request.headers.addAll(headers);
      print("Shiv@@@@@@@");

      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);
      print(jsonBody.toString());
      print("Shiv");

      if (response.statusCode == 200) {
        print(jsonBody['success']['message']);
        if (jsonBody['success']['message'] == true){
          print("Right Transaction PIN");
          transferUkMoney();
        }
        else{
          EasyLoading.dismiss();
          showLongToast("Please Enter Valid Pin");
        }
      } else {
        EasyLoading.dismiss();
        print("Failure");
      }
    } catch (e) {
      EasyLoading.showError("Oops!");
      if (e is SocketException) {
        showLongToast("Could not connect to internet");
      }
    }
  }
  Future transferUkMoney() async {
    print(Constant.ModularId+"..."+widget.Amount);
    try {
      var headers={
        'Authorization':"Bearer " + "${Constant.token}",
      };
      var request = http.MultipartRequest('POST', Uri.parse(Constant.transferUKMoney));
      request.fields.addAll({
        'modulr_beneficiary_id': Constant.ModularId,
        'amount': widget.Amount
      });
      request.headers.addAll(headers);

      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);
      print(jsonBody.toString());
      print(response.statusCode);

      if (response.statusCode == 200) {
        print("Payment Done Successfully");
        EasyLoading.dismiss();
        showLongToast("Payment Done Successfully");
        var res =await Get.off(()=>SuccessSavePay1(widget.Name));
        if(res!=null){
          Get.back(result: "data");
        }
      } else {
        EasyLoading.dismiss();
        print("Failure");
        showLongToast("Please Enter Valid Details");
        Get.back();
      }
    } catch (e) {
      EasyLoading.showError("Oops!");
      if (e is SocketException) {
        showLongToast("Could not connect to internet");
      }
    }
  }
}
