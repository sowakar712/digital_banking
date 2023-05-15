import 'package:digital_banking/Components/Constant.dart';
import 'package:digital_banking/screens/AuthPage/Login/login.dart';
import 'package:digital_banking/screens/AuthPage/SignUp/address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../wedget/backButton.dart';
import '../../../wedget/textWedget.dart';
import 'address1.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  final fnmcontroller = TextEditingController();
  final lnmcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
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
              top: 8.0,
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
                text: 'Create Your Account',
                fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.04,
              right: MediaQuery.of(context).size.width * 0.04,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 18),
                  text1(
                      size: 16,
                      color: Colors.grey.shade500,
                      text: 'Sign up to get started',
                      fontWeight: FontWeight.w500),
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: text1(
                        size: 16,
                        color: Color(0xFF222222),
                        text: 'First Name',
                        fontWeight: FontWeight.w600),
                  ),
                  TextFormField(
                    cursorColor: Color(0xFF222222),
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        // height: 0.6,
                        color: Colors.black),
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter First Name";
                      }
                      else if(value.length<=2){
                      return "Please Enter Valid First Name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your first name",
                      hintStyle: GoogleFonts.openSans(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF222222),
                      ),
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
                    controller: fnmcontroller,
                    onSaved: (value) {},
                    textInputAction: TextInputAction.next,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: text1(
                        size: 16,
                        color: Color(0xFF222222),
                        text: 'Last Name',
                        fontWeight: FontWeight.w600),
                  ),
                  TextFormField(
                    cursorColor: Color(0xFF222222),
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        // height: 0.6,
                        color: Colors.black),
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Last Name";
                      }
                      else if(value.length<=2){
                        return "Please Enter Valid Last Name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your last name",
                      hintStyle: GoogleFonts.openSans(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF222222),
                      ),
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
                    controller: lnmcontroller,
                    onSaved: (value) {},
                    textInputAction: TextInputAction.next,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.11,
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
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                Constant.firstName = fnmcontroller.text;
                                Constant.lastName = lnmcontroller.text;
                              });
                              Get.to(Address1(),
                                  duration: Duration(milliseconds: 20),
                                  //duration of transitions, default 1 sec
                                  transition: Transition.leftToRight);
                            }
                          },
                          child: text1(
                              size: 16,
                              color: Color(0xFFFFFFFF),
                              text: 'Proceed',
                              fontWeight: FontWeight.w600)),
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
                              text: 'Already Have an Account? ',
                              fontWeight: FontWeight.w500),
                          InkWell(
                            onTap: () {
                              Get.offAll(Login(),
                                  duration: Duration(milliseconds: 20),
                                  //duration of transitions, default 1 sec
                                  transition: Transition.leftToRight);
                            },
                            child: text1(
                                size: 16,
                                color: Color(0xFF0057FC),
                                text: 'Login',
                                fontWeight: FontWeight.w500),
                          )
                        ],
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
}
