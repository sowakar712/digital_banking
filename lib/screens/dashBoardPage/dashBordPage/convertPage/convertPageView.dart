
import 'package:digital_banking/screens/dashBoardPage/dashBordPage/convertPage/securePin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../wedget/textWedget.dart';
import 'package:currency_picker/currency_picker.dart';

class ConvertPage extends StatefulWidget {
  const ConvertPage({Key? key}) : super(key: key);

  @override
  State<ConvertPage> createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage> {

  // Initial Selected Value
  String dropdownvalue = 'Item 1';
  Currency? currencyNm;
  String currencyName = 'Select';
  String? CurrencyFlag ;
  String? CurrencyCode ;
  String? CurrencyCodeEx ;
  Currency? currencyNmEx;
  String currencyNameEx = 'Select';
  int getValue = 0;
  String? CurrencyFlagEx ;
  TextEditingController ExchangeController = TextEditingController();
  TextEditingController GetController = TextEditingController();


  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  void initState() {
    super.initState();
    // getcurflag();
    // getcurflagEx();
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
            text: "Currency Converter",
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

          SizedBox(height: MediaQuery.of(context).size.height/28,),
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
                        size: 16,
                        color: Color(0xFF222222),
                        text: 'Your Exchange',
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  TextFormField(

                    cursorColor: Colors.black,
                    style: GoogleFonts.openSans(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                    autofocus: true,

                    decoration: InputDecoration(

                      hintText: "100",
                      prefix: Text("£"),
                      prefixStyle:  GoogleFonts.openSans(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                      hintStyle:   GoogleFonts.openSans(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(
                          right: 8.0,
                          left:8,
                          top:8,
                          bottom: 8
                        ),
                        child: Image(
                            image: AssetImage("assets/images/Layer1.png",),
                            height: 40,
                            width:40,
                          // color: Colors.red,
                        ),
                      ),
                      // suffix: Image(
                      //   image: AssetImage("assets/images/GBPcircle.png",),
                      //  height: 30,
                      //   width:30
                      //   // color: Colors.red,
                      // ),




                      contentPadding:
                      EdgeInsets.only(left: 16, top: 0,bottom:10,right: 10),
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
                    controller: ExchangeController,
                    keyboardType: TextInputType.number,
                    onChanged: (str){
                      print(str.length);
                      if(str.length==0){
                        print("HELL");
                        GetController.text='₦'+"49700";
                      }
                      else{
                        setState(() {
                          print(str);
                          GetController.text =
                              '₦' + (int.parse(str) * 497).toString();
                        });
                      }
                    },
                    onSaved: (value) {
                      // accountName.text = value!;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                  text1(
                      size: 18,
                      color: Color(0xFF222222),
                      text: ' Balance   £768.47',
                      fontWeight: FontWeight.w600
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                  AbsorbPointer(
                    absorbing: true,
                    child: Center(
                      child: Container(
                        child: text1(
                            size: 18,
                            color: Color(0xFF222222),
                            text: ' 1GBP = NGN 497',
                            fontWeight: FontWeight.w600
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,

                          ),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        padding: EdgeInsets.all(12),
                      ),
                    )

                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.07,),

                  Padding(
                    padding:
                    EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: text1(
                        size: 16,
                        color: Color(0xFF222222),
                        text: 'You Get',
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  AbsorbPointer(
                    absorbing: true,
                    child: TextFormField(

                      cursorColor: Colors.black,
                      style:  GoogleFonts.openSans(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                      autofocus: false,

                      decoration: InputDecoration(

                        hintText: "₦49700",
                        hintStyle:   GoogleFonts.openSans(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black
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
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0,
                              left:8,
                              top:8,
                              bottom: 8
                          ),
                          child: Image(
                            image: AssetImage("assets/images/Layer2.png",),
                            height: 40,
                            width:40,
                            // color: Colors.red,
                          ),
                        ),
                        // border: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //       color: Color(0xFF0057FC),
                        //       width: 2
                        //   ),
                        //   borderRadius: BorderRadius.circular(05),
                        // ),
                      ),
                      controller: GetController,
                      keyboardType: TextInputType.number,
                      // onSaved: (value) {
                      //   accountName.text = value!;
                      // },
                      textInputAction: TextInputAction.next,
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.13,),

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

                          Get.off(SecurePinConvert());
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
                            text: 'Convert',
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                      height:MediaQuery.of(context).size.height/38
                  ),



                ],
              ),
            ),

          ),

          // Container(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   color: Colors.white,
          //   child: Column(
          //     children: [
          //       SizedBox(height: MediaQuery.of(context).size.height/22,),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Container(
          //             width: 313,
          //             height: 126,
          //             decoration: BoxDecoration(
          //               color : Colors.blue[50],
          //             ),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceAround,
          //               children: [
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     text(text:"Choose Account",color: Colors.black,size: 20,fontWeight: FontWeight.bold),
          //
          //                     Icon(Icons.keyboard_arrow_down_sharp,
          //                         size:30),
          //                   ],
          //                 ),
          //                 text(text:"GB 10-00-00 22222",color: Colors.black,size: 20,fontWeight: FontWeight.bold),
          //                 text(text:"£100.00",color: Colors.black,size: 20,fontWeight: FontWeight.bold),
          //               ],
          //             ),
          //           )
          //         ],
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(15.0),
          //         child: ListView(
          //           shrinkWrap: true,
          //           children: [
          //
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Text("Your Exchange",style: GoogleFonts.quicksand(fontSize: 20,fontWeight: FontWeight.bold,),),
          //                 InkWell(
          //                   // style: ElevatedButton.styleFrom(
          //                   //     primary: Colors.lightBlueAccent.shade100,
          //                   //     // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          //                   //     textStyle: TextStyle(
          //                   //         fontSize: 25,
          //                   //         fontWeight: FontWeight.bold)),
          //
          //
          //                   onTap: () {
          //                     showCurrencyPicker(
          //
          //                       context: context,
          //                       showFlag: true,
          //                       showSearchField: true,
          //                       showCurrencyName: true,
          //                       showCurrencyCode: true,
          //                       onSelect: (Currency currency)async {
          //
          //                         setState((){
          //                           currencyNm=currency;
          //                           currencyName=currency.code;
          //                           CurrencyFlag=currency.flag;
          //                           CurrencyCode=currency.code;
          //
          //                         });
          //                         await TierMoneyPreference().setString("curname","${currencyNm?.name}" );
          //                         await TierMoneyPreference().setString("curflag","${currencyNm?.flag}" );
          //                         // print('Select currency: ${currency.name}');
          //                         // print('Select currency: ${currency.flag}');
          //                         print('Select currency: ${currencyNm?.code}');
          //                         print(currencyNm?.symbol);
          //
          //                       },
          //                       // favorite: ['SEK'],
          //                     );
          //                   },
          //                   child: Row(
          //                     children: [
          //                       Text(currencyNm!=null?"${currencyNm?.code}":"GBP",
          //                           style: GoogleFonts.quicksand(
          //                             fontSize: 20,
          //                             fontWeight: FontWeight.bold,
          //                             color:  Color(0xFF4594DD),
          //
          //                           )),
          //                       Icon(Icons.keyboard_arrow_down_sharp,
          //                           size:30),
          //                     ],
          //                   ),
          //                 ),
          //
          //               ],
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Container(
          //                   width:MediaQuery.of(context).size.width*0.45,
          //                   child: TextFormField(
          //                     controller: ExchangeController,
          //                     onChanged: (str)
          //                     {
          //                       setState((){
          //                         getValue=int.parse(ExchangeController.text);
          //                         print(getValue);
          //                       });
          //
          //                     },
          //
          //
          //                     keyboardType: TextInputType.number,
          //
          //
          //                     // cursorColor: Theme.of(context).cursorColor,
          //                     // initialValue: 'Input text',
          //                     // maxLength: 20,
          //                     decoration: InputDecoration(
          //                       // prefixText: '\${currencyNm?.symbol}',
          //                       prefixText: "${currencyNm?.symbol}"==null?'${currencyNm?.symbol}':"\£",
          //                       prefixStyle: TextStyle(color: Colors.black,
          //                           fontSize: 19
          //                       ),
          //
          //                       enabledBorder: UnderlineInputBorder(
          //                         borderSide: BorderSide(color: Color(0xFFD9D9D9)),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 currencyNm!=null? _flagWidget(currencyNm!):Image.asset("assets/images/Gbp.png",
          //                   scale: 2.8,
          //                 )
          //               ],
          //             ),
          //             SizedBox(
          //               height: 30,
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //
          //                 Container(
          //                   width: MediaQuery.of(context).size.width/2,
          //                   height: MediaQuery.of(context).size.height/16,
          //                   decoration: BoxDecoration(
          //                     color : Color.fromRGBO(217, 217, 217, 1),
          //                   ),
          //                   child: Column(
          //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                     children: [
          //                       text(
          //                           text:
          //                           // "${currencyNm?.name}"==null||"${currencyNmEx?.name}"==null?"1 = 750 ${currencyNmEx?.name}":
          //                           "${CurrencyCode}"=="null"&&"${CurrencyCodeEx}"=="null"?
          //                           "1GPB = 750NGN":
          //                           "${CurrencyCode}"=="null"?
          //
          //                           "${ExchangeController.text}1GDP = 750 ${CurrencyCodeEx}":
          //                           "${CurrencyCodeEx}"=="null"?
          //
          //                           // "${ExchangeController.text}${CurrencyCode} = 750 NGN":
          //                           // "${ExchangeController.text}${CurrencyCode} = ${ExchangeController.text*750} ${CurrencyCodeEx}",
          //                           "${ExchangeController.text}${CurrencyCode} = 750 NGN":
          //                           "${ExchangeController.text}${CurrencyCode} = ${1*750} ${CurrencyCodeEx}",
          //
          //
          //                           color: Colors.black,size: 20,fontWeight: FontWeight.bold),
          //                       // text(text:"GB 10-00-00 22222",color: Colors.black,size: 20,fontWeight: FontWeight.bold),
          //                       // text(text:"£100.00",color: Colors.black,size: 20,fontWeight: FontWeight.bold),
          //                     ],
          //                   ),
          //                 )
          //               ],
          //             ),
          //             SizedBox(
          //               height:20,
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Text("You Get",style: GoogleFonts.quicksand(fontSize: 20,fontWeight: FontWeight.bold,),),
          //                 InkWell(
          //
          //                   // style: ElevatedButton.styleFrom(
          //                   //     primary: Colors.lightBlueAccent.shade100,
          //                   //     // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          //                   //     textStyle: TextStyle(
          //                   //         fontSize: 25,
          //                   //         fontWeight: FontWeight.bold)),
          //
          //
          //                   onTap: () {
          //                     showCurrencyPicker(
          //
          //                       context: context,
          //                       showFlag: true,
          //                       showSearchField: true,
          //                       showCurrencyName: true,
          //                       showCurrencyCode: true,
          //                       onSelect: (Currency currency)async {
          //
          //                         setState((){
          //                           currencyNmEx=currency;
          //                           currencyNameEx=currency.code;
          //                           CurrencyFlagEx=currency.flag;
          //                           CurrencyCodeEx=currency.code;
          //
          //
          //                         });
          //                         await TierMoneyPreference().setString("curnameEx","${currencyNmEx?.name}" );
          //                         await TierMoneyPreference().setString("curflagEx","${currencyNmEx?.flag}" );
          //                         // print('Select currency: ${currency.name}');
          //                         // print('Select currency: ${currency.flag}');
          //                         print('Select currency: ${currencyNmEx?.code}');
          //                       },
          //                       // favorite: ['SEK'],
          //                     );
          //
          //                   },
          //                   child: Row(
          //                     children: [
          //                       Text(currencyNmEx!=null?"${currencyNmEx?.code}":"NGN",
          //                           style: GoogleFonts.quicksand(
          //                             fontSize: 20,
          //                             fontWeight: FontWeight.bold,
          //                             color:  Color(0xFF4594DD),
          //
          //                           )
          //                       ),
          //                       Icon(Icons.keyboard_arrow_down_sharp,
          //                           size:30),
          //                     ],
          //                   ),
          //                 ),
          //
          //               ],
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Container(
          //                   width:MediaQuery.of(context).size.width*0.45,
          //                   child: AbsorbPointer(
          //                     absorbing: true,
          //                     child: TextFormField(
          //                       keyboardType: TextInputType.number,
          //
          //                       // cursorColor: Theme.of(context).cursorColor,
          //                       // initialValue: 'Input text',
          //                       // maxLength: 20,
          //                       decoration: InputDecoration(
          //                         prefixText: "${currencyNmEx?.symbol}"==null?'${currencyNmEx?.symbol}':"\₦",
          //                         prefixStyle: TextStyle(color: Colors.black,
          //                             fontSize: 19
          //                         ),
          //
          //                         hintText: "${currencyNmEx?.symbol}"==null?
          //                         '${currencyNmEx?.symbol}':
          //                         ExchangeController.text.isEmpty?"0":
          //
          //                         "\₦${getValue*750}",
          //
          //                         //make hint text
          //                         hintStyle: TextStyle(color: Colors.black,
          //                             fontSize: 19
          //                         ),
          //
          //                         enabledBorder: UnderlineInputBorder(
          //                           borderSide: BorderSide(color: Color(0xFFD9D9D9)),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 currencyNmEx!=null? _flagWidget(currencyNmEx!):Image.asset("assets/images/Nigeria.png",
          //                   scale: 2.8,
          //
          //                 )
          //               ],
          //             ),
          //             SizedBox(
          //               height:140,
          //             ),
          //             ElevatedButton(
          //               style: ElevatedButton.styleFrom(
          //                   primary: const Color(0xFF4594DD),
          //                   fixedSize: const Size(243, 50),
          //                   shape: RoundedRectangleBorder(
          //                     borderRadius:
          //                     BorderRadius.circular(15),
          //                   )),
          //               onPressed: () async {
          //                 // if (_formKey.currentState!.validate()) {
          //                 //   loginUser();
          //                 // } else {
          //                 //   print("No Data Found");
          //                 // }
          //               },
          //               child: Text("Convert",
          //                   style: GoogleFonts.quicksand(
          //                       textStyle: const TextStyle(
          //                           fontSize: 24,
          //                           fontWeight: FontWeight.bold,
          //                           color: Color(0xFFFFFFFFF)))),
          //             ),
          //
          //           ],
          //
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
  // Widget _flagWidget(Currency currency) {
  //   if (currency.flag == null) {
  //     return Container(
  //       color:Colors.lightBlue,
  //       width:100,
  //       height:100,
  //       child: Center(
  //         child: Image.asset(
  //           'assets/images/cart.png',
  //           package: 'currency_picker',
  //           width: 27,
  //         ),
  //       ),
  //     );
  //   }
  //
  //   return Text(
  //     CurrencyUtils.currencyToEmoji(currency),
  //     style: TextStyle(
  //       fontSize: 35,
  //     ),
  //   );
  // }



  // String curname="";
  // String curflag="";
  // String curnameEx="GBP";
  // String curflagEx="";
  // getcurflag() async {
  //  curname=await TierMoneyPreference().getString("curname");
  //  curflag=await TierMoneyPreference().getString("curflag");
  //  print("curName=>${curname}");
  //  print("cur=>${curflag}");
  // }
  // getcurflagEx() async {
  //  curnameEx=await TierMoneyPreference().getString("curnameEx");
  //  curflagEx=await TierMoneyPreference().getString("curflagEx");
  //  print("curName=>${curnameEx}");
  //  print("cur=>${curflagEx}");
  // }

}

