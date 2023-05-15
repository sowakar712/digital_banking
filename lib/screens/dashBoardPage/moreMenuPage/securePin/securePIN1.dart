
import 'package:digital_banking/screens/AuthPage/SignUp/securePinConfirm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../../../../wedget/textWedget.dart';
import '../../../../wedget/backButton.dart';
import 'confirmPIN1.dart';


class CreatePinNew1 extends StatefulWidget {
  const CreatePinNew1({Key? key}) : super(key: key);

  @override
  State<CreatePinNew1> createState() => _CreatePinNew1State();
}
class _CreatePinNew1State extends State<CreatePinNew1> {
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
                    bottom: MediaQuery.of(context).size.width * 0.005,
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
                      text: 'Create A PIN',
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.01,),
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
                              text: "Please Enter 6 digit Transaction Pin"
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

                    rightButtonFn : () {

                      print('right button clicked');
                      if(text.length==6) {
                        print("Transaction Pin : "+text);
                        setState((){
                          error=false;
                        });
                        Get.off(()=>ConfirmSecurePinNew(text));
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
}
