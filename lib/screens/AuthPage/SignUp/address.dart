import 'package:digital_banking/screens/AuthPage/SignUp/phoneNumber.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Components/Constant.dart';
import '../../../services/userDataService.dart';
import '../../../wedget/backButton.dart';
import '../../../wedget/textWedget.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  final addressController = TextEditingController();
  final zipCodeController = TextEditingController();
  final HomeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                top: 0.0,
                bottom: 8.0,
                left: MediaQuery.of(context).size.width * 0.3,
                right: MediaQuery.of(context).size.width * 0.3,
              ),
              child: Image(
                image: AssetImage("assets/images/splash.png"),
              ),
            ),
            Center(
              child: text1(
                  size: 24,
                  color: Color(0xFF222222),
                  text: 'Your Address',
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
                    SizedBox(height: 15),
                    text1(
                        size: 16,
                        color: Colors.grey.shade500,
                        text: 'Sign up to get started',
                        fontWeight: FontWeight.w500),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: text1(
                          size: 16,
                          color: Color(0xFF222222),
                          text: 'Home Number/Name',
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
                          return "Please Enter Home Number";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your home Name/Number",
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
                      controller: HomeController,
                      onSaved: (value) {},
                      textInputAction: TextInputAction.next,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: text1(
                          size: 16,
                          color: Color(0xFF222222),
                          text: 'Home Address',
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
                          return "Please Enter Home Address";
                        }
                        else if (value.length<=10) {
                          return "Please Enter Full Home Address";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your home address",
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
                      controller: addressController,
                      onSaved: (value) {},
                      textInputAction: TextInputAction.next,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: text1(
                          size: 16,
                          color: Color(0xFF222222),
                          text: 'Post Code',
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
                      decoration: InputDecoration(
                        hintText: "Enter your post code",
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
                      controller: zipCodeController,
                      onSaved: (value) {},
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Your Post Code";
                        }
                        return null;
                      },
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
                                verifyAddress(zipCodeController.text,HomeController.text);
                                setState(() {
                                  Constant.addressregister = addressController.text;
                                  Constant.addressZipCode =
                                      zipCodeController.text;
                                });
                              }
                            },
                            child: text1(
                                size: 16,
                                color: Color(0xFFFFFFFF),
                                text: 'Proceed',
                                fontWeight: FontWeight.w600)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.11,
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
