import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../wedget/textWedget.dart';
import '../Login/login.dart';

class SignUpSuccess extends StatefulWidget {
  const SignUpSuccess({Key? key}) : super(key: key);

  @override
  State<SignUpSuccess> createState() => _SignUpSuccessState();
}

class _SignUpSuccessState extends State<SignUpSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height/4,
              ),
              SvgPicture.asset("assets/svg/success.svg"),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,

              ),

              text1(

                  size: 28,
                  textAlign: TextAlign.center,
                  color: Color(0xFF333333),
                  text: 'Thank you, Your\n application is received\n and now under review.',
                  fontWeight: FontWeight.w700),
              SizedBox(
                height: MediaQuery.of(context).size.height/3.5,
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
                    Get.to(() =>Login());
                  },
                  child: text1(
                      size: 16,
                      color: Color(0xFFFFFFFF),
                      text: 'Login',
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      )
    );
  }
}
