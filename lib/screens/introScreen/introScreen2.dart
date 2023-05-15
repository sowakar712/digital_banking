import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../wedget/textWedget.dart';
import '../AuthPage/Login/login.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  State<IntroPage2> createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> {
  final PageController pageController = PageController(initialPage: 0);
  bool isLastPage = false;
  int pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 50.0, right: 50.0, bottom: 8.0, top: 65.0),
              child: Image(
                image: AssetImage(
                  "assets/images/board3.png",
                ),
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.7,
              ),
            ),
            SizedBox(height: 38),
            text1(
                textAlign: TextAlign.center,
                size: 20,
                color: Color(0xFF222222),
                text: 'Data Security',
                fontWeight: FontWeight.w600),
            SizedBox(height: 23),
            text1(
                textAlign: TextAlign.center,
                size: 16,
                color: Color(0xFF222222),
                text: 'Secure of personal information and data\nagainst theft',
                fontWeight: FontWeight.w400),
          ],
        ),
        floatingActionButton: FloatingButton()
    );
  }

  Widget FloatingButton() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 40.0, right: 12.0, bottom: 20.0, top: 65.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Color(0xFFB2B0B4),
                size: 9,
              ),
              SizedBox(
                width: 6,
              ),
              Icon(
                Icons.circle,
                color: Color(0xFFB2B0B4),
                size: 9,
              ),
              SizedBox(
                width: 6,
              ),
              Icon(
                Icons.circle,
                color: Color(0xFF0057FC),
                size: 9,
              ),
            ],
          ),
          ElevatedButton(

              style: ElevatedButton.styleFrom(
                  primary:  Color(0xFFF0057FC),
                  fixedSize:  Size(120,42),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  )
              ),
              onPressed: () async {
                SharedPreferences share =
                    await SharedPreferences.getInstance();
                await share.setBool('introScreen', true);
                  Get.offAll(Login(),
                      duration: Duration(milliseconds: 20), //duration of transitions, default 1 sec
                      transition: Transition.leftToRight
                  );

              },

              child:  text1(
                  size: 16,
                  color: Color(0xFFFFFFFF),
                  text: 'Get Started',
                  fontWeight: FontWeight.w600
              )
          ),

        ],
      ),
    );
  }
}