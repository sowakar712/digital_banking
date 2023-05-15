import 'package:digital_banking/screens/dashBoardPage/dashBordPage/addFund/successAddFund.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../wedget/textWedget.dart';

class AddMoney extends StatefulWidget {
  const AddMoney({Key? key}) : super(key: key);

  @override
  State<AddMoney> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {
  final amountcontroler=TextEditingController();
  final fromcontroler=TextEditingController();
  final tocontroler=TextEditingController();
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
            text: "Add Money",
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
              height: 8,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height/15,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      offset: const Offset(
                        0.1,0.1
                      ),
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.grey.shade100,
                      offset: const Offset(0.1, 0.1),
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                  ],
                  color: Colors.white
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text1(
                        text: "Balance\t\t",
                        size: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                    ),
                    text1(
                        text: "-£768.47",
                        size: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                    ),
                  ],
                )
              ),
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
                          text: 'Amount',
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
                        hintText: "£ 0.00",
                        hintStyle:  GoogleFonts.openSans(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF222222),
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
                      controller: amountcontroler,
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
                          text: 'From',
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
                        hintText: "Barclays",
                        hintStyle:  GoogleFonts.openSans(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF222222),
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
                      controller: fromcontroler,
                      keyboardType: TextInputType.number,
                      // onSaved: (value) {
                      //   accountName.text = value!;
                      // },
                      textInputAction: TextInputAction.next,
                    ),
                    Padding(
                      padding:
                      EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: text1(
                          size: 17,
                          color: Color(0xFF222222),
                          text: 'To',
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
                        hintText: "Current account",
                        hintStyle:  GoogleFonts.openSans(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF222222),
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
                        // border: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //       color: Color(0xFF0057FC),
                        //       width: 2
                        //   ),
                        //   borderRadius: BorderRadius.circular(05),
                        // ),
                      ),
                      controller: tocontroler,
                      keyboardType: TextInputType.number,
                      // onSaved: (value) {
                      //   accountName.text = value!;
                      // },
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height:45,
                    ),
                    Wrap(
                      children: [
                        // RichText(
                        //   overflow: TextOverflow.clip,
                        //   textAlign: TextAlign.end,
                        //   textDirection: TextDirection.rtl,
                        //   softWrap: true,
                        //   maxLines: 1,
                        //   textScaleFactor: 1,
                        //   text: TextSpan(
                        //     text: 'Hello ',
                        //     style: DefaultTextStyle.of(context).style,
                        //     children: const <TextSpan>[
                        //       TextSpan(
                        //
                        //           text: 'Geeks', style: TextStyle(fontWeight: FontWeight.bold)),
                        //     ],
                        //   ),
                        // ),
                        text1(
                            size: 12,
                            textAlign: TextAlign.left,
                            color: Color(0xFF222222),
                            text: 'By agreeing and continuing, you consent to us requesting money from Barclays and sharing your account details with them.',
                            fontWeight: FontWeight.w600
                        ),
                        text1(
                            size: 12,
                            textAlign: TextAlign.left,
                            color: Color(0xFF14AE5C),
                            text: 'Terms and Conditions apply.',
                            fontWeight: FontWeight.w600
                        ),
                      ],
                    ),
                    SizedBox(
                      height:MediaQuery.of(context).size.height/8
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
                        onPressed: ()  {
                          print("Hey");
                          Get.to(SuccessAddFund());
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
                            text: 'Agree And Continue',
                            fontWeight: FontWeight.w600)),



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
