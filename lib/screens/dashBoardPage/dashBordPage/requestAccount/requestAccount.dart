import 'package:digital_banking/screens/dashBoardPage/dashBordPage/requestAccount/reqReceipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../wedget/textWedget.dart';


class RequestAccount extends StatefulWidget {
  const RequestAccount({Key? key}) : super(key: key);

  @override
  State<RequestAccount> createState() => _RequestAccountState();
}

class _RequestAccountState extends State<RequestAccount> {
  final selectAccountController=TextEditingController();
  final BVNController=TextEditingController();
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
            text: "Request Account",
            size: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/14
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,8,20,8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                      EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: text1(
                          size: 17,
                          color: Color(0xFF222222),
                          text: 'Select Account',
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          // height: 0.6,
                          color: Colors.black),
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "Nigerian Naira Account",
                        hintStyle:  GoogleFonts.openSans(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),


                        contentPadding:
                        EdgeInsets.only(left: 16, top: 10),
                        filled: true,
                        fillColor: Color(0xFFFFFFFF),
                        enabledBorder:  OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide:  BorderSide(
                              color: Colors.blue,
                              width: 0.8
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        border:  OutlineInputBorder(

                        ),
                        labelStyle: new TextStyle(color: Colors.green),
                        // border: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //       color: Color(0xFF0057FC),
                        //       width: 2
                        //   ),
                        //   borderRadius: BorderRadius.circular(05),
                        // ),
                      ),
                      controller: selectAccountController,
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        // accountName.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    Padding(
                      padding:
                      EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: text1(
                          size: 17,
                          color: Color(0xFF222222),
                          text: 'BVN',
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          // height: 0.6,
                          color: Colors.black),
                      autofocus: false,

                      decoration: InputDecoration(
                        hintText: "786567",
                        hintStyle:  GoogleFonts.openSans(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),
                        contentPadding:
                        EdgeInsets.only(left: 16, top: 10),
                        filled: true,
                        fillColor: Color(0xFFFFFFFF),
                        enabledBorder:  OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide:  BorderSide(
                              color: Colors.blue,
                              width: 0.8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        border:  OutlineInputBorder(

                        ),
                        labelStyle: new TextStyle(color: Colors.green),
                        // border: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //       color: Color(0xFF0057FC),
                        //       width: 2
                        //   ),
                        //   borderRadius: BorderRadius.circular(05),
                        // ),
                      ),
                      controller: BVNController,
                      keyboardType: TextInputType.number,
                      // onSaved: (value) {
                      //   accountName.text = value!;
                      // },
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                        height:MediaQuery.of(context).size.height/25
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'By Proceeding,you agree to our ',
                        style: TextStyle(

                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 14,
                        ),
                        children: const <TextSpan>[
                          TextSpan(text: 'Terms and Conditions', style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF14AE5C),
                              fontSize: 14
                          )
                          ),
                          TextSpan(text: ' and ',style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 14
                          )),
                          TextSpan(text: 'Privacy Policy.',style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF14AE5C),
                              fontSize: 14
                          )),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(
                        height:MediaQuery.of(context).size.height/5
                    ),

                  ],
                ),
              ),

            ),

            text1(
                size: 16,
                color: Color(0xFFFFFFFF),
                text: 'By Proceeding,you agree to our Terms and Conditions and Privacy Policy.',
                fontWeight: FontWeight.w600
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,8,20,8),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF0057FC),
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.9,
                        MediaQuery.of(context).size.height * 0.06,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                  onPressed: ()  {
                    print("Hey");
                    Get.to(ReqReceipt());
                    // if (_formKey.currentState!.validate()) {
                    //   Get.to(VerifyPassword(),
                    //       duration: Duration(milliseconds: 20),
                    //       //duration of transitions, default 1 sec
                    //       transition: Transition.leftToRight);
                    // }
                  },

                  child: text1(
                      size: 16,
                      color: Color(0xFFFFFFFF),
                      text: 'Apply',
                      fontWeight: FontWeight.w600)),
            ),





          ],
        ),
      ),


    );
  }
}
