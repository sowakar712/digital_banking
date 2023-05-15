import 'package:clipboard/clipboard.dart';
import 'package:digital_banking/screens/dashBoardPage/dashBordPage/dashBoardPage.dart';
import 'package:digital_banking/wedget/textWedget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Components/Constant.dart';

class ReqReceipt extends StatefulWidget {
  const ReqReceipt({Key? key}) : super(key: key);

  @override
  State<ReqReceipt> createState() => _ReqReceiptState();
}

class _ReqReceiptState extends State<ReqReceipt> {
  final accountName=TextEditingController();
  final accountNumber=TextEditingController();
  final SortCode=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x00FFFFFF).withOpacity(.1),
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child:Padding(
            padding: const EdgeInsets.fromLTRB(12.0,8,6,8),
            child: SvgPicture.asset(
              "assets/svg/backButton.svg",

            ),
          ),
        ),
        title: text1(
            size: 21,
            color: Color(0xFF222222),
            text: 'Request Account',
            fontWeight: FontWeight.w600
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding:  EdgeInsets.only(
            left: MediaQuery.of(context).size.width*0.05,
            right: MediaQuery.of(context).size.width*0.05,
            top:10

        ),
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Padding(
              padding:  EdgeInsets.only(
                right: MediaQuery.of(context).size.width*0.6,
              ),
              child: ElevatedButton(


                  style: ElevatedButton.styleFrom(
                      primary:  Color(0xFFF0057FC),
                      fixedSize:  Size(140,40),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),

                  onPressed: (){
                    FlutterClipboard.copy('www.tiermoney.com/payme/x4qar1af').then(( value ) => print('copied'));
                    showLongToast("Text Copied Successfully");
                  },

                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.copy_sharp,
                        size: 20,),

                      text1(
                          size: 16,
                          color: Color(0xFFFFFFFF),
                          text: 'Copy',
                          fontWeight: FontWeight.w600
                      ),

                    ],
                  )
              ),
            ),
            AbsorbPointer(
              absorbing: true,
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                      EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: text1(
                          size: 17,
                          color: Color(0xFF222222),
                          text: 'Name of Payee',
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    TextFormField(
                      cursorColor: Colors.grey,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          // height: 0.6,
                          color: Colors.black),
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "Michael Cole",
                        hintStyle:  GoogleFonts.openSans(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF222222),
                        ),


                        contentPadding:
                        EdgeInsets.only(left: 16, top: 10),
                        filled: true,
                        fillColor: Color(0xFFF9F9F9),
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
                      controller: accountName,
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        accountName.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    Padding(
                      padding:
                      EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: text1(
                          size: 17,
                          color: Color(0xFF222222),
                          text: 'Bank',
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    TextFormField(
                      cursorColor: Colors.grey,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          // height: 0.6,
                          color: Colors.black),
                      autofocus: false,

                      decoration: InputDecoration(
                        hintText: "VFD MFB",
                        hintStyle:  GoogleFonts.openSans(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF222222),
                        ),
                        contentPadding:
                        EdgeInsets.only(left: 16, top: 10),
                        filled: true,
                        fillColor: Color(0xFFF9F9F9),
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
                      controller: accountName,
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        accountName.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    Padding(
                      padding:
                      EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: text1(
                          size: 17,
                          color: Color(0xFF222222),
                          text: 'Account',
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    TextFormField(
                      cursorColor: Colors.grey,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          // height: 0.6,
                          color: Colors.black),
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "1234567890",
                        hintStyle:  GoogleFonts.openSans(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF222222),
                        ),
                        contentPadding:
                        EdgeInsets.only(left: 16, top: 10),
                        filled: true,
                        fillColor: Color(0xFFF9F9F9),
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
                      controller: accountName,
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        accountName.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height:MediaQuery.of(context).size.height*0.05,
                    ),
                    SizedBox(
                      height:MediaQuery.of(context).size.height*0.03,
                    ),



                  ],
                ),

              ),
            ),

            SizedBox(
                height: MediaQuery.of(context).size.height/8
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
                    Get.offAll(DashBoardPage());
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
                      text: 'Done',
                      fontWeight: FontWeight.w600)),
            ),



          ],
        ),
      ),
    );
  }
}
