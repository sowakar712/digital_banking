import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../wedget/textWedget.dart';
import '../sendMoneyScreen/savePayMoney1/bankTransfer.dart';
import 'newRequest.dart';

class RequestMoney extends StatefulWidget {
  const RequestMoney({Key? key}) : super(key: key);

  @override
  State<RequestMoney> createState() => _RequestMoneyState();
}

class _RequestMoneyState extends State<RequestMoney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x00FFFFFF),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8, 4, 8),
            child: SvgPicture.asset(
              "assets/svg/backButton.svg",
            ),
          ),
        ),
        title: text1(
            text: "Request Money",
            size: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Color(0xFFFFFFFF),
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 35,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text1(
                          text: "Create a payment request for a UK Payee",
                          size: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFFF0057FC),
                        fixedSize: Size(115, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                    onPressed: () {
                      Get.to(NewPayRequest());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.add,
                          size: 22,
                        ),
                        text1(
                            size: 16,
                            color: Color(0xFFFFFFFF),
                            text: 'Create',
                            fontWeight: FontWeight.w600),
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Container(
              height: MediaQuery.of(context).size.height / 2 + 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Color(0x1A0057FC),
                // boxShadow: const [
                //   BoxShadow(color: Colors.green, spreadRadius: 8),
                //   BoxShadow(color: Colors.yellow, spreadRadius: 5),
                // ],
              ),
              // elevation: 4.0,
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          foregroundImage:
                              AssetImage("assets/images/sample.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    title: text1(
                        text: "Karim Tud",
                        size: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        text1(
                            height: 0.3,
                            text: "£24",
                            size: 16,
                            color: Color(0xFF808080),
                            fontWeight: FontWeight.w600),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(80, 30),
                                maximumSize: Size(100, 30),
                                elevation: 0,
                                primary: Colors.green.shade50,
                                // fixedSize:  Size(78,10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {},
                            child: text1(
                                size: 16,
                                color: Color(0xFF14AE5C),
                                text: 'Paid',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                          
                    subtitle: text1(
                        text: "View Details",
                        size: 12,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400),
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          foregroundImage:
                          AssetImage("assets/images/sample.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    title: text1(
                        text: "Karim Tud",
                        size: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        text1(
                            height: 0.3,
                            text: "£24",
                            size: 16,
                            color: Color(0xFF808080),
                            fontWeight: FontWeight.w600),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(80, 30),
                                maximumSize: Size(100, 30),
                                elevation: 0,
                                primary: Colors.red.shade50,
                                // fixedSize:  Size(78,10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {},
                            child: text1(
                                size: 16,
                                color: Color(0xFFFF0C0C),
                                text: 'Delete',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    subtitle: text1(
                        text: "View Details",
                        size: 12,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400),
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          foregroundImage:
                          AssetImage("assets/images/sample.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    title: text1(
                        text: "Karim Tud",
                        size: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        text1(
                            height: 0.3,
                            text: "£24",
                            size: 16,
                            color: Color(0xFF808080),
                            fontWeight: FontWeight.w600),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(80, 30),
                                maximumSize: Size(100, 30),
                                elevation: 0,
                                primary: Colors.blue.shade50,
                                // fixedSize:  Size(78,10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {},
                            child: text1(
                                size: 16,
                                color: Color(0xFF0057FC),
                                text: 'Pending',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    subtitle: text1(
                        text: "View Details",
                        size: 12,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400),
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          foregroundImage:
                          AssetImage("assets/images/sample.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    title: text1(
                        text: "Karim Tud",
                        size: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        text1(
                            height: 0.3,
                            text: "£24",
                            size: 16,
                            color: Color(0xFF808080),
                            fontWeight: FontWeight.w600),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(80, 30),
                                maximumSize: Size(100, 30),
                                elevation: 0,
                                primary: Colors.green.shade50,
                                // fixedSize:  Size(78,10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {},
                            child: text1(
                                size: 16,
                                color: Color(0xFF14AE5C),
                                text: 'Paid',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    subtitle: text1(
                        text: "View Details",
                        size: 12,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400),
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          foregroundImage:
                          AssetImage("assets/images/sample.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    title: text1(
                        text: "Karim Tud",
                        size: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        text1(
                            height: 0.3,
                            text: "£24",
                            size: 16,
                            color: Color(0xFF808080),
                            fontWeight: FontWeight.w600),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(80, 30),
                                maximumSize: Size(100, 30),
                                elevation: 0,
                                primary: Colors.green.shade50,
                                // fixedSize:  Size(78,10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {},
                            child: text1(
                                size: 16,
                                color: Color(0xFF14AE5C),
                                text: 'Paid',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    subtitle: text1(
                        text: "View Details",
                        size: 12,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400),
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          foregroundImage:
                          AssetImage("assets/images/sample.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    title: text1(
                        text: "Karim Tud",
                        size: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        text1(
                            height: 0.3,
                            text: "£24",
                            size: 16,
                            color: Color(0xFF808080),
                            fontWeight: FontWeight.w600),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(80, 30),
                                maximumSize: Size(100, 30),
                                elevation: 0,
                                primary: Colors.green.shade50,
                                // fixedSize:  Size(78,10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {},
                            child: text1(
                                size: 16,
                                color: Color(0xFF14AE5C),
                                text: 'Paid',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    subtitle: text1(
                        text: "View Details",
                        size: 12,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400),
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          foregroundImage:
                          AssetImage("assets/images/sample.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    title: text1(
                        text: "Karim Tud",
                        size: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        text1(
                            height: 0.3,
                            text: "£24",
                            size: 16,
                            color: Color(0xFF808080),
                            fontWeight: FontWeight.w600),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(80, 30),
                                maximumSize: Size(100, 30),
                                elevation: 0,
                                primary: Colors.green.shade50,
                                // fixedSize:  Size(78,10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {},
                            child: text1(
                                size: 16,
                                color: Color(0xFF14AE5C),
                                text: 'Paid',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    subtitle: text1(
                        text: "View Details",
                        size: 12,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400),
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          foregroundImage:
                          AssetImage("assets/images/sample.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    title: text1(
                        text: "Karim Tud",
                        size: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        text1(
                            height: 0.3,
                            text: "£24",
                            size: 16,
                            color: Color(0xFF808080),
                            fontWeight: FontWeight.w600),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(80, 30),
                                maximumSize: Size(100, 30),
                                elevation: 0,
                                primary: Colors.green.shade50,
                                // fixedSize:  Size(78,10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {},
                            child: text1(
                                size: 16,
                                color: Color(0xFF14AE5C),
                                text: 'Paid',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    subtitle: text1(
                        text: "View Details",
                        size: 12,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400),
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          foregroundImage:
                          AssetImage("assets/images/sample.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    title: text1(
                        text: "Karim Tud",
                        size: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        text1(
                            height: 0.3,
                            text: "£24",
                            size: 16,
                            color: Color(0xFF808080),
                            fontWeight: FontWeight.w600),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(80, 30),
                                maximumSize: Size(100, 30),
                                elevation: 0,
                                primary: Colors.green.shade50,
                                // fixedSize:  Size(78,10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {},
                            child: text1(
                                size: 16,
                                color: Color(0xFF14AE5C),
                                text: 'Paid',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    subtitle: text1(
                        text: "View Details",
                        size: 12,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400),
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          foregroundImage:
                          AssetImage("assets/images/sample.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    title: text1(
                        text: "Karim Tud",
                        size: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        text1(
                            height: 0.3,
                            text: "£24",
                            size: 16,
                            color: Color(0xFF808080),
                            fontWeight: FontWeight.w600),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(80, 30),
                                maximumSize: Size(100, 30),
                                elevation: 0,
                                primary: Colors.green.shade50,
                                // fixedSize:  Size(78,10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {},
                            child: text1(
                                size: 16,
                                color: Color(0xFF14AE5C),
                                text: 'Paid',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    subtitle: text1(
                        text: "View Details",
                        size: 12,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400),
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          foregroundImage:
                          AssetImage("assets/images/sample.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    title: text1(
                        text: "Karim Tud",
                        size: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        text1(
                            height: 0.3,
                            text: "£24",
                            size: 16,
                            color: Color(0xFF808080),
                            fontWeight: FontWeight.w600),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(80, 30),
                                maximumSize: Size(100, 30),
                                elevation: 0,
                                primary: Colors.green.shade50,
                                // fixedSize:  Size(78,10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {},
                            child: text1(
                                size: 16,
                                color: Color(0xFF14AE5C),
                                text: 'Paid',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    subtitle: text1(
                        text: "View Details",
                        size: 12,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400),
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          foregroundImage:
                          AssetImage("assets/images/sample.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    title: text1(
                        text: "Karim Tud",
                        size: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        text1(
                            height: 0.3,
                            text: "£24",
                            size: 16,
                            color: Color(0xFF808080),
                            fontWeight: FontWeight.w600),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(80, 30),
                                maximumSize: Size(100, 30),
                                elevation: 0,
                                primary: Colors.green.shade50,
                                // fixedSize:  Size(78,10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {},
                            child: text1(
                                size: 16,
                                color: Color(0xFF14AE5C),
                                text: 'Paid',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    subtitle: text1(
                        text: "View Details",
                        size: 12,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400),
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          foregroundImage:
                          AssetImage("assets/images/sample.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    title: text1(
                        text: "Karim Tud",
                        size: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        text1(
                            height: 0.3,
                            text: "£24",
                            size: 16,
                            color: Color(0xFF808080),
                            fontWeight: FontWeight.w600),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(80, 30),
                                maximumSize: Size(100, 30),
                                elevation: 0,
                                primary: Colors.green.shade50,
                                // fixedSize:  Size(78,10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {},
                            child: text1(
                                size: 16,
                                color: Color(0xFF14AE5C),
                                text: 'Paid',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    subtitle: text1(
                        text: "View Details",
                        size: 12,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400),
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          foregroundImage:
                          AssetImage("assets/images/sample.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    title: text1(
                        text: "Karim Tud",
                        size: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        text1(
                            height: 0.3,
                            text: "£24",
                            size: 16,
                            color: Color(0xFF808080),
                            fontWeight: FontWeight.w600),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(80, 30),
                                maximumSize: Size(100, 30),
                                elevation: 0,
                                primary: Colors.green.shade50,
                                // fixedSize:  Size(78,10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {},
                            child: text1(
                                size: 16,
                                color: Color(0xFF14AE5C),
                                text: 'Paid',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    subtitle: text1(
                        text: "View Details",
                        size: 12,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400),
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          foregroundImage:
                          AssetImage("assets/images/sample.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    title: text1(
                        text: "Karim Tud",
                        size: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        text1(
                            height: 0.3,
                            text: "£24",
                            size: 16,
                            color: Color(0xFF808080),
                            fontWeight: FontWeight.w600),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(80, 30),
                                maximumSize: Size(100, 30),
                                elevation: 0,
                                primary: Colors.green.shade50,
                                // fixedSize:  Size(78,10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {},
                            child: text1(
                                size: 16,
                                color: Color(0xFF14AE5C),
                                text: 'Paid',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    subtitle: text1(
                        text: "View Details",
                        size: 12,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400),
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          foregroundImage:
                          AssetImage("assets/images/sample.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    title: text1(
                        text: "Karim Tud",
                        size: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        text1(
                            height: 0.3,
                            text: "£24",
                            size: 16,
                            color: Color(0xFF808080),
                            fontWeight: FontWeight.w600),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(80, 30),
                                maximumSize: Size(100, 30),
                                elevation: 0,
                                primary: Colors.green.shade50,
                                // fixedSize:  Size(78,10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {},
                            child: text1(
                                size: 16,
                                color: Color(0xFF14AE5C),
                                text: 'Paid',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    subtitle: text1(
                        text: "View Details",
                        size: 12,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400),
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          foregroundImage:
                          AssetImage("assets/images/sample.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    title: text1(
                        text: "Karim Tud",
                        size: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        text1(
                            height: 0.3,
                            text: "£24",
                            size: 16,
                            color: Color(0xFF808080),
                            fontWeight: FontWeight.w600),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(80, 30),
                                maximumSize: Size(100, 30),
                                elevation: 0,
                                primary: Colors.green.shade50,
                                // fixedSize:  Size(78,10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {},
                            child: text1(
                                size: 16,
                                color: Color(0xFF14AE5C),
                                text: 'Paid',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    subtitle: text1(
                        text: "View Details",
                        size: 12,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400),
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          foregroundImage:
                          AssetImage("assets/images/sample.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    title: text1(
                        text: "Karim Tud",
                        size: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        text1(
                            height: 0.3,
                            text: "£24",
                            size: 16,
                            color: Color(0xFF808080),
                            fontWeight: FontWeight.w600),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(80, 30),
                                maximumSize: Size(100, 30),
                                elevation: 0,
                                primary: Colors.green.shade50,
                                // fixedSize:  Size(78,10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {},
                            child: text1(
                                size: 16,
                                color: Color(0xFF14AE5C),
                                text: 'Paid',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    subtitle: text1(
                        text: "View Details",
                        size: 12,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400),
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          foregroundImage:
                          AssetImage("assets/images/sample.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    title: text1(
                        text: "Karim Tud",
                        size: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        text1(
                            height: 0.3,
                            text: "£24",
                            size: 16,
                            color: Color(0xFF808080),
                            fontWeight: FontWeight.w600),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(80, 30),
                                maximumSize: Size(100, 30),
                                elevation: 0,
                                primary: Colors.green.shade50,
                                // fixedSize:  Size(78,10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {},
                            child: text1(
                                size: 16,
                                color: Color(0xFF14AE5C),
                                text: 'Paid',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    subtitle: text1(
                        text: "View Details",
                        size: 12,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400),
                  ),


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
