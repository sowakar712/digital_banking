import 'dart:io';

import 'package:digital_banking/wedget/textWedget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../controller/ukBankController.dart';
import '../../../../modelClass/ukBankModel.dart';
import '../../../../services/userDataService.dart';
import 'addMoney.dart';

class AddFund extends StatefulWidget {
  const AddFund({Key? key}) : super(key: key);

  @override
  State<AddFund> createState() => _AddFundState();
}

class _AddFundState extends State<AddFund> {
  final myController = Get.put(UkBankController());
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE5E5E5),
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
          text: "Add Fund",
          size: 20,
          color: Colors.black,
          fontWeight: FontWeight.w600
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFE5E5E5),
      body: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: Column(

          children: [
            Expanded(
              flex:0,
              child: Container(
                color:Color(0xFFE5E5E5),
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: Column(
                        children: [
                      text1(
                          text: "Select the bank to transfer money from",
                          size: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                      ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex:15,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(13,0,13,0),
                child: Container(
                    height: MediaQuery.of(context).size.height *0.58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: Color(0x1A0057FC),
                      // boxShadow: const [
                      //   BoxShadow(color: Colors.green, spreadRadius: 8),
                      //   BoxShadow(color: Colors.yellow, spreadRadius: 5),
                      // ],
                    ),
                    // elevation: 4.0,
                    child: Obx(() => myController.isDataProcessing.value?
                    Center(child: CircularProgressIndicator()):ListView.builder(
                      controller: myController.scrollController,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: myController.myList.length,

                      itemBuilder: (BuildContext context, int index) {
                        UkModel item=myController.myList[index];
                        return Column(
                          children: [
                            InkWell(
                              onTap: (){
                                depositMoney();
                              },
                              child: ListTile(
                                tileColor: Color(0xFFFFFFFF),
                                leading: CircleAvatar(

                                  radius: 25,
                                  foregroundImage: AssetImage("assets/images/bos.png"),
                                  backgroundColor: Colors.white,
                                ),
                                title: text1(
                                    text: "${item.name}",
                                    size: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600
                                ),
                                trailing:Icon(Icons.arrow_forward_ios_outlined,
                                  size: 25,
                                ),


                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      },
                    ))),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
