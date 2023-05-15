import 'dart:convert';
import 'dart:io';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Components/Constant.dart';
import '../../../../modelClass/userProfileModel.dart';
import '../../../../services/userDataService.dart';
import '../../../../utils/tierMoney.dart';
import '../../../../wedget/textWedget.dart';
import '../../../AuthPage/Login/login.dart';
import '../../../AuthPage/SignUp/securePin.dart';
import '../../moreMenuPage/changePassword1/changePassword.dart';
import '../../moreMenuPage/personalDetails/personalInformation.dart';
import '../../moreMenuPage/securePin/securePIN1.dart';
import '../addFund/Webview.dart';

class MorePage1 extends StatefulWidget {
  const MorePage1({Key? key}) : super(key: key);

  @override
  State<MorePage1> createState() => _MorePage1State();
}

class _MorePage1State extends State<MorePage1> {
  @override
  void initState() {
    tokenId();
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0x00FFFFFF),
                elevation: 0,
                title: text1(
                    text: "Account",
                    size: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                centerTitle: true,
              ),
              backgroundColor: const Color(0xFFFFFFFF),
              body: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.05,
                      left: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(
                                14.0) //                 <--- border radius here
                            ),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(33, 66, 128, 1),
                              Color.fromRGBO(0, 87, 252, 0.5)
                            ]),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.shade200,
                            offset: const Offset(
                              2.0,
                              2.0,
                            ),
                            blurRadius: 12.0,
                            spreadRadius: 1.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      child: Center(
                        child: ListTile(
                          onTap: () {
                            Get.to(PersonalInformation());
                          },
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 27,
                            backgroundImage:
                                AssetImage("assets/screen/profile1.png"),
                          ),
                          title: text1(
                              text: "${user!.firstName ?? ""} "
                                  "${user!.lastName ?? ""}",
                              size: 20,
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(PersonalInformation());
                    },
                    leading: SvgPicture.asset(

                        "assets/screen/profile.svg",
                        height: 40,
                        width: 40
                    ),
                    title: text1(
                        text: "Personal Information",
                        size: 16,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey.shade300,
                      size: 20,
                    ),
                  ),
                  Divider(
                    endIndent: 10,
                    indent: 5,
                    height: 2,
                    color: Colors.grey.shade200,
                    thickness: 1,
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(ChangePassword1());
                    },
                    leading: SvgPicture.asset(

                        "assets/screen/changePassword.svg",
                        height: 32,
                        width: 32
                    ),
                    title: text1(
                        text: "Change Password",
                        size: 16,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey.shade300,
                      size: 20,
                    ),
                  ),
                  Divider(
                    endIndent: 10,
                    indent: 5,
                    height: 2,
                    color: Colors.grey.shade200,
                    thickness: 1,
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(CreatePinNew1());
                    },
                    leading: SvgPicture.asset(
                        "assets/screen/PinReset.svg",
                        height: 40,
                        width: 40
                    ),
                    title: text1(
                        text: "PIN Reset",
                        size: 16,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey.shade300,
                      size: 20,
                    ),
                  ),
                  Divider(
                    endIndent: 10,
                    indent: 5,
                    height: 2,
                    color: Colors.grey.shade200,
                    thickness: 1,
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(WebViewClass("Privacy Policy","https://tiermoney.com/privacy-policy/"));

                      // Get.to(PersonalDetails());
                    },
                    leading: SvgPicture.asset(
                        "assets/screen/PrivacyPolicy.svg",
                        height: 40,
                        width: 40
                    ),
                    title: text1(
                        text: "Privacy Policy",
                        size: 16,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey.shade300,
                      size: 20,
                    ),
                  ),
                  Divider(
                    endIndent: 10,
                    indent: 5,
                    height: 2,
                    color: Colors.grey.shade200,
                    thickness: 1,
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(WebViewClass("Terms and Condition","https://tiermoney.com/uk-terms-and-conditions/"));
                    },
                    leading: SvgPicture.asset(
                        "assets/screen/tnc.svg",
                        height: 40,
                        width: 40
                    ),
                    title: text1(
                        text: "Terms and Conditions",
                        size: 16,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey.shade300,
                      size: 20,
                    ),
                  ),
                  Divider(
                    endIndent: 10,
                    indent: 5,
                    height: 2,
                    color: Colors.grey.shade200,
                    thickness: 1,
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(WebViewClass("Support","https://tiermoney.com/contact-us/"));
                    },
                    leading: SvgPicture.asset(
                        "assets/screen/support.svg",
                        height: 40,
                        width: 40
                    ),
                    title: text1(
                        text: "Support",
                        size: 16,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey.shade300,
                      size: 20,
                    ),
                  ),
                  Divider(
                    endIndent: 10,
                    indent: 5,
                    height: 2,
                    color: Colors.grey.shade200,
                    thickness: 1,
                  ),
                  ListTile(
                    onTap: () {
                      // Get.to(PersonalDetails());
                    },
                    leading: SvgPicture.asset(
                        "assets/screen/facebook.svg",
                        height: 40,
                        width: 40
                    ),
                    title: text1(
                        text: "Like us on Facebook",
                        size: 16,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey.shade300,
                      size: 20,
                    ),
                  ),
                  Divider(
                    endIndent: 10,
                    indent: 5,
                    height: 2,
                    color: Colors.grey.shade200,
                    thickness: 1,
                  ),
                  ListTile(
                    onTap: () {
                      // Get.to(PersonalDetails());
                    },
                    leading: SvgPicture.asset(
                        "assets/screen/insta.svg",
                        height: 40,
                        width: 40
                    ),
                    title: text1(
                        text: "Follow us on Instagram",
                        size: 16,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey.shade300,
                      size: 20,
                    ),
                  ),
                  Divider(
                    endIndent: 10,
                    indent: 5,
                    height: 2,
                    color: Colors.grey.shade200,
                    thickness: 1,
                  ),
                  ListTile(
                    onTap: () {
                      // Get.to(PersonalDetails());
                    },
                    leading: SvgPicture.asset(
                        "assets/screen/twit.svg",
                        height: 33,
                        width: 33
                    ),
                    title: text1(
                        text: "Follow us on Twitter",
                        size: 16,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey.shade300,
                      size: 20,
                    ),
                  ),
                  Divider(
                    endIndent: 10,
                    indent: 5,
                    height: 2,
                    color: Colors.grey.shade200,
                    thickness: 1,
                  ),
                  ListTile(
                    onTap: () {
                      https://play.google.com/store/apps/details?id=com.tiermoney
                      Get.to(WebViewClass("App Store","https://play.google.com/store/apps/details?id=com.tiermoney"));
                    },
                    leading: SvgPicture.asset(
                        "assets/screen/appstore.svg",
                        height: 40,
                        width: 40
                    ),
                    title: text1(
                        text: "Rate Us on App Store",
                        size: 16,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey.shade300,
                      size: 20,
                    ),
                  ),
                  Divider(
                    endIndent: 10,
                    indent: 5,
                    height: 2,
                    color: Colors.grey.shade200,
                    thickness: 1,
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(WebViewClass("Tier Money","https://tiermoney.com/"));

                    },
                    leading: SvgPicture.asset(
                        "assets/screen/website.svg",
                        height: 35,
                        width: 35
                    ),
                    title: text1(
                        text: "Visit our Website",
                        size: 16,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey.shade300,
                      size: 20,
                    ),
                  ),

                  Divider(
                    endIndent: 10,
                    indent: 5,
                    height: 2,
                    color: Colors.grey.shade200,
                    thickness: 1,
                  ),
                  ListTile(
                    onTap: () {
                      // Get.to(PersonalDetails());
                    },
                    leading: SvgPicture.asset(
                        "assets/screen/version.svg",
                        height: 40,
                        width: 40
                    ),
                    title: text1(
                        text: "App Version",
                        size: 16,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey.shade300,
                      size: 20,
                    ),
                  ),
                  Divider(
                    endIndent: 10,
                    indent: 5,
                    height: 2,
                    color: Colors.grey.shade200,
                    thickness: 1,
                  ),
                  ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => new CupertinoAlertDialog(
                          title: new Text("Logout!"),
                          content: new Text("Do you want to logout?"),
                          actions: [
                            CupertinoDialogAction(
                                onPressed: () {
                                  Get.back();
                                },
                                isDefaultAction: true,
                                child: new Text("Cancel")),
                            CupertinoDialogAction(
                                onPressed: (){
                                  UserLogout();
                                },
                                isDefaultAction: true,
                                child: new Text(
                                  "Logout",
                                )
                            )
                          ],
                        ),
                      );
                    },
                    leading: SvgPicture.asset(
                        "assets/screen/logout.svg",
                        height: 32,
                        width: 32
                    ),
                    title: text1(
                        text: "Logout",
                        size: 16,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey.shade300,
                      size: 20,
                    ),
                  ),
                  Divider(
                    endIndent: 10,
                    indent: 5,
                    height: 2,
                    color: Colors.grey.shade200,
                    thickness: 1,
                  ),
                ],
              ),
            ),
    );
  }

  //log out user//
  String? token;

  tokenId() async {
    token = await TierMoneyPreference().getString("token");
    print("token=>${token}");
  }

  Future UserLogout() async {
    EasyLoading.show(status: "Loading...");
    try {
      var headers = {'Authorization': "Bearer " + "${Constant.token}"};
      var request =
          http.MultipartRequest('POST', Uri.parse(Constant.user_logOUT));
      request.headers.addAll(headers);

      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);
      print(response);
      print(jsonBody.toString());

      if (response.statusCode == 200) {
        print("Success");
        EasyLoading.showSuccess("Logout Successfully");
        Get.offAll(const Login());
        SharedPreferences share = await SharedPreferences.getInstance();
        await share.setBool('loginScreen', false);
      } else {
        EasyLoading.dismiss();
        print(jsonBody['success']);
        EasyLoading.showError(jsonBody['error']['otp']);
      }
    } catch (e) {
      EasyLoading.showError("Oops!");
      if (e is SocketException) {
        showLongToast("Could not connect to internet");
      }
    }
  }

  bool isLoading = true;

  User? user;

  getData() {
    getUserData().then((value) => {
          if (value != null)
            {
              setState(() {
                user = value;
                isLoading = false;

                Constant.firstName=user!.firstName;
                Constant.lastName=user!.lastName;
                Constant.dob=user!.dateOfBirth.toString();
                Constant.emailId=user!.email;
                Constant.mobileNumber=user!.phone;
                Constant.addressregister=user!.address;
              })
            }
        });
  }
}
