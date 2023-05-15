import 'dart:convert';
import 'dart:io';
import 'package:digital_banking/Components/Constant.dart';
import 'package:digital_banking/modelClass/userProfileModel.dart';
import 'package:flutter_dojah_financial/flutter_dojah_financial.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../modelClass/ngnbankModel.dart';
import '../screens/AuthPage/Login/login.dart';
import '../screens/AuthPage/SignUp/phoneNumber.dart';
import '../screens/dashBoardPage/dashBordPage/addFund/Webview.dart';
import '../utils/tierMoney.dart';

Future<User?> getUserData()async{
  try{
    String? token;
    token=await TierMoneyPreference().getString("token");
    print(token);
    Constant.token=token;
    var headers={
      'Authorization':"Bearer " + token,
    };
    var request = http.Request('POST', Uri.parse(Constant.user_Profile));
    request.headers.addAll(headers);

    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    final jsonBody = await jsonDecode(respStr);
    print(jsonBody.toString());
    print("status "+response.statusCode.toString());


    if(response.statusCode==200||response.statusCode==201){

      User list = User.fromJson(jsonBody['success']['user']);
      List<AccountInfo> account=[];




       // List<User> getListfromJson(List<dynamic> list) {
       //   List<User> unitList = [];
       //   list.forEach((unit) => unitList.remove(User.fromJson(unit)));
       //   return unitList;
       // }
      print("Success hey1");
      print("Success hey1");

      print(list);

      // print(jsonBody['success']['user']['account_info']['content'][0]['modulr_account_id']);
      return list;

      // print(response.statusCode);
      // var dataOfUser=jsonDecode(response.body)['user'];
      // return User.fromJson(dataOfUser[0]);
    }
  }
  catch (e) {
    EasyLoading.showError("Oops!");
    if (e is SocketException) {
      showLongToast("Could not connect to internet");
    }
    // else{
    //   Get.to(Login());
    //
    // }

  }
  return null;
}
Future<List<BankModel>?> fBankList() async {
  try {
    var headers = {'Authorization': 'Bearer ' + Constant.token,'Content-Type': 'application/json',};
    var request = http.Request(
        'GET',
        Uri.parse(Constant.banks));
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    final jsonBody = await jsonDecode(respStr);
    print(jsonBody.toString());
    if (response.statusCode == 200) {
      List<dynamic> jsonbody1 = jsonBody['success']['bank_detail'];
      List<BankModel>? list = BankModel.getListfromJson(jsonbody1);
      print("ERROR");
      print(list[0].toJson());
      print("ERROR");


      return list;

      // print("Success Getting Banks");
      // BankModel list=jsonBody['success']['bank_detail'];
      // print(list);
      // return list;

    } else {
      EasyLoading.showError("No Banks Available");
    }
  } catch (e) {
    if (e is SocketException) showLongToast("Could not connect to internet");
  }
  return null;
}

Future depositMoney() async {
  try {
    var headers = {'Authorization': 'Bearer ' + Constant.token,'Content-Type': 'application/json',};
    var request = http.MultipartRequest('POST', Uri.parse(Constant.DepositUkMoney));

    request.fields.addAll({
      'amount': '5',
      'bank_id': 'H120000002',
      'reference': 'testdepositmoney'
    });
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    final jsonBody = await jsonDecode(respStr);
    print(jsonBody.toString());
    if (response.statusCode == 200) {
      print(jsonBody['success']['redirectUrl']);
      Get.to(WebViewClass("TierMoney",jsonBody['success']['redirectUrl']));
    } else {
      EasyLoading.showError("No Banks Available");
    }
  } catch (e) {
    if (e is SocketException) showLongToast("Could not connect to internet");
  }
}
Future verifyAddress(postcode,houseNumber) async {
  try {
    EasyLoading.show(status: "Loading...");
    var request = http.Request('GET',Uri.parse('https://api.getAddress.io/find/${postcode}/${houseNumber}?api-key=CtMS94kj3Ua7ReA1VktYbQ31036'));
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    final jsonBody = await jsonDecode(respStr);
    print(jsonBody.toString());
    if (response.statusCode == 200) {
      if(jsonBody['latitude']==0.0){
        EasyLoading.showError("Please Enter Valid Address");
      }
      else{
        EasyLoading.showSuccess("Address Verified Successful");
        var diviseId = await getId();

        Get.off(PhoneNumber(
          diviseId: diviseId.toString(),
        ));
      }

    } else {
      EasyLoading.showError("Please Enter Valid Address");
    }
  } catch (e) {
    if (e is SocketException) showLongToast("Could not connect to internet");
  }
}
