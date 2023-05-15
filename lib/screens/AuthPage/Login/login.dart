import 'dart:convert';
import 'dart:io';
import 'package:digital_banking/Components/Constant.dart';
import 'package:digital_banking/screens/AuthPage/Forgot/forgot.dart';
import 'package:digital_banking/screens/AuthPage/Login/verifyOTP.dart';
import 'package:digital_banking/screens/AuthPage/SignUp/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart'as http;
import '../../../utils/tierMoney.dart';
import '../../../wedget/textWedget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool passwordVisible=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
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
                text: 'Login',
                fontWeight: FontWeight.w600
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left:MediaQuery.of(context).size.width*0.04,
              right:MediaQuery.of(context).size.width*0.04,            ),
            child: Form(
              key: _formKey,
              // autovalidateMode: AutovalidateMode.,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height:18
                  ),
                  text1(
                      size: 16,
                      color: Color(0xFF222222),
                      text: 'Welcome Back',
                      fontWeight: FontWeight.w600
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
                        text: 'Email',
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  TextFormField(
                    cursorColor: Color(0xFF222222),
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        // height: 0.6,
                        color: Colors.black
                    ),
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Email";
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA_Z0-9.-]+.[a-z]").hasMatch(value)) {
                        return ("Please Enter Valid Email");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Your Email",
                      hintStyle:  GoogleFonts.openSans(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF222222),
                      ),

                      contentPadding:
                      EdgeInsets.only(left: 16, top: 15,bottom:15),
                      filled: true,
                      fillColor: Color(0xFFEDEDED),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent
                          ),
                          borderRadius: BorderRadius.circular(4)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent
                          ),
                          borderRadius: BorderRadius.circular(4)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent
                          ),
                          borderRadius: BorderRadius.circular(4)
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent
                          ),
                          borderRadius: BorderRadius.circular(4)
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent
                          ),
                          borderRadius: BorderRadius.circular(4)
                      ),
                      labelStyle: new TextStyle(color: Colors.green),

                    ),
                    controller: emailController,
                    onSaved: (value) {
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  Padding(
                    padding:
                    EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: text1(
                        size: 16,
                        color: Color(0xFF222222),
                        text: 'Password',
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  TextFormField(
                    cursorColor: Color(0xFF222222),
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        // height: 0.6,
                        color: Colors.black
                    ),
                    autofocus: false,
                    obscureText: passwordVisible,
                    obscuringCharacter: "*",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Your Password";
                      }
                      else if(value.length<10)
                      {
                        return "Your Password must be at least 10 character";

                      }
                      else if (!RegExp(r"(?=.*[A-Z])(?=.*\W)").hasMatch(value!)) {
                        return ("Please Enter Valid Password");
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          passwordVisible
                              ? Icons.visibility_off_sharp
                              : Icons.visibility_sharp,

                          color: Color(0xFF292D32),
                          size: 27,
                        ),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      ),


                      hintText: "Enter Your Password",
                      hintStyle:  GoogleFonts.openSans(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF222222),
                      ),


                      contentPadding:
                      EdgeInsets.only(left: 16, top: 15,bottom:15),
                      filled: true,
                      fillColor: Color(0xFFEDEDED),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent
                          ),
                          borderRadius: BorderRadius.circular(4)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent
                          ),
                          borderRadius: BorderRadius.circular(4)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent
                          ),
                          borderRadius: BorderRadius.circular(4)
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent
                          ),
                          borderRadius: BorderRadius.circular(4)
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent
                          ),
                          borderRadius: BorderRadius.circular(4)
                      ),
                      labelStyle: new TextStyle(color: Colors.green),

                    ),
                    controller: passwordController,
                    onSaved: (value) {
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(Forgot());
                    },
                    child: Padding(
                      padding:
                      EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: text1(
                          size: 16,
                          color: Color(0xFF2D487B),
                          text: 'Forgot Password',
                          fontWeight: FontWeight.w500
                      ),
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
                            if (_formKey.currentState!.validate()) {
                              loginUser();
                            }
                          },

                          child:  text1(
                              size: 16,
                              color: Color(0xFFFFFFFF),
                              text: 'Login',
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
                              size: 16,
                              color: Color(0xFF222222),
                              text: 'Don’t have an account yet?',
                              fontWeight: FontWeight.w500
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(Register());
                            },
                            child:  text1(
                                size: 16,
                                color: Color(0xFF0057FC),
                                text: 'Sign Up',
                                fontWeight: FontWeight.w500
                            ),
                          )

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
          ),

        ],
      ),

    );
  }
  Future loginUser() async {
    // EasyLoading.show(status: "Loading...");
    try {
      var request =
      http.MultipartRequest('POST', Uri.parse(Constant.userLogin));
      request.fields.addAll(
          {'email': emailController.text, 'password': passwordController.text});

      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);
      print(jsonBody.toString());

      if (response.statusCode == 200) {
        if(jsonBody.toString().contains('success')){
          TierMoneyPreference().setString("token", jsonBody['success']['token'].toString());
          String token = jsonBody['success']['token'].toString();
          print("token=>${token}");
          // EasyLoading.showSuccess("OTP Sent Successfully");
          print("PIN STATUS : "+jsonBody['success']['pin_status'].toString());
          setState((){
            Constant.token=token;
          });
          print(jsonBody['success']['otp']);
          print(jsonBody['success']['pin_status']);

          Get.to(VerifyOTP(
            email: emailController.text,
            password: passwordController.text,
            pinStatus: jsonBody['success']['pin_status'],

          ));
        }
        else{
          
        }
      } else {
        // EasyLoading.dismiss();
        print(jsonBody['success']);
        showLongToast(jsonBody['error']['password']);

        // EasyLoading.showError(jsonBody['error']['password']);
      }
    } catch (e) {
      showLongToast("Username and password doesn't match");
      if (e is SocketException) {
        showLongToast("Could not connect to internet");
      }
    }
  }

}


