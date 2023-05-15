import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Components/Constant.dart';
import '../../../../../wedget/textWedget.dart';

class SuccessAddPay1 extends StatefulWidget {
  String? BName;
  SuccessAddPay1(this.BName);

  @override
  State<SuccessAddPay1> createState() => _SuccessAddPay1State();
}

class _SuccessAddPay1State extends State<SuccessAddPay1> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: ()async {
          bool? result = true;
          Get.back(result: "data");
          return result;
      },
      child: Scaffold(
          body:ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right:15.0),
                        child: ElevatedButton(

                          style: ElevatedButton.styleFrom(

                              elevation: 0,
                              primary: Color(0xFFFFFFFF),
                              fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.30,
                                MediaQuery.of(context).size.height * 0.06,
                              ),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Color(0xFFF0057FC),
                                ),
                                borderRadius: BorderRadius.circular(6),
                              )),
                          onPressed: () async {
                            onShareData(
                                text: "www.tiermoney.com/payme/x4qar1af"
                            );
                          },
                          child: Row(
                            children: [
                              Icon(
                                  Icons.share,
                                  color: Color(0xFFF0057FC),
                                  size:27
                              ),
                              text1(
                                  size: 16,
                                  color: Color(0xFFF0057FC),
                                  text: ' Share',
                                  fontWeight: FontWeight.w600),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/19,
                  ),
                  CircleAvatar(

                    radius: 35,
                    foregroundImage: AssetImage("assets/images/sample.png"),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,

                  ),

                  text1(

                      size: 16,
                      textAlign: TextAlign.center,
                      color: Color(0xFF333333),
                      text: '${widget.BName}',
                      fontWeight: FontWeight.w600),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,

                  ),

                  // text1(
                  //
                  //     size: 14,
                  //     textAlign: TextAlign.center,
                  //     color: Colors.grey.shade600,
                  //     text: 'OD011B40 . D40676',
                  //     fontWeight: FontWeight.w600),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.05,

                  ),
                  Image.asset("assets/images/addFundsSuccess.png",scale: 2.2),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,

                  ),
                  text1(

                      size: 28,
                      textAlign: TextAlign.center,
                      color: Color(0xFF222222),
                      text: 'User Added Successfully',
                      fontWeight: FontWeight.w700),

                  SizedBox(
                    height: MediaQuery.of(context).size.height/30,
                  ),
                  text1(

                      size: 12,
                      textAlign: TextAlign.center,
                      color: Color(0xFF222222),
                      text: '\t\tPayment to Uk  Banks are normally instant, but may\t\t\ntake up to 24hrs',
                      fontWeight: FontWeight.w600),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/6.5,
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


                          Get.back(result: "data");
                      },
                      child: text1(
                          size: 16,
                          color: Color(0xFFFFFFFF),
                          text: 'Done',
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          )
      ),
    );
  }
}
