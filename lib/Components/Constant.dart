import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';

class Constant{
  static const String perPage="10";


  static const String baseUrl="https://dev.tiermoney.com/api/";
  static const String verifyPhone="${baseUrl}send-otp-sms";
  static const String send_otp_email="${baseUrl}send-otp-email?email=";
  static const String authenticate_otp_email="${baseUrl}authenticate-otp-email?otp=";
  static const String registerUser="${baseUrl}signup";
  static const String validatePassword="${baseUrl}validate-password";
  static const String transactionPin="${baseUrl}transaction-pin";
  static const String OTPtransactionPin="${baseUrl}authenticate-transaction-pin";
  static const String userLogin="${baseUrl}login";
  static const String loginOtpVerification="${baseUrl}login-otp-verification";
  static const String resendOtpSms="${baseUrl}resend-otp-sms";
  static const String user_Profile="${baseUrl}user-profile";
  static const String user_logOUT="${baseUrl}logout";
  static const String reSend_OTP="${baseUrl}resend-otp-sms";
  static const String authenticate_OTP="${baseUrl}authenticate-otp-sms";
  static const String reSend_Email="${baseUrl}resend-otp-email?email=";
  static const String getBan="${baseUrl}resend-otp-email?email=";
  static const String addUkBeneficiary="${baseUrl}add-uk-beneficiary";
  static const String addNGBeneficiary="${baseUrl}add-ng-beneficiary";
  static const String UKbeneficiaries="${baseUrl}uk-beneficiaries";
  static const String NGNbeneficiaries="${baseUrl}nigeria-beneficiaries";
  static const String banks="${baseUrl}banks";
  static const String ukbanks="${baseUrl}uk-banks";
  static const String validateTransaction="${baseUrl}validate-transaction-pin";
  static const String changePassword="${baseUrl}change-password";
  static const String authenticatePassword="${baseUrl}authenticate-change-password";
  static const String DeleteBeneficiary="${baseUrl}delete-beneficiary/";
  static const String DepositUkMoney="${baseUrl}deposit-uk-money";
  static const String transferUKMoney="${baseUrl}transfer-uk-money";




  static  String firstName="Michael";
  static  String lastName="";
  static  String emailId="";
  static  String mobileNumber="";
  static  String countryCode="";
  static  String countryNumber="";
  static  String countryPhoneCode="";
  static  String addressregister="";
  static  String addressZipCode="";
  static  String password="";
  static  String conformPassword="";
  static  String dob="";
  static  String token="";
  static  String acbalanceNGN="";
  static  String acbalanceUK="";
  static  String ModularId="";



}
showLongToast(String s) {
  Fluttertoast.showToast(

    msg: s,
    toastLength: Toast.LENGTH_LONG,
  );
}
onShareData({String? text})async{
  await Share.share(text!);
}

Future<String?> getId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor;
  } else {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId;
  }
}