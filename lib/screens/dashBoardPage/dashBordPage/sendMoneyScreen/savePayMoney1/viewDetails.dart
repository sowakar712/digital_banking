import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../wedget/textWedget.dart';


class ViewDetailsUK extends StatefulWidget {
  String? Name;
  String? AccountNumber;
  String? SortCode;
  String? Reference;
  String? isCompany;
  ViewDetailsUK(this.Name,this.AccountNumber,this.SortCode,this.Reference,this.isCompany);

  @override
  State<ViewDetailsUK> createState() => _ViewDetailsUKState();
}

class _ViewDetailsUKState extends State<ViewDetailsUK> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController fnController=TextEditingController();
  TextEditingController lnController=TextEditingController();
  TextEditingController acnoController=TextEditingController();
  TextEditingController sortController=TextEditingController();
  TextEditingController refController=TextEditingController();
  TextEditingController cmpController=TextEditingController();
  bool isSwitched=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.isCompany=="1"){
      setState((){
        isSwitched=true;
      });
    }
    else{
      setState((){
        isSwitched=false;
      });
    }

    print(widget.isCompany);

  }
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
            text: "Manage UK Payee",
            size: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            AbsorbPointer(
              absorbing: true,
              child: Form(
                key: _formKey,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    SizedBox(
                      height:MediaQuery.of(context).size.height*0.02,
                    ),

                    isSwitched?Container():Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text1(
                            size: 16,
                            color: Color(0xFF222222),
                            text: 'First Name',
                            fontWeight: FontWeight.w600
                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.height*0.01,
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
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "${widget.Name}",
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
                          controller: fnController,
                          onSaved: (value) {},
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.height*0.02,
                        ),
                      ],
                    ),
                    isSwitched?Container():Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        text1(
                            size: 16,
                            color: Color(0xFF222222),
                            text: 'Last Name',
                            fontWeight: FontWeight.w600
                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.height*0.01,
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
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "${widget.Name}",
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
                          controller: lnController,
                          onSaved: (value) {},
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.height*0.02,
                        ),
                      ],
                    ),
                    isSwitched?Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        text1(
                            size: 16,
                            color: Color(0xFF222222),
                            text: 'Company Name',
                            fontWeight: FontWeight.w600
                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.height*0.01,
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
                              return "Please Enter Company Name";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "${widget.Name}",
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
                          controller: cmpController,
                          onSaved: (value) {},
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.height*0.02,
                        ),
                      ],
                    ):Container(),


                    text1(
                        size: 16,
                        color: Color(0xFF222222),
                        text: 'Account Number',
                        fontWeight: FontWeight.w600
                    ),
                    SizedBox(
                      height:MediaQuery.of(context).size.height*0.01,
                    ),
                    TextFormField(

                      cursorColor: Color(0xFF222222),
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          // height: 0.6,
                          color: Colors.black),
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Account Number";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "${widget.AccountNumber}",
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
                      controller: acnoController,
                      onSaved: (value) {},
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height:MediaQuery.of(context).size.height*0.02,
                    ),

                    text1(
                        size: 16,
                        color: Color(0xFF222222),
                        text: 'Sort Code',
                        fontWeight: FontWeight.w600
                    ),
                    SizedBox(
                      height:MediaQuery.of(context).size.height*0.01,
                    ),
                    TextFormField(
                      cursorColor: Color(0xFF222222),
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          // height: 0.6,
                          color: Colors.black),
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Sort Code";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "${widget.SortCode}",
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
                      controller: sortController,
                      onSaved: (value) {},
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height:MediaQuery.of(context).size.height*0.02,
                    ),

                    text1(
                        size: 16,
                        color: Color(0xFF222222),
                        text: 'Reference',
                        fontWeight: FontWeight.w600
                    ),
                    SizedBox(
                      height:MediaQuery.of(context).size.height*0.01,
                    ),
                    TextFormField(
                      cursorColor: Color(0xFF222222),
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          // height: 0.6,
                          color: Colors.black),
                      autofocus: false,
                      // keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Reference";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "${widget.Reference}",
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
                      controller: refController,
                      onSaved: (value) {},
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height:MediaQuery.of(context).size.height*0.07,
                    ),



                  ],
                ),
              ),
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
                  Get.back();
                },

                child:  text1(
                    size: 16,
                    color: Color(0xFFFFFFFF),
                    text: 'Close',
                    fontWeight: FontWeight.w600
                )

            ),


          ],
        ),
      ),

    );

  }

}
