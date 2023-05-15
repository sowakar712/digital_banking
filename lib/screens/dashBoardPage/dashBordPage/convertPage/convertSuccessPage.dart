import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../wedget/textWedget.dart';


class ConvertSuccessPage extends StatefulWidget {
  const ConvertSuccessPage({Key? key}) : super(key: key);

  @override
  State<ConvertSuccessPage> createState() => _ConvertSuccessPageState();
}

class _ConvertSuccessPageState extends State<ConvertSuccessPage> {
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
                  height: MediaQuery.of(context).size.height*0.3,

                ),
                Image.asset("assets/images/addFundsSuccess.png",scale: 2.2),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,

                ),
                text1(

                    size: 28,
                    textAlign: TextAlign.center,
                    color: Color(0xFF222222),
                    text: 'Paid',
                    fontWeight: FontWeight.w700),

                SizedBox(
                  height: MediaQuery.of(context).size.height/30,
                ),
                text1(
                    size: 12,
                    textAlign: TextAlign.center,
                    color: Color(0xFF222222),
                    text: 'Currency convertion is instantly and not reversable.',
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
                      Get.back();
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
    );

  }
}
