import 'dart:convert';
import 'dart:io';

import 'package:digital_banking/screens/AuthPage/SignUp/phoneNumber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Components/Constant.dart';
import '../../../services/userDataService.dart';
import '../../../wedget/backButton.dart';
import '../../../wedget/textWedget.dart';
import 'package:http/http.dart' as http;


class Address1 extends StatefulWidget {
  const Address1({Key? key}) : super(key: key);

  @override
  State<Address1> createState() => _Address1State();
}

class _Address1State extends State<Address1> {
  final addressController = TextEditingController();
  final zipCodeController = TextEditingController();
  final HomeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var selectadd = "Choose Address";
  List<String> Address = [];
  var Addid = new Map<String, String>();

  bool addressfield=false;
  bool isvalid=false;

  String dropDownValue='Please Select Your Address';

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
                bottom: 23.0,
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
                          text: 'Post Code',
                          fontWeight: FontWeight.w600),
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.characters,
                      cursorColor: Color(0xFF222222),
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          // height: 0.6,
                          color: Colors.black),
                      autofocus: false,
                      decoration: InputDecoration(

                        suffixIcon: InkWell(
                          onTap: (){
                            if(zipCodeController.text.isNotEmpty){
                              setState((){
                                addressfield=false;
                                Address.clear();
                              });

                              verifyAddress1(zipCodeController.text);

                            }
                          },
                          child: Icon(
                            Icons.search,
                            size: 30,
                          ),
                        ),

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
                        else if(isvalid){
                          return "Please Enter Valid Post Code";
                        }
                        return null;
                      },
                    ),
                    addressfield?Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: text1(
                          size: 16,
                          color: Color(0xFF222222),
                          text: 'Home Address',
                          fontWeight: FontWeight.w600),
                    ):Container(),
                    addressfield?DropdownButtonFormField(

                      items:  Address.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Padding(
                            padding: const EdgeInsets.only(top:2.0),
                            child: Container(
                              // height: 100,
                              child: Column(
                                children: [
                                  Text(items,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),

                      decoration: InputDecoration(
                        // hintText: "Select Your Address",
                        hintStyle: GoogleFonts.openSans(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF222222),
                        ),

                        contentPadding:
                        EdgeInsets.only(left: 16, top: 10, bottom: 0,right: 10),
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
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownValue = newValue!;
                          // dropDownId = Banksid[dropDownValue];
                        });
                        // print(dropDownId.toString());
                        // print(dropDownValue.toString());
                      },
                      isExpanded: true,
                      // isDense: true,

                      hint: Text(dropDownValue,
                        // overflow: TextOverflow.clip,
                        // maxLines: 1,

                      ),
                      icon:  Icon(
                        Icons.keyboard_arrow_down,
                      ),
                      validator: (value) {
                        if (value == null) {
                          return "Please Select Home Address";
                        }
                        return null;
                      },

                    ):Container(),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
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
                              if(_formKey.currentState!.validate()&&Address.isEmpty){
                                if(zipCodeController.text.isNotEmpty){
                                  setState((){
                                    addressfield=false;
                                    Address.clear();
                                  });
                                  verifyAddress1(zipCodeController.text);
                                }
                              }
                              else if (_formKey.currentState!.validate()&&Address.isNotEmpty) {
                                var diviseId = await getId();

                                Get.to(PhoneNumber(
                                  diviseId: diviseId.toString(),
                                ));
                                setState(() {
                                  Constant.addressregister = dropDownValue;
                                  Constant.addressZipCode  = zipCodeController.text;
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
  Future verifyAddress1(postcode) async {
    try {
      // EasyLoading.show(status: "Loading...");
      print(postcode);
      var request = http.Request('GET',Uri.parse('https://api.getAddress.io/find/${postcode}?api-key=CtMS94kj3Ua7ReA1VktYbQ31036&sort=true'));
      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);
      print(jsonBody.toString());
      if (response.statusCode == 200) {
        if(jsonBody['latitude']==0.0){
          validation(true);
          // EasyLoading.showError("Please Enter Post Code");
        }
        else{
          // EasyLoading.dismiss();
          jsonBody['addresses'].forEach((element) {
            setState(() {
              Address.add(element.toString().replaceAll(', ,', '').
              replaceAll(', , ,', '').
              replaceAll(', , , ,', '').
              replaceAll(', , , , ,', '').
              replaceAll(', , , , , ,', '').
              replaceAll(', , , , , , ,', '')
              );
              print(element);
              print("+++"+Address.toString());
            });
          });
          setState((){
            addressfield=true;
            dropDownValue='Please Select Your Address';
          });
          // EasyLoading.showSuccess("Please Select Home Address");
          validation(false);
        }

      } else {
        validation(true);
        // EasyLoading.showError("Please Enter Valid Post Code");
      }
    } catch (e) {
      if (e is SocketException) showLongToast("Could not connect to internet");
    }
  }
  void validation(val){
    setState((){
      isvalid=val;
    });
    if(_formKey.currentState!.validate());
  }


}
