import 'dart:convert';
import 'dart:io';
import 'package:digital_banking/screens/AuthPage/SignUp/verifyPhone.dart';
import 'package:http/http.dart'as http;
import 'package:digital_banking/Components/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../wedget/backButton.dart';
import '../../../wedget/textWedget.dart';

class PhoneNumber extends StatefulWidget {
  String diviseId;
  PhoneNumber({Key? key,required this.diviseId}) : super(key: key);

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  TextEditingController phoneNumberController=TextEditingController();
  final GlobalKey<FormState> _phoneNumberFormKey = GlobalKey<FormState>();

  // int countryCode=91;
  String? countryPhoneCode;
  String? countryCode;
  String? countryNumber;
  bool isvalid=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
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
                top:8.0,
                bottom:8.0,
                left:MediaQuery.of(context).size.width*0.3,
                right:MediaQuery.of(context).size.width*0.3,
            ),
            child: Image(
              image: AssetImage("assets/images/splash.png"),
            ),
          ),
          SizedBox(
            height:16
          ),
          Center(
            child: text1(
                size: 24,
                color: Color(0xFF222222),
                text: 'Your Phone Number',
                fontWeight: FontWeight.w600
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left:MediaQuery.of(context).size.width*0.04,
              right:MediaQuery.of(context).size.width*0.04,            ),
            child: Form(
              key: _phoneNumberFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height:18
                  ),
                  text1(
                      size: 16,
                      color: Color(0xFF59585A),
                      text: 'Sign up to get started',
                      fontWeight: FontWeight.w400
                  ),
                  SizedBox(
                      height:12
                  ),

                  Padding(
                    padding:
                    EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: text1(
                        size: 16,
                        color: Color(0xFF222222),
                        text: 'Phone Number',
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8),
                    child: IntlPhoneField(
                      controller:phoneNumberController,
                      style:GoogleFonts.openSans(
                          textStyle: TextStyle(fontSize:16,fontWeight: FontWeight.w500,color: Color(0xFF222222)

                          )),
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        hintStyle:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:14,fontWeight: FontWeight.bold,color:Color.fromRGBO(255, 255, 255, 0.25098039215686274), )),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'GB',
                      // initialValue: ,
                      onChanged: (phone) {
                        print(countryPhoneCode);
                        countryPhoneCode=phone.countryCode;
                        countryCode=phone.countryISOCode;
                        print(phone.countryCode);
                        print(phone.countryISOCode);
                      },

                      validator: (str){
                        print(isvalid);
                        if(isvalid){
                          return "Please Enter Valid Phone Number";
                        }
                        return null;
                      },
                    ),
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
                            if(_phoneNumberFormKey.currentState!.validate()){
                              setState(() {
                                Constant.mobileNumber=phoneNumberController.text;
                                Constant.countryPhoneCode=countryPhoneCode!;
                                Constant.countryCode=countryCode!;
                                Constant.countryNumber=countryCode!;
                              });

                              verifyPhone(countryPhoneCode:int.parse(countryPhoneCode!),mobileNumber:phoneNumberController.text);
                            }
                            else{
                              print("no fetch the data");
                            }
                          },

                          child:  text1(
                              size: 16,
                              color: Color(0xFFFFFFFF),
                              text: 'Proceed',
                              fontWeight: FontWeight.w600
                          )
                      ),
                      SizedBox(
                        height: 50,
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


  Future verifyPhone({String? mobileNumber,int? countryPhoneCode}) async {
    // EasyLoading.show(status: "Loading...");
    try {
      var request = http.MultipartRequest('POST', Uri.parse(Constant.verifyPhone));
      request.fields.addAll({
        'mobile': "$mobileNumber",
        'country_phone_code': "$countryPhoneCode",
      });
      print("$mobileNumber");
      print("$countryPhoneCode");

      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);
      print(response.statusCode);

      print(jsonBody.toString());

      if (response.statusCode == 200) {
        print("heyy");


        // EasyLoading.showSuccess("OTP Sent Successfully");
        Get.to(VerificationCodeMobile(HasCode: jsonBody['success']['hash']));
        print(jsonBody['success']['hash']);
      } else {
        print("heyy");

        // EasyLoading.dismiss();
        print(jsonBody['success']);
        // EasyLoading.showError(jsonBody['success']);
      }
    } catch (e) {
      validation(true);
      showLongToast("Please Enter Valid Phone Number");

      // EasyLoading.showError("Please Enter Valid Phone Number");

      if (e is SocketException) {
        showLongToast("Could not connect to internet");
      }
    }
  }
  void validation(val){
    print("hi");
    setState((){
      isvalid=val;
    });
    if(_phoneNumberFormKey.currentState!.validate());
  }
}
