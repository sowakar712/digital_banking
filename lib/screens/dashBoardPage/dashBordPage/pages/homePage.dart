import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Components/Constant.dart';
import '../../../../modelClass/userProfileModel.dart';
import '../../../../services/userDataService.dart';
import '../../../../wedget/textWedget.dart';
import '../../moreMenuPage/personalDetails/personalInformation.dart';
import '../accountViewPage/accounPageNGN.dart';
import '../accountViewPage/newAccountPage.dart';
import '../requestAccount/requestAccount.dart';
import '../seeAllPage/seeAllPage.dart';
import '../sendMoneyScreen/savePayMoney1/savedPayees.dart';
import '../sendMoneyScreen/savedPayMoneyNGN/savedPayeesNGN.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController buttonCarouselController = CarouselController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Expanded(
                        flex: 0,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8.0, top: 15),
                              child: ListTile(
                                leading: InkWell(
                                  onTap: () {
                                    Get.to(PersonalInformation());
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage("assets/screen/profile.png"),
                                  ),
                                ),
                                title: text1(
                                  color: Color(0xFF16161D),
                                  size: 15,
                                  fontWeight: FontWeight.w700,
                                  text: 'Hi, ${user?.firstName ?? ""}',
                                ),
                                // trailing: Image.asset( "assets/screen/notfication.png"),
                              ),
                            ),
                            user?.content.accountInfo.length != 0
                                ? Container(
                                    height: MediaQuery.of(context).size.height *0.22,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),

                                        itemCount:
                                            user?.content.accountInfo.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          AccountInfo? item =
                                              user!.content.accountInfo[index];

                                          if (user!
                                                  .content.accountInfo.length ==
                                              1)
                                            return Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    {
                                                      item.account == "GBP"
                                                          ? Get.to(AccountPageNew(
                                                              item
                                                                  ?.accountTitle,
                                                              item
                                                                  ?.accountNumber,
                                                              item?.account,
                                                              item?.sortCode))
                                                          : Get.to(AccountPageNGN(
                                                              item?.accountName,
                                                              item?.accountNumber,
                                                              item?.account,
                                                              item?.bankName));
                                                    }
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    child: Card(
                                                      shape: OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      elevation: 3,
                                                      shadowColor: Colors.grey,
                                                      // color: Color(0xFF0057FC),
                                                      color: Colors.black,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    text1(
                                                                        color: Color(
                                                                            0xFFFFFFFF),
                                                                        size:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        text:
                                                                            'Balance'),
                                                                    text1(
                                                                        color: Color(
                                                                            0xFFFFFFFF),
                                                                        size:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        text: item.account ==
                                                                                "GBP"
                                                                            ? "£${item.balance}"
                                                                            : "${item.walletAmount}"),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    text1(
                                                                        color: Color(
                                                                            0xFFFFFFFF),
                                                                        size:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        text:
                                                                            'Account'),
                                                                    text1(
                                                                        color: Color(
                                                                            0xFFFFFFFF),
                                                                        size:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        text:
                                                                            "${item!.accountNumber}"),
                                                                    text1(
                                                                        color: Color(
                                                                            0xFFFFFFFF),
                                                                        size:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        text: item.account ==
                                                                                "GBP"
                                                                            ? "${item.sortCode}"
                                                                            : "${item.bankName}"),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                // InkWell(
                                                                //   onTap: () {
                                                                //     Get.to(
                                                                //         AddFund(),
                                                                //         duration: Duration(
                                                                //             milliseconds:
                                                                //                 500),
                                                                //         transition:
                                                                //             Transition.rightToLeft);
                                                                //   },
                                                                //   child: Column(
                                                                //     children: [
                                                                //       SvgPicture.asset(
                                                                //           "assets/svg/add.svg",
                                                                //           height:
                                                                //               25,
                                                                //           width:
                                                                //               25),
                                                                //       text1(
                                                                //           color: Color(
                                                                //               0xFFFFFFFF),
                                                                //           size:
                                                                //               12,
                                                                //           fontWeight: FontWeight
                                                                //               .w500,
                                                                //           text:
                                                                //               "Add Fund"),
                                                                //     ],
                                                                //   ),
                                                                // ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    Constant.acbalanceUK =
                                                                        item.balance;
                                                                    Constant.acbalanceNGN = item
                                                                        .walletAmount
                                                                        .toString();
                                                                    // Get.to(
                                                                    //     SavedPayeeNGN(),
                                                                    //     duration: Duration(
                                                                    //         milliseconds:
                                                                    //         0),
                                                                    //     transition:
                                                                    //     Transition
                                                                    //         .rightToLeft);

                                                                    print(item
                                                                        ?.currencyCode);
                                                                    if (item?.currencyCode ==
                                                                        "GBP") {
                                                                      Get.to(
                                                                          SavedPayee(),
                                                                          duration: Duration(
                                                                              milliseconds:
                                                                                  0),
                                                                          transition:
                                                                              Transition.rightToLeft);
                                                                    } else {
                                                                      Get.to(
                                                                          SavedPayeeNGN(),
                                                                          duration: Duration(
                                                                              milliseconds:
                                                                                  0),
                                                                          transition:
                                                                              Transition.rightToLeft);
                                                                    }
                                                                  },
                                                                  child: Column(
                                                                    children: [
                                                                      SvgPicture.asset(
                                                                          "assets/svg/sendMoney.svg",
                                                                          height:
                                                                              25,
                                                                          width:
                                                                              25),
                                                                      Wrap(
                                                                        children: [
                                                                          text1(
                                                                              color: Color(0xFFFFFFFF),
                                                                              size: 12,
                                                                              fontWeight: FontWeight.w500,
                                                                              text: "Send Money"),
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                // InkWell(
                                                                //   child: Column(
                                                                //     children: [
                                                                //       SvgPicture.asset(
                                                                //           "assets/svg/requestMoney.svg",
                                                                //           height:
                                                                //               20,
                                                                //           width:
                                                                //               10),
                                                                //       SizedBox(
                                                                //         height:
                                                                //             5,
                                                                //       ),
                                                                //       text1(
                                                                //           color: Color(
                                                                //               0xFFFFFFFF),
                                                                //           size:
                                                                //               12,
                                                                //           fontWeight: FontWeight
                                                                //               .w500,
                                                                //           text:
                                                                //               "Request Money"),
                                                                //     ],
                                                                //   ),
                                                                //   onTap: () {
                                                                //     Get.to(
                                                                //         RequestMoney(),
                                                                //         duration: Duration(
                                                                //             milliseconds:
                                                                //                 500),
                                                                //         transition:
                                                                //             Transition.rightToLeft);
                                                                //   },
                                                                // ),
                                                                // InkWell(
                                                                //   onTap: () {
                                                                //     Get.to(
                                                                //         ConvertPage());
                                                                //   },
                                                                //   child: Column(
                                                                //     children: [
                                                                //       SvgPicture.asset(
                                                                //           "assets/svg/convert.svg",
                                                                //           height:
                                                                //               25,
                                                                //           width:
                                                                //               25),
                                                                //       text1(
                                                                //           color: Color(
                                                                //               0xFFFFFFFF),
                                                                //           size:
                                                                //               12,
                                                                //           fontWeight: FontWeight
                                                                //               .w500,
                                                                //           text:
                                                                //               "Convert"),
                                                                //     ],
                                                                //   ),
                                                                // ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.to(
                                                        RequestAccount(),
                                                        duration: Duration(
                                                            milliseconds:
                                                            500),
                                                        transition:
                                                        Transition.rightToLeft);
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.9,
                                                    child: Card(
                                                      shape: OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                      ),
                                                      elevation: 3,
                                                      shadowColor: Colors.grey,
                                                      color: Color(0xFF000000),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                10.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 15.0,
                                                                      bottom: 15),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                        Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      SvgPicture.asset(
                                                                          "assets/svg/add.svg",
                                                                          height:
                                                                              25,
                                                                          width:
                                                                              25),
                                                                      text1(
                                                                          color: Color(
                                                                              0xFFFFFFFF),
                                                                          size:
                                                                              14,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          text:
                                                                              "Need More Account?\nRequest It Now"),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          else if (index ==0) //More than 1 account
                                            return Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    item.account == "GBP"
                                                        ? Get.to(AccountPageNew(
                                                            item?.accountTitle,
                                                            item?.accountNumber,
                                                            item?.account,
                                                            item?.sortCode))
                                                        : Get.to(AccountPageNGN(
                                                            item?.accountName,
                                                            item?.accountNumber,
                                                            item?.account,
                                                            item?.bankName));
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    child: Card(
                                                      shape: OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      elevation: 3,
                                                      shadowColor: Colors.grey,
                                                      color: Color(0xFF0057FC),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    text1(
                                                                        color: Color(
                                                                            0xFFFFFFFF),
                                                                        size:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        text:
                                                                            'Balance'),
                                                                    text1(
                                                                        color: Color(
                                                                            0xFFFFFFFF),
                                                                        size:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        text: item.account ==
                                                                                "GBP"
                                                                            ? "£${item.balance}"
                                                                            : "${item.walletAmount}"),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    text1(
                                                                        color: Color(
                                                                            0xFFFFFFFF),
                                                                        size:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        text:
                                                                            'Account'),
                                                                    text1(
                                                                        color: Color(
                                                                            0xFFFFFFFF),
                                                                        size:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        text:
                                                                            "${item!.accountNumber}"),
                                                                    text1(
                                                                        color: Color(
                                                                            0xFFFFFFFF),
                                                                        size:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        text: item.account ==
                                                                                "GBP"
                                                                            ? "${item.sortCode}"
                                                                            : "${item.bankName}"),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                // InkWell(
                                                                //   onTap: () {
                                                                //     Get.to(
                                                                //         AddFund(),
                                                                //         duration: Duration(
                                                                //             milliseconds:
                                                                //                 500),
                                                                //         transition:
                                                                //             Transition.rightToLeft);
                                                                //   },
                                                                //   child: Column(
                                                                //     children: [
                                                                //       SvgPicture.asset(
                                                                //           "assets/svg/add.svg",
                                                                //           height:
                                                                //               25,
                                                                //           width:
                                                                //               25),
                                                                //       text1(
                                                                //           color: Color(
                                                                //               0xFFFFFFFF),
                                                                //           size:
                                                                //               12,
                                                                //           fontWeight: FontWeight
                                                                //               .w500,
                                                                //           text:
                                                                //               "Add Fund"),
                                                                //     ],
                                                                //   ),
                                                                // ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    Constant.acbalanceUK =
                                                                        item.balance;
                                                                    Constant.acbalanceNGN = item
                                                                        .walletAmount
                                                                        .toString();

                                                                    print(item
                                                                        ?.currencyCode);
                                                                    if (item?.currencyCode ==
                                                                        "GBP") {
                                                                      Get.to(
                                                                          SavedPayee(),
                                                                          duration: Duration(
                                                                              milliseconds:
                                                                                  0),
                                                                          transition:
                                                                              Transition.rightToLeft);
                                                                    } else {
                                                                      Get.to(
                                                                          SavedPayeeNGN(),
                                                                          duration: Duration(
                                                                              milliseconds:
                                                                                  0),
                                                                          transition:
                                                                              Transition.rightToLeft);
                                                                    }
                                                                  },
                                                                  child: Column(
                                                                    children: [
                                                                      SvgPicture.asset(
                                                                          "assets/svg/sendMoney.svg",
                                                                          height:
                                                                              28,
                                                                          width:
                                                                              25),
                                                                      Wrap(
                                                                        children: [
                                                                          text1(
                                                                              color: Color(0xFFFFFFFF),
                                                                              size: 12,
                                                                              fontWeight: FontWeight.w500,
                                                                              text: "Send Money"),
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                // InkWell(
                                                                //   child: Column(
                                                                //     children: [
                                                                //       SvgPicture.asset(
                                                                //           "assets/svg/requestMoney.svg",
                                                                //           height:
                                                                //               22,
                                                                //           width:
                                                                //               22),
                                                                //       SizedBox(
                                                                //         height:
                                                                //             5,
                                                                //       ),
                                                                //       text1(
                                                                //           color: Color(
                                                                //               0xFFFFFFFF),
                                                                //           size:
                                                                //               12,
                                                                //           fontWeight: FontWeight
                                                                //               .w500,
                                                                //           text:
                                                                //               "Request Money"),
                                                                //     ],
                                                                //   ),
                                                                //   onTap: () {
                                                                //     Get.to(
                                                                //         RequestMoney(),
                                                                //         duration: Duration(
                                                                //             milliseconds:
                                                                //                 500),
                                                                //         transition:
                                                                //             Transition.rightToLeft);
                                                                //   },
                                                                // ),
                                                                // InkWell(
                                                                //   onTap: () {
                                                                //     Get.to(
                                                                //         ConvertPage());
                                                                //   },
                                                                //   child: Column(
                                                                //     children: [
                                                                //       SvgPicture.asset(
                                                                //           "assets/svg/convert.svg",
                                                                //           height:
                                                                //               25,
                                                                //           width:
                                                                //               25),
                                                                //       text1(
                                                                //           color: Color(
                                                                //               0xFFFFFFFF),
                                                                //           size:
                                                                //               12,
                                                                //           fontWeight: FontWeight
                                                                //               .w500,
                                                                //           text:
                                                                //               "Convert"),
                                                                //     ],
                                                                //   ),
                                                                // ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          else if (index ==user!.content.accountInfo.length -1)
                                            return Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    item.account == "GBP"
                                                        ? Get.to(AccountPageNew(
                                                            item?.accountTitle,
                                                            item?.accountNumber,
                                                            item?.account,
                                                            item?.sortCode))
                                                        : Get.to(AccountPageNGN(
                                                            item?.accountName,
                                                            item?.accountNumber,
                                                            item?.account,
                                                            item?.bankName));
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    child: Card(
                                                      shape: OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      elevation: 3,
                                                      shadowColor: Colors.grey,
                                                      color: Color(0xFF0057FC),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    text1(
                                                                        color: Color(
                                                                            0xFFFFFFFF),
                                                                        size:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        text:
                                                                            'Balance'),
                                                                    text1(
                                                                        color: Color(
                                                                            0xFFFFFFFF),
                                                                        size:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        text: item.account ==
                                                                                "GBP"
                                                                            ? "£${item.balance}"
                                                                            : "${item.walletAmount}"),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    text1(
                                                                        color: Color(
                                                                            0xFFFFFFFF),
                                                                        size:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        text:
                                                                            'Account'),
                                                                    text1(
                                                                        color: Color(
                                                                            0xFFFFFFFF),
                                                                        size:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        text:
                                                                            "${item!.accountNumber}"),
                                                                    text1(
                                                                        color: Color(
                                                                            0xFFFFFFFF),
                                                                        size:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        text: item.account ==
                                                                                "GBP"
                                                                            ? "${item.sortCode}"
                                                                            : "${item.bankName}"),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                // InkWell(
                                                                //   onTap: () {
                                                                //     Get.to(
                                                                //         AddFund(),
                                                                //         duration: Duration(
                                                                //             milliseconds:
                                                                //                 500),
                                                                //         transition:
                                                                //             Transition.rightToLeft);
                                                                //   },
                                                                //   child: Column(
                                                                //     children: [
                                                                //       SvgPicture.asset(
                                                                //           "assets/svg/add.svg",
                                                                //           height:
                                                                //               25,
                                                                //           width:
                                                                //               25),
                                                                //       text1(
                                                                //           color: Color(
                                                                //               0xFFFFFFFF),
                                                                //           size:
                                                                //               12,
                                                                //           fontWeight: FontWeight
                                                                //               .w500,
                                                                //           text:
                                                                //               "Add Fund"),
                                                                //     ],
                                                                //   ),
                                                                // ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    Constant.acbalanceUK =
                                                                        item.balance;
                                                                    Constant.acbalanceNGN = item
                                                                        .walletAmount
                                                                        .toString();
                                                                    print(item
                                                                        ?.currencyCode);
                                                                    if (item?.currencyCode ==
                                                                        "GBP") {
                                                                      Get.to(
                                                                          SavedPayee(),
                                                                          duration: Duration(
                                                                              milliseconds:
                                                                                  0),
                                                                          transition:
                                                                              Transition.rightToLeft);
                                                                    } else {
                                                                      Get.to(
                                                                          SavedPayeeNGN(),
                                                                          duration: Duration(
                                                                              milliseconds:
                                                                                  0),
                                                                          transition:
                                                                              Transition.rightToLeft);
                                                                    }
                                                                  },
                                                                  child: Column(
                                                                    children: [
                                                                      SvgPicture.asset(
                                                                          "assets/svg/sendMoney.svg",
                                                                          height:
                                                                              28,
                                                                          width:
                                                                              25),
                                                                      Wrap(
                                                                        children: [
                                                                          text1(
                                                                              color: Color(0xFFFFFFFF),
                                                                              size: 12,
                                                                              fontWeight: FontWeight.w500,
                                                                              text: "Send Money"),
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                // InkWell(
                                                                //   child: Column(
                                                                //     children: [
                                                                //       SvgPicture.asset(
                                                                //           "assets/svg/requestMoney.svg",
                                                                //           height:
                                                                //               22,
                                                                //           width:
                                                                //               22),
                                                                //       SizedBox(
                                                                //         height:
                                                                //             5,
                                                                //       ),
                                                                //       text1(
                                                                //           color: Color(
                                                                //               0xFFFFFFFF),
                                                                //           size:
                                                                //               12,
                                                                //           fontWeight: FontWeight
                                                                //               .w500,
                                                                //           text:
                                                                //               "Request Money"),
                                                                //     ],
                                                                //   ),
                                                                //   onTap: () {
                                                                //     Get.to(
                                                                //         RequestMoney(),
                                                                //         duration: Duration(
                                                                //             milliseconds:
                                                                //                 500),
                                                                //         transition:
                                                                //             Transition.rightToLeft);
                                                                //   },
                                                                // ),
                                                                // InkWell(
                                                                //   onTap: () {
                                                                //     Get.to(
                                                                //         ConvertPage());
                                                                //   },
                                                                //   child: Column(
                                                                //     children: [
                                                                //       SvgPicture.asset(
                                                                //           "assets/svg/convert.svg",
                                                                //           height:
                                                                //               25,
                                                                //           width:
                                                                //               25),
                                                                //       text1(
                                                                //           color: Color(
                                                                //               0xFFFFFFFF),
                                                                //           size:
                                                                //               12,
                                                                //           fontWeight: FontWeight
                                                                //               .w500,
                                                                //           text:
                                                                //               "Convert"),
                                                                //     ],
                                                                //   ),
                                                                // ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.to(
                                                        RequestAccount(),
                                                        duration: Duration(
                                                            milliseconds:
                                                            500),
                                                        transition:
                                                        Transition.rightToLeft);
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        0.9,
                                                    child: Card(
                                                      shape: OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide.none,
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                      ),
                                                      elevation: 3,
                                                      shadowColor: Colors.grey,
                                                      color: Color(0xFF000000),
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .end,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 15.0,
                                                                  bottom: 15),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      SvgPicture.asset(
                                                                          "assets/svg/add.svg",
                                                                          height:
                                                                          25,
                                                                          width:
                                                                          25),
                                                                      text1(
                                                                          color: Color(
                                                                              0xFFFFFFFF),
                                                                          size:
                                                                          14,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          text:
                                                                          "Need More Account?\nRequest It Now"),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          return InkWell(
                                            onTap: () {
                                              item.account == "GBP"
                                                  ? Get.to(AccountPageNew(
                                                      item?.accountTitle,
                                                      item?.accountNumber,
                                                      item?.account,
                                                      item?.sortCode))
                                                  : Get.to(AccountPageNGN(
                                                      item?.accountName,
                                                      item?.accountNumber,
                                                      item?.account,
                                                      item?.bankName));
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              child: Card(
                                                shape: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                elevation: 3,
                                                shadowColor: Colors.grey,
                                                color: Color(0xFF0057FC),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              text1(
                                                                  color: Color(
                                                                      0xFFFFFFFF),
                                                                  size: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  text:
                                                                      'Balance'),
                                                              text1(
                                                                  color: Color(
                                                                      0xFFFFFFFF),
                                                                  size: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  text: item.account ==
                                                                          "GBP"
                                                                      ? "${item.balance}"
                                                                      : "${item.walletAmount}"),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              text1(
                                                                  color: Color(
                                                                      0xFFFFFFFF),
                                                                  size: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  text:
                                                                      'Account'),
                                                              text1(
                                                                  color: Color(
                                                                      0xFFFFFFFF),
                                                                  size: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  text:
                                                                      "${item!.accountNumber}"),
                                                              text1(
                                                                  color: Color(
                                                                      0xFFFFFFFF),
                                                                  size: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  text: item.account ==
                                                                          "GBP"
                                                                      ? "${item.sortCode}"
                                                                      : "${item.bankName}"),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          // InkWell(
                                                          //   onTap: () {
                                                          //     Get.to(AddFund(),
                                                          //         duration: Duration(
                                                          //             milliseconds:
                                                          //                 500),
                                                          //         transition:
                                                          //             Transition
                                                          //                 .rightToLeft);
                                                          //   },
                                                          //   child: Column(
                                                          //     children: [
                                                          //       SvgPicture.asset(
                                                          //           "assets/svg/add.svg",
                                                          //           height: 25,
                                                          //           width: 25),
                                                          //       text1(
                                                          //           color: Color(
                                                          //               0xFFFFFFFF),
                                                          //           size: 12,
                                                          //           fontWeight:
                                                          //               FontWeight
                                                          //                   .w500,
                                                          //           text:
                                                          //               "Add Fund"),
                                                          //     ],
                                                          //   ),
                                                          // ),
                                                          InkWell(
                                                            onTap: () {
                                                              Constant.acbalanceUK =
                                                                  item.balance;
                                                              Constant.acbalanceNGN = item
                                                                  .walletAmount
                                                                  .toString();

                                                              print(item
                                                                  ?.currencyCode);
                                                              if (item?.currencyCode ==
                                                                  "GBP") {
                                                                Get.to(
                                                                    SavedPayee(),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            0),
                                                                    transition:
                                                                        Transition
                                                                            .rightToLeft);
                                                              } else {
                                                                Get.to(
                                                                    SavedPayeeNGN(),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            0),
                                                                    transition:
                                                                        Transition
                                                                            .rightToLeft);
                                                              }
                                                            },
                                                            child: Column(
                                                              children: [
                                                                SvgPicture.asset(
                                                                    "assets/svg/sendMoney.svg",
                                                                    height: 28,
                                                                    width: 25),
                                                                Wrap(
                                                                  children: [
                                                                    text1(
                                                                        color: Color(
                                                                            0xFFFFFFFF),
                                                                        size:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        text:
                                                                            "Send Money"),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          // InkWell(
                                                          //   child: Column(
                                                          //     children: [
                                                          //       SvgPicture.asset(
                                                          //           "assets/svg/requestMoney.svg",
                                                          //           height: 22,
                                                          //           width: 22),
                                                          //       SizedBox(
                                                          //         height: 5,
                                                          //       ),
                                                          //       text1(
                                                          //           color: Color(
                                                          //               0xFFFFFFFF),
                                                          //           size: 12,
                                                          //           fontWeight:
                                                          //               FontWeight
                                                          //                   .w500,
                                                          //           text:
                                                          //               "Request Money"),
                                                          //     ],
                                                          //   ),
                                                          //   onTap: () {
                                                          //     Get.to(
                                                          //         RequestMoney(),
                                                          //         duration: Duration(
                                                          //             milliseconds:
                                                          //                 500),
                                                          //         transition:
                                                          //             Transition
                                                          //                 .rightToLeft);
                                                          //   },
                                                          // ),
                                                          // InkWell(
                                                          //   onTap: () {
                                                          //     Get.to(
                                                          //         ConvertPage());
                                                          //   },
                                                          //   child: Column(
                                                          //     children: [
                                                          //       SvgPicture.asset(
                                                          //           "assets/svg/convert.svg",
                                                          //           height: 25,
                                                          //           width: 25),
                                                          //       text1(
                                                          //           color: Color(
                                                          //               0xFFFFFFFF),
                                                          //           size: 12,
                                                          //           fontWeight:
                                                          //               FontWeight
                                                          //                   .w500,
                                                          //           text:
                                                          //               "Convert"),
                                                          //     ],
                                                          //   ),
                                                          // ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  )
                                : Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 1,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Get.to(
                                                      RequestAccount(),
                                                      duration: Duration(
                                                          milliseconds:
                                                          500),
                                                      transition:
                                                      Transition.rightToLeft);
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.9,
                                                  child: Card(
                                                    shape: OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide.none,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                    ),
                                                    elevation: 3,
                                                    shadowColor: Colors.grey,
                                                    color: Color(0xFF000000),
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.all(
                                                          10.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .end,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 15.0,
                                                                bottom: 15),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                Column(
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    SvgPicture.asset(
                                                                        "assets/svg/add.svg",
                                                                        height:
                                                                        25,
                                                                        width:
                                                                        25),
                                                                    text1(
                                                                        color: Color(
                                                                            0xFFFFFFFF),
                                                                        size:
                                                                        14,
                                                                        fontWeight: FontWeight
                                                                            .w500,
                                                                        text:
                                                                        "Need More Account?\nRequest It Now"),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }),
                                  ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 11.0, left: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text1(
                                color: Color(0xFF220000),
                                size: 17,
                                fontWeight: FontWeight.w700,
                                text: 'Recent Transactions'),
                            InkWell(
                              // child: Text("See All",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:16,fontWeight: FontWeight.bold,))),
                              child: text1(
                                  color: Color(0xFF808080),
                                  size: 17,
                                  fontWeight: FontWeight.w700,
                                  text: 'See All'),
                              onTap: () {
                                Get.to(
                                  SeeAllPage(),
                                  duration: Duration(milliseconds: 1000),
                                  transition: Transition.downToUp,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 12,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 11.0, left: 11),
                          child: ListView(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8.0, top: 8),
                                    child: Row(
                                      children: [
                                        text1(
                                            color: Color(0xFF222222),
                                            size: 15,
                                            fontWeight: FontWeight.w500,
                                            text: 'Today'),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showGeneralDialog(
                                        barrierDismissible: true,
                                        context: context,
                                        barrierLabel: "Barrier",
                                        barrierColor:
                                            Colors.black.withOpacity(0.5),
                                        transitionDuration:
                                            const Duration(milliseconds: 500),
                                        pageBuilder: (_, __, ___) {
                                          return Container(
                                            margin: EdgeInsets.only(
                                                left: 0,
                                                right: 0,
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                bottom: 0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                    blurRadius: 1,
                                                    color: Colors.grey,
                                                    spreadRadius: 0.2)
                                              ],
                                            ),
                                            child: ListView(
                                              shrinkWrap: true,
                                              physics:
                                                  const ClampingScrollPhysics(),
                                              padding: EdgeInsets.zero,
                                              children: [
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 25.0,
                                                      right: 25.0,
                                                      bottom: 41.0,
                                                    ),
                                                    child: ListView(
                                                      shrinkWrap: true,
                                                      physics:
                                                          ClampingScrollPhysics(),
                                                      children: [
                                                        Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              IconButton(
                                                                icon: Icon(
                                                                  Icons.clear,
                                                                  size: 32,
                                                                ),
                                                                onPressed: () {
                                                                  Get.back();
                                                                },
                                                              ),
                                                              text1(
                                                                color: Color(
                                                                    0xFF16161D),
                                                                size: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                text:
                                                                    'Transaction details',
                                                              ),
                                                              Container(),
                                                            ],
                                                          ),
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                        ),
                                                        Center(
                                                          child: text1(
                                                            color: Colors
                                                                .lightGreenAccent
                                                                .shade400,
                                                            size: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            text:'(Successful)',
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        ListTile(
                                                          leading: text1(
                                                            color: Color(
                                                                0xFF16161D),
                                                            size: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            text: 'Amount',
                                                          ),
                                                          trailing: text1(
                                                              color: Color(
                                                                  0xFF16161D),
                                                              size: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              text:
                                                                  '3716.00 NGN'),
                                                        ),
                                                        Divider(
                                                          endIndent: 10,
                                                          indent: 5,
                                                          height: 2,
                                                          color: Colors
                                                              .grey.shade200,
                                                          thickness: 1,
                                                        ),
                                                        ListTile(
                                                          leading: text1(
                                                            color: Color(
                                                                0xFF16161D),
                                                            size: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            text:
                                                                'Transaction Type',
                                                          ),
                                                          trailing: text1(
                                                              color: Color(
                                                                  0xFF16161D),
                                                              size: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              text:
                                                                  'Wallet Exchange'),
                                                        ),
                                                        Divider(
                                                          endIndent: 10,
                                                          indent: 5,
                                                          height: 2,
                                                          color: Colors
                                                              .grey.shade200,
                                                          thickness: 1,
                                                        ),
                                                        ListTile(
                                                          leading: text1(
                                                            color: Color(
                                                                0xFF16161D),
                                                            size: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            text: 'Reference',
                                                          ),
                                                          trailing: text1(
                                                              color: Color(
                                                                  0xFF16161D),
                                                              size: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              text:
                                                                  '82190...    Copy'),
                                                        ),
                                                        Center(
                                                          child: text1(
                                                            color: Colors
                                                                .grey.shade500,
                                                            size: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            text:
                                                                '      27 Jun 2022 at 09:51',
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 25,
                                                        ),
                                                        ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  elevation: 0,
                                                                  primary: Colors
                                                                      .white,
                                                                  fixedSize:
                                                                      const Size(
                                                                          249,
                                                                          40),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(35),
                                                                      side: BorderSide(
                                                                        color: Colors
                                                                            .lightGreenAccent
                                                                            .shade400,
                                                                      ))),
                                                          onPressed:
                                                              () async {},
                                                          child: Text(
                                                              "Report Transaction",
                                                              style: GoogleFonts
                                                                  .quicksand(
                                                                      textStyle:
                                                                          TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .lightGreenAccent
                                                                    .shade400,
                                                              ))),
                                                        ),
                                                      ],
                                                    ))
                                              ],
                                            ),
                                          );
                                        },
                                        transitionBuilder:
                                            (_, anim, __, child) {
                                          Tween<Offset> tween;
                                          if (anim.status ==
                                              AnimationStatus.reverse) {
                                            tween = Tween(
                                              begin: Offset(10, 0),
                                              end: Offset(0, 0),
                                            );
                                          } else {
                                            tween = Tween(
                                              begin: Offset(1, 0),
                                              end: Offset(0, 0),
                                            );
                                          }

                                          return SlideTransition(
                                            position: tween.animate(anim),
                                            child: FadeTransition(
                                              opacity: anim,
                                              child: child,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFC6D9FC)),
                                      ),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: const CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 30,
                                              backgroundImage: AssetImage(
                                                  "assets/screen/cart.png"),
                                            ),
                                            title: text1(
                                                color: Color(0xFF16161D),
                                                size: 15,
                                                fontWeight: FontWeight.w700,
                                                text: 'Shopping Grocery'),
                                            subtitle: text1(
                                                color: Color(0xFF858487),
                                                size: 13,
                                                fontWeight: FontWeight.w600,
                                                text: '10:00 AM'),
                                            trailing: text1(
                                                color: Color.fromRGBO(
                                                    230, 43, 43, 1),
                                                size: 14,
                                                fontWeight: FontWeight.w500,
                                                text: '£1,000'),
                                          ),
                                          Divider(
                                            // endIndent: 10,
                                            // indent: 5,
                                            height: 2,
                                            color: Color(0xFFC6D9FC),
                                            thickness: 1,
                                          ),
                                          ListTile(
                                            leading: const CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 30,
                                              backgroundImage: AssetImage(
                                                  "assets/screen/camera.png"),
                                            ),
                                            title: text1(
                                                color: Color(0xFF16161D),
                                                size: 15,
                                                fontWeight: FontWeight.w700,
                                                text: 'Monthly Contribution'),
                                            subtitle: text1(
                                                color: Color(0xFF858487),
                                                size: 13,
                                                fontWeight: FontWeight.w600,
                                                text: '10:00 AM'),
                                            trailing: text1(
                                                color: Color.fromRGBO(
                                                    230, 43, 43, 1),
                                                size: 14,
                                                fontWeight: FontWeight.w500,
                                                text: '£1,000'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8.0, top: 8),
                                    child: Row(
                                      children: [
                                        text1(
                                            color: Color(0xFF222222),
                                            size: 15,
                                            fontWeight: FontWeight.w500,
                                            text: 'Yesterday'),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showGeneralDialog(
                                        barrierDismissible: true,
                                        context: context,
                                        barrierLabel: "Barrier",
                                        barrierColor:
                                            Colors.black.withOpacity(0.5),
                                        transitionDuration:
                                            const Duration(milliseconds: 500),
                                        pageBuilder: (_, __, ___) {
                                          return Container(
                                            margin: EdgeInsets.only(
                                                left: 0,
                                                right: 0,
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                bottom: 0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                    blurRadius: 1,
                                                    color: Colors.grey,
                                                    spreadRadius: 0.2)
                                              ],
                                            ),
                                            child: ListView(
                                              shrinkWrap: true,
                                              physics:
                                                  const ClampingScrollPhysics(),
                                              padding: EdgeInsets.zero,
                                              children: [
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 25.0,
                                                      right: 25.0,
                                                      bottom: 41.0,
                                                    ),
                                                    child: ListView(
                                                      shrinkWrap: true,
                                                      physics:
                                                          ClampingScrollPhysics(),
                                                      children: [
                                                        Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              IconButton(
                                                                icon: Icon(
                                                                  Icons.clear,
                                                                  size: 32,
                                                                ),
                                                                onPressed: () {
                                                                  Get.back();
                                                                },
                                                              ),
                                                              text1(
                                                                color: Color(
                                                                    0xFF16161D),
                                                                size: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                text:
                                                                    'Transaction details',
                                                              ),
                                                              Container(),
                                                            ],
                                                          ),
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                        ),
                                                        Center(
                                                          child: text1(
                                                            color: Colors
                                                                .lightGreenAccent
                                                                .shade400,
                                                            size: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            text:
                                                                '         (Successful)',
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        ListTile(
                                                          leading: text1(
                                                            color: Color(
                                                                0xFF16161D),
                                                            size: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            text: 'Amount',
                                                          ),
                                                          trailing: text1(
                                                              color: Color(
                                                                  0xFF16161D),
                                                              size: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              text:
                                                                  '3716.00 NGN'),
                                                        ),
                                                        Divider(
                                                          endIndent: 10,
                                                          indent: 5,
                                                          height: 2,
                                                          color: Colors
                                                              .grey.shade200,
                                                          thickness: 1,
                                                        ),
                                                        ListTile(
                                                          leading: text1(
                                                            color: Color(
                                                                0xFF16161D),
                                                            size: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            text:
                                                                'Transaction Type',
                                                          ),
                                                          trailing: text1(
                                                              color: Color(
                                                                  0xFF16161D),
                                                              size: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              text:
                                                                  'Wallet Exchange'),
                                                        ),
                                                        Divider(
                                                          endIndent: 10,
                                                          indent: 5,
                                                          height: 2,
                                                          color: Colors
                                                              .grey.shade200,
                                                          thickness: 1,
                                                        ),
                                                        ListTile(
                                                          leading: text1(
                                                            color: Color(
                                                                0xFF16161D),
                                                            size: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            text: 'Reference',
                                                          ),
                                                          trailing: text1(
                                                              color: Color(
                                                                  0xFF16161D),
                                                              size: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              text:
                                                                  '82190...    Copy'),
                                                        ),
                                                        Center(
                                                          child: text1(
                                                            color: Colors
                                                                .grey.shade500,
                                                            size: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            text:
                                                                '      27 Jun 2022 at 09:51',
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 25,
                                                        ),
                                                        ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  elevation: 0,
                                                                  primary: Colors
                                                                      .white,
                                                                  fixedSize:
                                                                      const Size(
                                                                          249,
                                                                          40),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(35),
                                                                      side: BorderSide(
                                                                        color: Colors
                                                                            .lightGreenAccent
                                                                            .shade400,
                                                                      ))),
                                                          onPressed:
                                                              () async {},
                                                          child: Text(
                                                              "Report Transaction",
                                                              style: GoogleFonts
                                                                  .quicksand(
                                                                      textStyle:
                                                                          TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .lightGreenAccent
                                                                    .shade400,
                                                              ))),
                                                        ),
                                                      ],
                                                    ))
                                              ],
                                            ),
                                          );
                                        },
                                        transitionBuilder:
                                            (_, anim, __, child) {
                                          Tween<Offset> tween;
                                          if (anim.status ==
                                              AnimationStatus.reverse) {
                                            tween = Tween(
                                              begin: Offset(10, 0),
                                              end: Offset(0, 0),
                                            );
                                          } else {
                                            tween = Tween(
                                              begin: Offset(1, 0),
                                              end: Offset(0, 0),
                                            );
                                          }

                                          return SlideTransition(
                                            position: tween.animate(anim),
                                            child: FadeTransition(
                                              opacity: anim,
                                              child: child,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFC6D9FC)),
                                      ),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: const CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 30,
                                              backgroundImage: AssetImage(
                                                  "assets/screen/cart.png"),
                                            ),
                                            title: text1(
                                                color: Color(0xFF16161D),
                                                size: 15,
                                                fontWeight: FontWeight.w700,
                                                text: 'Shopping Grocery'),
                                            subtitle: text1(
                                                color: Color(0xFF858487),
                                                size: 13,
                                                fontWeight: FontWeight.w600,
                                                text: '10:00 AM'),
                                            trailing: text1(
                                                color: Color.fromRGBO(
                                                    230, 43, 43, 1),
                                                size: 14,
                                                fontWeight: FontWeight.w500,
                                                text: '£1,000'),
                                          ),
                                          Divider(
                                            // endIndent: 10,
                                            // indent: 5,
                                            height: 2,
                                            color: Color(0xFFC6D9FC),
                                            thickness: 1,
                                          ),
                                          ListTile(
                                            leading: const CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 30,
                                              backgroundImage: AssetImage(
                                                  "assets/screen/camera.png"),
                                            ),
                                            title: text1(
                                                color: Color(0xFF16161D),
                                                size: 15,
                                                fontWeight: FontWeight.w700,
                                                text: 'Monthly Contribution'),
                                            subtitle: text1(
                                                color: Color(0xFF858487),
                                                size: 13,
                                                fontWeight: FontWeight.w600,
                                                text: '10:00 AM'),
                                            trailing: text1(
                                                color: Color.fromRGBO(
                                                    230, 43, 43, 1),
                                                size: 14,
                                                fontWeight: FontWeight.w500,
                                                text: '£1,000'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8.0, top: 8),
                                    child: Row(
                                      children: [
                                        text1(
                                            color: Color(0xFF222222),
                                            size: 15,
                                            fontWeight: FontWeight.w500,
                                            text: '21 June 2022'),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showGeneralDialog(
                                        barrierDismissible: true,
                                        context: context,
                                        barrierLabel: "Barrier",
                                        barrierColor:
                                            Colors.black.withOpacity(0.5),
                                        transitionDuration:
                                            const Duration(milliseconds: 500),
                                        pageBuilder: (_, __, ___) {
                                          return Container(
                                            margin: EdgeInsets.only(
                                                left: 0,
                                                right: 0,
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                bottom: 0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                    blurRadius: 1,
                                                    color: Colors.grey,
                                                    spreadRadius: 0.2)
                                              ],
                                            ),
                                            child: ListView(
                                              shrinkWrap: true,
                                              physics:
                                                  const ClampingScrollPhysics(),
                                              padding: EdgeInsets.zero,
                                              children: [
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 25.0,
                                                      right: 25.0,
                                                      bottom: 41.0,
                                                    ),
                                                    child: ListView(
                                                      shrinkWrap: true,
                                                      physics:
                                                          ClampingScrollPhysics(),
                                                      children: [
                                                        Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              IconButton(
                                                                icon: Icon(
                                                                  Icons.clear,
                                                                  size: 32,
                                                                ),
                                                                onPressed: () {
                                                                  Get.back();
                                                                },
                                                              ),
                                                              text1(
                                                                color: Color(
                                                                    0xFF16161D),
                                                                size: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                text:
                                                                    'Transaction details',
                                                              ),
                                                              Container(),
                                                            ],
                                                          ),
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                        ),
                                                        Center(
                                                          child: text1(
                                                            color: Colors
                                                                .lightGreenAccent
                                                                .shade400,
                                                            size: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            text:
                                                                '         (Successful)',
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        ListTile(
                                                          leading: text1(
                                                            color: Color(
                                                                0xFF16161D),
                                                            size: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            text: 'Amount',
                                                          ),
                                                          trailing: text1(
                                                              color: Color(
                                                                  0xFF16161D),
                                                              size: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              text:
                                                                  '3716.00 NGN'),
                                                        ),
                                                        Divider(
                                                          endIndent: 10,
                                                          indent: 5,
                                                          height: 2,
                                                          color: Colors
                                                              .grey.shade200,
                                                          thickness: 1,
                                                        ),
                                                        ListTile(
                                                          leading: text1(
                                                            color: Color(
                                                                0xFF16161D),
                                                            size: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            text:
                                                                'Transaction Type',
                                                          ),
                                                          trailing: text1(
                                                              color: Color(
                                                                  0xFF16161D),
                                                              size: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              text:
                                                                  'Wallet Exchange'),
                                                        ),
                                                        Divider(
                                                          endIndent: 10,
                                                          indent: 5,
                                                          height: 2,
                                                          color: Colors
                                                              .grey.shade200,
                                                          thickness: 1,
                                                        ),
                                                        ListTile(
                                                          leading: text1(
                                                            color: Color(
                                                                0xFF16161D),
                                                            size: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            text: 'Reference',
                                                          ),
                                                          trailing: text1(
                                                              color: Color(
                                                                  0xFF16161D),
                                                              size: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              text:
                                                                  '82190...    Copy'),
                                                        ),
                                                        Center(
                                                          child: text1(
                                                            color: Colors
                                                                .grey.shade500,
                                                            size: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            text:
                                                                '      27 Jun 2022 at 09:51',
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 25,
                                                        ),
                                                        ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  elevation: 0,
                                                                  primary: Colors
                                                                      .white,
                                                                  fixedSize:
                                                                      const Size(
                                                                          249,
                                                                          40),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(35),
                                                                      side: BorderSide(
                                                                        color: Colors
                                                                            .lightGreenAccent
                                                                            .shade400,
                                                                      ))),
                                                          onPressed:
                                                              () async {},
                                                          child: Text(
                                                              "Report Transaction",
                                                              style: GoogleFonts
                                                                  .quicksand(
                                                                      textStyle:
                                                                          TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .lightGreenAccent
                                                                    .shade400,
                                                              ))),
                                                        ),
                                                      ],
                                                    ))
                                              ],
                                            ),
                                          );
                                        },
                                        transitionBuilder:
                                            (_, anim, __, child) {
                                          Tween<Offset> tween;
                                          if (anim.status ==
                                              AnimationStatus.reverse) {
                                            tween = Tween(
                                              begin: Offset(10, 0),
                                              end: Offset(0, 0),
                                            );
                                          } else {
                                            tween = Tween(
                                              begin: Offset(1, 0),
                                              end: Offset(0, 0),
                                            );
                                          }

                                          return SlideTransition(
                                            position: tween.animate(anim),
                                            child: FadeTransition(
                                              opacity: anim,
                                              child: child,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFC6D9FC)),
                                      ),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: const CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 30,
                                              backgroundImage: AssetImage(
                                                  "assets/screen/cart.png"),
                                            ),
                                            title: text1(
                                                color: Color(0xFF16161D),
                                                size: 15,
                                                fontWeight: FontWeight.w700,
                                                text: 'Shopping Grocery'),
                                            subtitle: text1(
                                                color: Color(0xFF858487),
                                                size: 13,
                                                fontWeight: FontWeight.w600,
                                                text: '10:00 AM'),
                                            trailing: text1(
                                                color: Color.fromRGBO(
                                                    230, 43, 43, 1),
                                                size: 14,
                                                fontWeight: FontWeight.w500,
                                                text: '£1,000'),
                                          ),
                                          Divider(
                                            // endIndent: 10,
                                            // indent: 5,
                                            height: 2,
                                            color: Color(0xFFC6D9FC),
                                            thickness: 1,
                                          ),
                                          ListTile(
                                            leading: const CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 30,
                                              backgroundImage: AssetImage(
                                                  "assets/screen/camera.png"),
                                            ),
                                            title: text1(
                                                color: Color(0xFF16161D),
                                                size: 15,
                                                fontWeight: FontWeight.w700,
                                                text: 'Monthly Contribution'),
                                            subtitle: text1(
                                                color: Color(0xFF858487),
                                                size: 13,
                                                fontWeight: FontWeight.w600,
                                                text: '10:00 AM'),
                                            trailing: text1(
                                                color: Color.fromRGBO(
                                                    230, 43, 43, 1),
                                                size: 14,
                                                fontWeight: FontWeight.w500,
                                                text: '£1,000'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                  // ListView.builder(
                                  //     itemCount: 2,
                                  //     itemBuilder: (BuildContext context, int index) {
                                  //       return ListTile(
                                  //           leading: const Icon(Icons.list),
                                  //           trailing: const Text(
                                  //             "GFG",
                                  //             style: TextStyle(color: Colors.green, fontSize: 15),
                                  //           ),
                                  //           title: Text("List item $index"));
                                  //     }),

                                  // Container(
                                  //   height:400,
                                  //   child: ListView.builder(
                                  //       itemCount: 6,
                                  //       itemBuilder: (BuildContext context, int index) {
                                  //         return ListTile(
                                  //             leading: Image.asset("assets/screen/cart.png"),
                                  //             trailing:  Text( "${amount[index]}",
                                  //               style: TextStyle(color: Colors.green, fontSize: 15),
                                  //             ),
                                  //             title: Text("${item[index]}"));
                                  //       }),
                                  // ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )));
  }

  User? user;
  bool isLoading = true;

  getData() {
    print("Tried getting data");
    getUserData().then((value) => {
          if (value != null)
            {
              print("Success getting data"),

              // print("Success heyy1"),

              setState(() {
                user = value;
                isLoading = false;
                print("Hi");
                // print();
                Constant.firstName = user!.firstName;
                Constant.lastName = user!.lastName;
                Constant.dob = user!.dateOfBirth.toString();
                Constant.emailId = user!.email;
                Constant.mobileNumber = user!.phone;
                Constant.addressregister = user!.address;


                // accLen=user!.nigeriacontent.accountInfo.length+user!.ukcontent.accountInfo.length;
                // ukacclen=user!.ukcontent.accountInfo.length;
                // nigacclen=user!.nigeriacontent.accountInfo.length;
                // Constant.firstName=user!.firstName;
                // Constant.firstName=user!.firstName;
                // Constant.firstName=user!.firstName;
                // print(user?.content.accountInfo[0].accountNumber);
              }),
              print("Currency " + user!.content.accountInfo[1].account),
              user!.content.accountInfo.forEach((element) {
                if(element.account=="NGN")
                {
                  user!.content.accountInfo.removeWhere((element) => element.account=="NGN");
                }
              })

            }
          else
            {
              print("Failure getting data"),
            }
        });
  }

  List image = [
    "https://thumbs.dreamstime.com/z/making-cash-payment-5494712.jpg",
    "https://c8.alamy.com/comp/FC7XAY/hispanic-woman-holding-cash-and-credit-card-FC7XAY.jpg",
    "https://www.rd.com/wp-content/uploads/2018/07/feel-better_reasons-to-pay-cash.jpg",
    "https://cdn.dnaindia.com/sites/default/files/styles/full/public/2022/03/14/1047885-cash-money.jpg",
    "https://thumbs.dreamstime.com/z/making-cash-payment-5494712.jpg",
    "https://c8.alamy.com/comp/FC7XAY/hispanic-woman-holding-cash-and-credit-card-FC7XAY.jpg",
    "https://www.rd.com/wp-content/uploads/2018/07/feel-better_reasons-to-pay-cash.jpg",
    "https://cdn.dnaindia.com/sites/default/files/styles/full/public/2022/03/14/1047885-cash-money.jpg"
  ];
}
