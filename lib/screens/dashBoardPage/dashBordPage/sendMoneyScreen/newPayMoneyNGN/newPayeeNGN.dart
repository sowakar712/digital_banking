
import 'package:digital_banking/screens/dashBoardPage/dashBordPage/sendMoneyScreen/newPayMoneyNGN/securePinNGN.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../controller/bankController.dart';
import '../../../../../modelClass/ngnbankModel.dart';
import '../../../../../services/userDataService.dart';
import '../../../../../wedget/textWedget.dart';
class NewPayeeNGN extends StatefulWidget {
  const NewPayeeNGN({Key? key}) : super(key: key);

  @override
  State<NewPayeeNGN> createState() => _NewPayeeNGNState();
}

class _NewPayeeNGNState extends State<NewPayeeNGN> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController fnController=TextEditingController();
  TextEditingController lnController=TextEditingController();
  TextEditingController acnoController=TextEditingController();
  TextEditingController bankNameController=TextEditingController();
  TextEditingController refController=TextEditingController();
  TextEditingController cmpController=TextEditingController();
  final myController = Get.put(BankController());

  String dropDownValue = "Choose Banks";
  String? dropDownId = "";

  // List of items in our dropdown menu
  var item = [];

  var selectBank = "Choose Banks";
  List<String> Banks = [];
  var Banksid = new Map<String, String>();
  bool isloading=true;
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  // BankModel item=myController.myList[index];

  bool isSwitched=false;
  late List<BankModel> bankModel;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();

  }
  getData() {
    // print("HELLO--------");


    fBankList().then((value) {
      if (value != null) {
        setState(() {
          bankModel = value;
          print("HELLO--------");
          // print(bankModel[0]);
          print("HELLO--------");

          // print(bankModel.name);
          // print(bankModel.code);
          // setState(() {
          bankModel.forEach((element) {
            setState(() {
              Banks.add(element.name);
              Banksid[element.name] = element.code.toString();
            });
          });
          // });e
          setState((){

            isloading=false;

          });
        });
      }
    });
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
            text: "New Payee",
            size: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600
        ),
        centerTitle: true,
      ),
      body:isloading?Center(child: CircularProgressIndicator()):
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Form(
              key: _formKey,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text1(
                          size: 16,
                          color: Color(0xFF222222),
                          text: 'Is this a company?',
                          fontWeight: FontWeight.w600
                      ),
                      CupertinoSwitch(
                        activeColor: Color(0xFF0057FC),

                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            print(isSwitched);
                          });
                        },
                      ),

                    ],
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height*0.02,
                  ),

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
                      if(value.length!=10){
                        return "Please Enter Valid Account Number";

                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your account number",
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
                      text: 'Bank Name',
                      fontWeight: FontWeight.w600
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height*0.01,
                  ),
                  DropdownButtonFormField(
                      items:  Banks.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        hintText: "Select Bank Name",
                        hintStyle: GoogleFonts.openSans(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF222222),
                        ),
                        contentPadding:
                        EdgeInsets.only(left: 16, top: 15, bottom: 15,right: 10),
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
                          dropDownId = Banksid[dropDownValue];
                        });
                        print(dropDownId.toString());
                        print(dropDownValue.toString());
                      },
                      isExpanded: true,
                    isDense: true,
                      // hint: Text(dropdownvalue),
                      icon:  Icon(
                          Icons.keyboard_arrow_down,),
                    validator: (value) {
                      if (value == null) {
                        return "Please Select Bank Name";
                      }
                      return null;
                    },

                  ),
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
                          hintText: "Enter your company name",
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Reference";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Your reference",
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
                    height:MediaQuery.of(context).size.height*0.03,
                  ),

                  Container(
                    // height:MediaQuery.of(context).size.height*0.1,
                      width:MediaQuery.of(context).size.width*0.9,

                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF0057FC),),
                        color:  Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(30),

                      ),
                      child:Padding(
                        padding: const EdgeInsets.fromLTRB(10,16,3,16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            text1(
                                size: 16,
                                color: Color(0xFF222222),
                                text: 'Could this payee be part of scam?',
                                fontWeight: FontWeight.w600
                            ),
                            SizedBox(
                              height:MediaQuery.of(context).size.height*0.015,
                            ),
                            text1(
                                size: 10,
                                color: Color(0xFF222222),
                                text: 'Always verify who you are sending money to as you may not be able to recover these funds, A fraudster may tell you to ignore this warnings. ',
                                fontWeight: FontWeight.w400
                            ),
                          ],
                        ),
                      )
                  ),
                  SizedBox(
                    height: 30,
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

                        if(isSwitched==true){
                          if (_formKey.currentState!.validate()) {
                            var res=await Get.to(SecurePayNGN(cmpController.text,acnoController.text,refController.text,dropDownId.toString(),1.toString()));
                            if(res!=null){
                              Get.back(result: "data");
                            }
                          }
                        }
                        else{
                          if (_formKey.currentState!.validate()) {
                            var res=await Get.to(SecurePayNGN(fnController.text+' '+lnController.text,acnoController.text,refController.text,dropDownId.toString(),0.toString()));
                            if(res!=null){
                              Get.back(result: "data");
                            }
                          }
                        }

                      },

                      child:  text1(
                          size: 16,
                          color: Color(0xFFFFFFFF),
                          text: 'Next',
                          fontWeight: FontWeight.w600
                      )

                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),

          ],
        ),
      ),

    );

  }
}
