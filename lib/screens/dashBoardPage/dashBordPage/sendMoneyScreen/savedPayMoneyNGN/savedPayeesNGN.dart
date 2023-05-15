import 'package:digital_banking/screens/dashBoardPage/dashBordPage/sendMoneyScreen/savedPayMoneyNGN/viewDetailsNGN.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../controller/beneficiaryNGNController.dart';
import '../../../../../modelClass/beneficiaryModel.dart';
import '../../../../../modelClass/beneficiaryModelNGN.dart';
import '../../../../../wedget/textWedget.dart';
import '../newPayMoneyNGN/newPayeeNGN.dart';
import 'bankTransferNGN.dart';

class SavedPayeeNGN extends StatefulWidget {
  const SavedPayeeNGN({Key? key}) : super(key: key);

  @override
  State<SavedPayeeNGN> createState() => _SavedPayeeNGNState();
}

class _SavedPayeeNGNState extends State<SavedPayeeNGN> {
  final myController = Get.put(BeneficiaryNGNController());
  bool Tag = true;

  @override
  void initState() {
    super.initState();
    getData();
    
  }

  getData() {
    myController.updateData("");
  }

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
            text: "Send Money",
            size: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0,right:10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,

                        primary: Colors.blueAccent,
                        fixedSize: Size(
                            MediaQuery.of(context).size.width*0.25,
                            MediaQuery.of(context).size.height*0.055,

                        ),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                    onPressed: () async {
                      var res = await Get.to(NewPayeeNGN());
                      if (res != null) {
                        print("Hello");

                        // myController.updateData(searchController.text);
                        myController.updateData("");
                      }
                      // Get.to(NewPayeeNGN());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 20,
                        ),
                        text1(
                            size: 14,
                            color: Color(0xFFFFFFFF),
                            text: 'Pay New',
                            fontWeight: FontWeight.w600),
                      ],
                    )),
              ],
            ),
          ),

        ],
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex:0,
            child: Column(
              children: [
                Container(
                  color: Color(0xFFFFFFFF),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 13,
                    ),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            text1(
                                text: "Send money to your NGN payee",
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
                SizedBox(
                    height: 6
                ),
                Tag
                    ? Padding(
                  padding: const EdgeInsets.only(left: 45, right: 45),
                  child: Container(
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 45.0,
                            width: 180,
                            child: TextButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(18.0),
                                        // side: BorderSide(color: Colors.red)
                                      )),
                                  backgroundColor:
                                  MaterialStateProperty.all(
                                      Color(0xFFF0057FC))),

                              child: text1(
                                text: "Recent",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                size: 16,),
                              onPressed: () {
                                setState(() {
                                  Tag = true;
                                  getData();
                                });
                              },
                              // color: Colors.pink,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 45.0,
                            width: 180,
                            child: TextButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(18.0),
                                        // side: BorderSide(color: Colors.red)
                                      )),
                                  backgroundColor:
                                  MaterialStateProperty.all(
                                    Colors.grey.shade300,
                                  )),
                              child: text1(
                                text: "A - Z",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                size: 16,),
                              onPressed: () {
                                setState(() {
                                  // Tag=value;
                                  Tag = false;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                    : Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: Container(
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      // border: Border.all(
                      //     color: FlutterFlowTheme.primaryColor),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 45.0,
                            width: 180,
                            child: TextButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(18.0),
                                        // side: BorderSide(color: Colors.red)
                                      )),
                                  backgroundColor:
                                  MaterialStateProperty.all(
                                    Colors.grey.shade300,
                                  )),
                              child: text1(
                                text: "Recent",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                size: 16,),
                              onPressed: () {
                                setState(() {
                                  // Tag=value;
                                  Tag = true;
                                  getData();
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 45.0,
                            width: 180,
                            margin: EdgeInsets.only(right: 1),
                            child: TextButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(18.0),
                                        // side: BorderSide(color: Colors.red)
                                      )),
                                  backgroundColor:
                                  MaterialStateProperty.all(
                                      Color(0xFFF0057FC))),

                              child: text1(
                                text: "A - Z",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                size: 16,),
                              onPressed: () {
                                setState(() {
                                  Tag = false;
                                });
                              },
                              // color: Colors.pink,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                    height: 12
                ),
              ],
            ),
          ),
          Expanded(
            flex:15,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),

                  ),
                  // elevation: 4.0,
                  child:Obx(()=>myController.isDataProcessing.value?
                  Center(child: CircularProgressIndicator()):
                  ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                    controller: myController.scrollController,
                    itemCount: myController.myList.length,
                      itemBuilder: (BuildContext context, int index) {
                        BeneficiaryNGNModel item=myController.myList[index];

                        return Slidable(
                          endActionPane: ActionPane(
                            motion: ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (del) {},
                                backgroundColor: Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              foregroundImage:
                              AssetImage("assets/images/sample.png"),
                              backgroundColor: Colors.white,
                            ),
                            title: text1(
                                text: "${item.accountName}",
                                size: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                            trailing: Padding(
                              padding:
                              const EdgeInsets.only(top: 12.0, bottom: 12),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    elevation: 0,
                                    primary: Color(0xFFF0057FC),
                                    fixedSize: Size(80, 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                onPressed: () {
                                  Get.to(BankTransferNGN(item.accountName,item.accountNumber,item.bankName,item.referenceMessage));
                                },
                                child: text1(
                                    size: 16,
                                    color: Color(0xFFFFFFFF),
                                    text: 'Pay',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            subtitle: InkWell(
                              onTap: (){
                                Get.to(ViewDetailsNGN(item.accountName,item.accountNumber,item.bankName,item.referenceMessage,item.isCompany.toString()));

                              },
                              child:  text1(
                                  text: "View Details",
                                  size: 12,
                                  color: Color(0xFF808080),
                                  fontWeight: FontWeight.w400),
                            ),

                          ),
                        );
                      },

                  ))),
            ),
          ),
        ],
      ),
    );
  }
}
