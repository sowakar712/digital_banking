import 'package:digital_banking/screens/dashBoardPage/dashBordPage/pages/homePage.dart';
import 'package:digital_banking/screens/dashBoardPage/dashBordPage/pages/morePage1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../modelClass/userProfileModel.dart';
import '../../../services/userDataService.dart';
import '../../../wedget/buttonNavBar.dart';
import '../qrCodeScan/qrCodeScanView.dart';
class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  PageController pageController = PageController();
  int pageIndex = 0;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenView[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80,
      width: MediaQuery
          .of(context)
          .size
          .width,
      decoration: BoxDecoration(
        // border: Border.all(width: 3, color: Color(0xFFFD9D9D9)),
        color: Colors.transparent,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          navBarButton1(
            image:  pageIndex==0?SvgPicture.asset("assets/svg/HomeIcon.svg"):SvgPicture.asset("assets/svg/HopeIconIA.svg"),
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            lable: "Home",
            color: pageIndex==0?Color(0xFF0057FC):Color(0xFF808080),

          ),
          // navBarButton1(
          //       image:  pageIndex==1?SvgPicture.asset("assets/svg/ScanIcon.svg"):SvgPicture.asset("assets/svg/ScanIconIA.svg"),
          //     lable: "Scan",
          //     color: pageIndex==1?Color(0xFF0057FC):Color(0xFF808080),
          //
          //     onPressed: () {
          //
          //       setState(() {
          //         pageIndex = 1;
          //       });
          //     }),
          navBarButton1(
              image:  pageIndex==1?SvgPicture.asset("assets/svg/moreIcon.svg"):SvgPicture.asset("assets/svg/moreIconIA.svg"),
              color: pageIndex==1?Color(0xFF0057FC):Color(0xFF808080),

              lable: "More",
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              }),
        ],
      ),
    );
  }
  User? user;
  getData(){
    getUserData().then((value) => {
      if(value !=null){
        setState((){
          user=value;
        })
      }
    });
  }
  List screenView =[
    HomePage(),
    // QrCodeScanView(),
    MorePage1(),
  ];

}
