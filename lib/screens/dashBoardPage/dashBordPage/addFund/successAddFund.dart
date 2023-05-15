import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../wedget/textWedget.dart';
import '../dashBoardPage.dart';


class SuccessAddFund extends StatefulWidget {
  const SuccessAddFund({Key? key}) : super(key: key);

  @override
  State<SuccessAddFund> createState() => _SuccessAddFundState();
}

class _SuccessAddFundState extends State<SuccessAddFund> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height/6,
              ),
              Image.asset("assets/images/addFundsSuccess.png",scale: 2),
              // SvgPicture.asset("assets/svg/addFundsSuccess.svg"),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.04,

              ),

              text1(

                  size: 28,
                  textAlign: TextAlign.center,
                  color: Color(0xFF333333),
                  text: 'Your Payment Request \nhas been Successful',
                  fontWeight: FontWeight.w700),
              SizedBox(
                height: MediaQuery.of(context).size.height/13,
              ),
              text1(

                  size: 13,
                  textAlign: TextAlign.center,
                  color: Color(0xFF222222),
                  text: 'Your money should arrive in the next 24hrs',
                  fontWeight: FontWeight.w600),
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
                    Get.to(() =>DashBoardPage());
                  },
                  child: text1(
                      size: 16,
                      color: Color(0xFFFFFFFF),
                      text: 'Go Back Home',
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}
