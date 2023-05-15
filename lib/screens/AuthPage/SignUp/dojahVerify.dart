import 'dart:convert';
import 'dart:io' show Platform, SocketException;
import 'package:digital_banking/Components/Constant.dart';
import 'package:digital_banking/screens/AuthPage/SignUp/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dojah_financial/flutter_dojah_financial.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../wedget/backButton.dart';
import '../../../wedget/textWedget.dart';
import '../Login/login.dart';
import 'package:http/http.dart' as http;


class DojahVerify extends StatefulWidget {
  const DojahVerify({Key? key}) : super(key: key);

  @override
  State<DojahVerify> createState() => _DojahVerifyState();
}

Map<dynamic, dynamic> envVars = Platform.environment;

class _DojahVerifyState extends State<DojahVerify> {
  final appId = "62c864f30fdea600348ce870"; //your application ID
  final publicKey = "prod_pk_6WDaqEsJJBAfqqvjlX5t8HIWw";
  bool success = false; //your public key

  @override
  void initState() {
    super.initState();
    // openDojah();
    //  Enable virtual display.
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  void openDojah() {
    final userData = {
      "first_name": "Mike",
      "last_name": "Mike",
      "dob": "2022-03-12"
    };
    final configObj = {
      "debug": true,
      "mobile": true,
    };

    DojahFinancial? _dojahFinancial;

    //Use your appId and publicKey
    _dojahFinancial = DojahFinancial(
        appId: appId,
        publicKey: publicKey,
        type: "liveness",
        //'verification', 'identification', 'verification', 'liveness'
        userData: userData,
        config: configObj,
        onCloseCallback: (str) {
          print("+++++++");
          print(str.toString());
        }); //Type can be link, identification, verification
    _dojahFinancial.open(context, onSuccess: (result) {
      print("Success");
      print(result);
      EasyLoading.showSuccess("Verification Successful");
      Get.off(Login());
    }, onClose: (close) {
      print('Widget Closed');
      SchedulerBinding.instance.addPostFrameCallback((_) {
        print('Widget Closed');
        Navigator.of(context).pop();
      });
    });

    print("Worked");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF).withOpacity(0.7),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading:  success?Container():InkWell(
          onTap: (){
            Get.back();},
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0,0,4,40),
            child: SvgPicture.asset(
              "assets/svg/backButton.svg",),), ),

        toolbarHeight: 120,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            // Row(
            //   children: [
            //     BackButtonAppBar(),
            //   ],
            // ),
            Padding(
              padding: EdgeInsets.only(
                top: 0.0,
                bottom: 8.0,
                left: MediaQuery.of(context).size.width * 0.13,
                right: MediaQuery.of(context).size.width * 0.2,
              ),
              child: Image(
                image: AssetImage(
                  "assets/images/splash.png",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: Center(
                child: Text(
                  "Verify Your ID",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
          body: success
          ?Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFFFFFFF).withOpacity(0.7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SvgPicture.asset("assets/svg/success.svg"),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,

                ),

                text1(

                    size: 28,
                    textAlign: TextAlign.center,
                    color: Color(0xFF333333),
                    text: 'Thank you, Your\n application is received\n and now under review.',
                    fontWeight: FontWeight.w700),
                SizedBox(
                  height: MediaQuery.of(context).size.height/6,
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
                      // Get.off(() =>Login());
                      registerUser();
                    },

                    child: text1(
                        size: 16,
                        color: Color(0xFFFFFFFF),
                        text: 'Login',
                        fontWeight: FontWeight.w600)),
              ],
            ),
          )
          :Container(
              color: Color(0xFFFFFFFF).withOpacity(0.7),
              child: Column(
                children: [
                 Image.asset(
                          "assets/images/animation_500_l6extbuo.gif",
                          // height: MediaQuery.of(context).size.height / 1.8,
                          // width: MediaQuery.of(context).size.width,
                        ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFFF0057FC),
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.4,
                            MediaQuery.of(context).size.height * 0.09,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          )),
                      onPressed: () async {
                        final userData = {
                          "first_name": "Chijioke",
                          "last_name": "Nna",
                          "dob": "2022-03-12"
                        };
                        final configObj = {
                          "debug": true,
                          "mobile": true,
                        };

//             var status = await Permission.camera.status;
//             if (status.isDenied) {
//             // We didn't ask for permission yet or the permission has been denied before but not permanently.
// }
                        DojahFinancial? _dojahFinancial;

                        //Use your appId and publicKey
                        _dojahFinancial = DojahFinancial(
                            appId: appId,
                            publicKey: publicKey,
                            type: "liveness",
                            //'verification', 'identification', 'verification', 'liveness'
                            userData: userData,
                            config: configObj,
                            onCloseCallback: (str) {
                              print("+++++++");
                              print(str.toString());
                            }); //Type can be link, identification, verification
                        _dojahFinancial.open(context, onSuccess: (result) {
                          print("Success");
                          print(result);
                          setState(() {
                            success = true;
                          });
                        }, onClose: (close) {
                          // print('Widget Closed');
                          // showLongToast("Please Try Again");
                          // Future.delayed(Duration.zero, () {
                          //   print('Widget Closed');
                          //   Navigator.of(context).pop();
                          // });
                          // SchedulerBinding.instance.addPostFrameCallback((_) {
                          //   print('Widget Closed');
                          //   Navigator.of(context).pop();/**/
                          // });
                        });

                        print("Worked");
                      },
                      child: text1(
                          size: 18,
                          color: Color(0xFFFFFFFF),
                          text: 'Start Verification',
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center)),
                ],
              ),
            )
    );
  }
  Future registerUser() async {
    try {

      var request = http.MultipartRequest('POST', Uri.parse(Constant.registerUser));
      print(Constant.firstName+Constant.lastName+Constant.emailId+Constant.mobileNumber+Constant.countryCode+Constant.countryPhoneCode+Constant.addressregister+Constant.addressZipCode+Constant.password+Constant.conformPassword);
      request.fields.addAll({
        'first_name':Constant.firstName,
        'last_name': Constant.lastName,
        'email': Constant.emailId,
        'mobile': Constant.mobileNumber,
        'country_code': Constant.countryCode,
        'country_phone_code': Constant.countryPhoneCode,
        'address': Constant.addressregister,
        'zip': Constant.addressZipCode,
        'password': Constant.password,
        'password_confirmation': Constant.conformPassword
      });

      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);

      print(jsonBody.toString());
      if (response.statusCode == 200) {
        if(jsonBody.toString().contains('success')){
          showLongToast("You Have Registered Successfully");
          // EasyLoading.showSuccess("You Have Registered Successfully");
          Get.offAll(Login());
        }
        else{
          print(jsonBody['error']);
          // EasyLoading.showError(jsonBody['error']['email']);
        }
      } else {
        showLongToast("Please Try Again");
        Get.to(Register());
        // EasyLoading.showError("Please try Again");
      }
    } catch (e) {
      if (e is SocketException) {
        showLongToast("Could not connect to internet");
      }
    }
  }

}
