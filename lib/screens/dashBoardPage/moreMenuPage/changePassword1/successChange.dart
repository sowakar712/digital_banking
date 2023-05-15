import 'package:digital_banking/screens/AuthPage/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../wedget/textWedget.dart';
import '../../dashBordPage/dashBoardPage.dart';
import '../../dashBordPage/pages/morePage1.dart';


class SuccessChangePassword extends StatefulWidget {
  const SuccessChangePassword({Key? key}) : super(key: key);

  @override
  State<SuccessChangePassword> createState() => _SuccessChangePasswordState();
}

class _SuccessChangePasswordState extends State<SuccessChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: EdgeInsets.only(
          left:MediaQuery.of(context).size.width*0.04,
          right:MediaQuery.of(context).size.width*0.04,            ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex:3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle,
                        color:  Color(0xFFF0057FC),
                        size: 50,
                      ),
                      SizedBox(
                          height:18
                      ),
                      text1(
                          textAlign:TextAlign.center,
                          size: 25,
                          color: Colors.black,
                          text: 'Your Password Has Been Successfuly Changed',
                          fontWeight: FontWeight.w700
                      ),
                      // SizedBox(
                      //     height:MediaQuery.of(context).size.height*0.2,
                      // ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex:4,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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

                            // Get.to(
                            //     DashBoardPage(),
                            //     duration: Duration(milliseconds: 10), //duration of transitions, default 1 sec
                            //     transition: Transition.leftToRight
                            // );

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
              ),
              Expanded(
                flex:1,
                child: Container(),
              ),
            ],
          ),
        ),
      ),


    );
  }
}
