import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../wedget/textWedget.dart';
import '../AuthPage/Login/login.dart';
import 'introScreen2.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  final PageController pageController = PageController(initialPage: 0);
  bool isLastPage = false;
  int pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Color(0x00FFFFFF).withOpacity(.1),
          automaticallyImplyLeading: true,
          actions: <Widget>[
            TextButton(
                onPressed: () async {
                  SharedPreferences share =
                  await SharedPreferences.getInstance();
                  await share.setBool('introScreen', true);
                  Get.offAll(const Login());
                },
                child: Row(
                  children: [
                    text1(
                        size: 18,
                        color: Color(0xFF000000),
                        text: 'Skip',
                        fontWeight: FontWeight.w500),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ),
                      onPressed: () async {
                        SharedPreferences share =
                            await SharedPreferences.getInstance();
                        await share.setBool('introScreen', true);
                        Get.offAll(const Login());

                      },
                    ),
                  ],
                )),
            //IconButton
            // IconButton(
            //   icon: const Icon(Icons.settings),
            //   tooltip: 'Setting Icon',
            //   onPressed: () {},
            // ), //IconButton
          ],
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 50.0, right: 50.0, bottom: 8.0, top: 65.0),
              child: Image(
                image: AssetImage(
                  "assets/images/board2.png",
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
                text: 'Pay and Get Paid Faster',
                fontWeight: FontWeight.w600),
            SizedBox(height: 23),
            text1(
                textAlign: TextAlign.center,
                size: 16,
                color: Color(0xFF222222),
                text: 'Easy payment and transaction of funds',
                fontWeight: FontWeight.w400),
          ],
        ),
        floatingActionButton: FloatingButton());
  }

  Widget introPageOne() {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 50.0, right: 50.0, bottom: 8.0, top: 65.0),
          child: Image(
            image: AssetImage(
              "assets/images/board1.png",
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
            text: 'Go Borderless with our Digital\nIBAN Account',
            fontWeight: FontWeight.w600),
        SizedBox(height: 23),
        text1(
            textAlign: TextAlign.center,
            size: 16,
            color: Color(0xFF222222),
            text: 'Registered now and enjoy your money',
            fontWeight: FontWeight.w400),
      ],
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
                color: Color(0xFF0057FC),
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
            ],
          ),
          InkWell(
            onTap: () {
                Get.to(IntroPage2(),
                    duration: Duration(milliseconds: 20), //duration of transitions, default 1 sec
                    transition: Transition.leftToRight
                );
            },
            child: Image(
              image: AssetImage(
                "assets/images/forward.png",
              ),
              height: 38,
              // width:MediaQuery.of(context).size.width*0.1,
            ),
          ),
        ],
      ),
    );
  }
}