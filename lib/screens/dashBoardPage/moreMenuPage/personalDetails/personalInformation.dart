import 'package:digital_banking/screens/dashBoardPage/dashBordPage/addFund/successAddFund.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../wedget/textWedget.dart';
import '../../../../Components/Constant.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final fnController=TextEditingController();
  final lnController=TextEditingController();
  final pnoController=TextEditingController();
  final emailController=TextEditingController();
  final dobController=TextEditingController();
  final laddController=TextEditingController();

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
            text: "Personal Information",
            size: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          AbsorbPointer(
            absorbing: true,
            child: Form(
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
                          text: 'First Name',
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right :8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                  color: Color(0xFF0057FC)
                              ),
                              color: Colors.transparent,

                            ),
                            child: SvgPicture.asset(

                              "assets/screen/profile.svg",
                              height: 30,
                              width: 30,
                                color: Color(0xFF0057FC)

                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.75,
                          child: TextFormField(

                            cursorColor: Colors.black,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18.0,
                                // height: 0.6,
                                color: Colors.black),
                            autofocus: false,

                            decoration: InputDecoration(
                              hintText: "${Constant.firstName}",
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
                            controller: fnController,
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              // accountName.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                      EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: text1(
                          size: 17,
                          color: Color(0xFF222222),
                          text: 'Last Name',
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right :8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                  color: Color(0xFF0057FC)
                              ),
                              color: Colors.transparent,

                            ),
                            child: SvgPicture.asset(

                              "assets/screen/profile.svg",
                              height: 30,
                              width: 30,
                                color: Color(0xFF0057FC)

                            ),
                          ),
                        ),

                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.75,

                          child: TextFormField(

                            cursorColor: Colors.black,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18.0,
                                // height: 0.6,
                                color: Colors.black),
                            autofocus: false,

                            decoration: InputDecoration(
                              hintText: "${Constant.lastName}",
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

                            ),
                            controller: lnController,
                            keyboardType: TextInputType.number,
                            // onSaved: (value) {
                            //   accountName.text = value!;
                            // },
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                      EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: text1(
                          size: 17,
                          color: Color(0xFF222222),
                          text: 'Phone Number',
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right :8.0),
                          child: Container(


                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                  Icons.phone_android_sharp,
                                  color: Color(0xFF0057FC),
                                  size:20
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                  color: Color(0xFF0057FC)
                              ),
                              color: Colors.transparent,

                            ),

                          ),
                        ),

                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.75,

                          child: TextFormField(
                            cursorColor: Colors.black,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18.0,
                                // height: 0.6,
                                color: Colors.black),
                            autofocus: false,
                            decoration: InputDecoration(
                              hintText: "${Constant.mobileNumber}",
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
                              // border: OutlineInputBorder(
                              //   borderSide: BorderSide(
                              //       color: Color(0xFF0057FC),
                              //       width: 2
                              //   ),
                              //   borderRadius: BorderRadius.circular(05),
                              // ),
                            ),
                            controller: pnoController,
                            keyboardType: TextInputType.number,
                            // onSaved: (value) {
                            //   accountName.text = value!;
                            // },
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                      EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: text1(
                          size: 17,
                          color: Color(0xFF222222),
                          text: 'Emails',
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Row(
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(right :8.0),
                          child: Container(


                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.email_outlined,
                                  color: Color(0xFF0057FC),
                                  size:20
                                ),
                              ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: Color(0xFF0057FC)
                              ),
                              color: Colors.transparent,

                            ),

                          ),
                        ),

                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.75,

                          child: TextFormField(
                            cursorColor: Colors.black,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18.0,
                                // height: 0.6,
                                color: Colors.black),
                            autofocus: false,
                            decoration: InputDecoration(
                              hintText: "${Constant.emailId}",
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

                            ),
                            controller: emailController,
                            keyboardType: TextInputType.number,
                            // onSaved: (value) {
                            //   accountName.text = value!;
                            // },
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                      EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: text1(
                          size: 17,
                          color: Color(0xFF222222),
                          text: 'Date Of Birth',
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
                        hintText: "${Constant.dob}",
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
                        // border: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //       color: Color(0xFF0057FC),
                        //       width: 2
                        //   ),
                        //   borderRadius: BorderRadius.circular(05),
                        // ),
                      ),
                      controller: dobController,
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
                          text: 'Legal Address',
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    TextFormField(
                      maxLines: 4,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          // height: 0.6,
                          color: Colors.black),
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "${Constant.addressregister}",
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
                        // border: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //       color: Color(0xFF0057FC),
                        //       width: 2
                        //   ),
                        //   borderRadius: BorderRadius.circular(05),
                        // ),
                      ),
                      controller: laddController,
                      keyboardType: TextInputType.number,
                      // onSaved: (value) {
                      //   accountName.text = value!;
                      // },
                      textInputAction: TextInputAction.next,
                    ),

                    SizedBox(
                      height:45,
                    ),
                    SizedBox(
                        height:MediaQuery.of(context).size.height/38
                    ),



                  ],
                ),
              ),

            ),
          ),
        ],
      ),

    );
  }
}
