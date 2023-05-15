import 'package:clipboard/clipboard.dart';
import 'package:digital_banking/wedget/textWedget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../Components/Constant.dart';

class AccountPageNew extends StatefulWidget {
  String? AccountName;
  String? AccountNumber;
  String? SortCode;
  String? CurrencyCode;
  AccountPageNew(this.AccountName,this.AccountNumber,this.CurrencyCode,this.SortCode);

  @override
  State<AccountPageNew> createState() => _AccountPageNewState();
}

class _AccountPageNewState extends State<AccountPageNew> {
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
            text: '${widget.CurrencyCode} Account Details ',
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
                      fixedSize:  Size(140,45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )
                  ),
                  onPressed: (){
                    FlutterClipboard.copy('hello flutter friends').then(( value ) => print('copied'));
                    showLongToast("Text Copied Successfully");
                  },

                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.copy_sharp,
                        size: 22,),

                      text1(
                          size: 18,
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
                          text: 'Account Holder\'s Name',
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
                        hintText: "${widget.AccountName}",
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
                          text: 'Account Number',
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
                        hintText: "${widget.AccountNumber}",
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
                          text: 'Sort Code',
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
                        hintText: "${widget.SortCode}",
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
                              color: Color(0xFF0057FC),
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
                      height:45,
                    ),
                    Center(
                      child: Container(
                        width:MediaQuery.of(context).size.width/3.5,

                        alignment:Alignment.center,
                        decoration: BoxDecoration(
                          // color:  Color(0xff7c94b6),

                          border: Border.all(
                              color: Colors.blue,
                              width: 1
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: QrImage(
                          data:"https://in.linkedin.com/company/smi-infotech",
                          version: QrVersions.auto,
                          size:110.0,
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 30,

                        child:TextButton(
                          onPressed: (){
                          },
                          child:text1(
                              size: 13,
                              color: Color(0xFF222222),
                              text: 'Your QR Code',
                              fontWeight: FontWeight.w700
                          ),
                        )
                    ),
                    SizedBox(
                      height:30,
                    ),



                  ],
                ),

              ),
            ),
            Padding(
              padding:
              EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: text1(
                  size: 17,
                  color: Color(0xFF222222),
                  text: 'Payment Link',
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
                suffixIcon: InkWell(
                  onTap: (){
                    print("hey");

                  },
                  child: IconButton(
                    icon: Icon(Icons.share,
                        color: Colors.blue,
                        size:27
                    ),
                    onPressed: () {
                      onShareData(
                          text: "www.tiermoney.com/payme/x4qar1af"
                      );
                    },
                  ),
                ),
                hintText: "www.tiermoney.com/payme/x4qar1af",
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
                      color: Color(0xFF0057FC),
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
              height: 18,
            )


          ],
        ),
      ),
    );
  }
}
