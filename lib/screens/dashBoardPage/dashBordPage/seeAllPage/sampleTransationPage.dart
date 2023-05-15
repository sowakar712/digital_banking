import 'package:digital_banking/screens/dashBoardPage/dashBordPage/seeAllPage/seeAllPage.dart';
import 'package:flutter/material.dart';

import '../../../../wedget/textWedget.dart';
import 'package:get/get.dart';

class SimpleTransactionPage extends StatefulWidget {
  const SimpleTransactionPage({Key? key}) : super(key: key);

  @override
  State<SimpleTransactionPage> createState() => _SimpleTransactionPageState();
}

class _SimpleTransactionPageState extends State<SimpleTransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 30),
            width: MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius : BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow : [
                BoxShadow(
                  color: Color.fromRGBO(0, 87, 252, 1),
                  offset: Offset(0,-8),
                  blurRadius: 26
              )
              ],
              color : Color.fromRGBO(255, 255, 255, 1),
            ),
          child: ListView(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*.1,),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                       Get.off(SeeAllPage());
                      },
                      icon: const Icon(Icons.arrow_circle_left_outlined,color: Colors.black,size: 25,)
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height*0.5,
                  decoration: BoxDecoration(
                    borderRadius : BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    border : Border.all(
                      color: Color.fromRGBO(0, 87, 252, 1),
                      width: 4,
                    ),
                  ),
                child: Column(
                  children: [
                    ListTile(
                       leading:text(
                         text: "Amount",
                         size: 14,
                         fontWeight: FontWeight.bold,
                         color: Colors.grey
                       ),
                      trailing: text(
                          text:"£ 3,000.00",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        size: 12,
                      ),
                    ),
                    Divider(
                      indent: 15,
                      endIndent: 15,
                      height: 2,
                      color: const Color(0xFFF4594DD),
                      thickness: 2,
                    ),
                    ListTile(
                      leading:text(
                          text: "Reference",
                          size: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),
                      trailing: text(
                        text:"fee",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        size: 12,
                      ),
                    ),
                    Divider(
                      indent: 15,
                      endIndent: 15,
                      height: 2,
                      color: const Color(0xFFF4594DD),
                      thickness: 2,
                    ),
                    ListTile(
                      leading:text(
                          text: "Created",
                          size: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),
                      trailing: text(
                        text:"13 January 2022  10:30am",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        size: 12,
                      ),
                    ),
                    Divider(
                      indent: 15,
                      endIndent: 15,
                      height: 2,
                      color: const Color(0xFFF4594DD),
                      thickness: 2,
                    ),
                    ListTile(
                      leading:text(
                          text: "Category",
                          size: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),
                      trailing: text(
                        text:"Professional Services",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        size: 12,
                      ),
                    ),
                    Divider(
                      indent: 15,
                      endIndent: 15,
                      height: 2,
                      color: const Color(0xFFF4594DD),
                      thickness: 2,
                    ),
                    ListTile(
                      leading:text(
                          text: "Status",
                          size: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),
                      trailing: text(
                        text:"Pending",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        size: 12,
                      ),
                    ),
                    Divider(
                      indent: 15,
                      endIndent: 15,
                      height: 2,
                      color: const Color(0xFFF4594DD),
                      thickness: 2,
                    ),
                    ListTile(
                      leading:text(
                          text: "Type",
                          size: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),
                      trailing: text(
                        text:"Outgoing",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        size: 12,
                      ),
                    ),
                    Divider(
                      indent: 15,
                      endIndent: 15,
                      height: 2,
                      color: const Color(0xFFF4594DD),
                      thickness: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
