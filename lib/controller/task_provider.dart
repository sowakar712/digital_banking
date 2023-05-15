import 'dart:convert';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Components/Constant.dart';
import '../modelClass/beneficiaryModelNGN.dart';
import '../modelClass/ngnbankModel.dart';
import '../modelClass/beneficiaryModel.dart';
import '../modelClass/ukBankModel.dart';
import '../modelClass/userProfileModel.dart';
import '../utils/tierMoney.dart';
import 'beneficiaryNGNController.dart';


class TaskProvider extends GetConnect{
  //user data fetch//
  Future getUserData()async{
    EasyLoading.show(status: "Loading...");

    try{
      String? token;
      token=await TierMoneyPreference().getString("token");
      var header={
        'Authorization':"Bearer " + "$token",
      };
      http.Response response =await http.post(Uri.parse(Constant.user_Profile),headers: header);
      if(response.statusCode==200||response.statusCode==201){
        print(response.statusCode);
        print(response.body);
        List<dynamic> dataOfUser=jsonDecode(response.body)['user'];
        return dataOfUser.map((e) =>User.fromJson(e)).toList();
      }
    }
    catch (e) {
      EasyLoading.showError("Oops!");
      if (e is SocketException) {
        showLongToast("Could not connect to internet");
      }
    }
  }
  Future<List<BeneficiaryModel>?> fetchBeneficiaries(page, search) async {

    var headers = {'Authorization': 'Bearer ' + Constant.token};
    try {
      var request = http.Request(
          'POST',
          Uri.parse(Constant.UKbeneficiaries+"?perPage=${Constant.perPage}&page=${page}"));
      request.headers.addAll(headers);
      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);
      print(jsonBody.toString());
      if (response.statusCode == 200) {
        List<dynamic> jsonbody1 = jsonBody['content'];
        List<BeneficiaryModel>? list = BeneficiaryModel.getListfromJson(jsonbody1);
        // List<BeneficiaryModel>? list1 = BeneficiaryModel.getListfromJson1(jsonbody1);
        // print(list1.toString());

        // list.sort();

        print(list.toString());
        return list;

      } else {
        EasyLoading.showError("No Benefiaries Added");
      }
    } catch (e) {
      if (e is SocketException) showLongToast("Could not connect to internet");
    }
  }
  Future<List<BeneficiaryNGNModel>?> fetchBeneficiariesNGN(page, search) async {

    var headers = {'Authorization': 'Bearer ' + Constant.token};
    try {
      var request = http.Request(
          'POST',
          Uri.parse(Constant.NGNbeneficiaries+"?perPage=${Constant.perPage}&page=${page}"));
      request.headers.addAll(headers);
      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);
      print(jsonBody.toString());
      if (response.statusCode == 200) {
        List<dynamic> jsonbody1 = jsonBody['content'];
        List<BeneficiaryNGNModel>? list = BeneficiaryNGNModel.getListfromJson(jsonbody1);

        return list;
      } else {
        EasyLoading.showError("No Benefiaries Added");
      }
    } catch (e) {
      if (e is SocketException) showLongToast("Could not connect to internet");
    }
  }
  Future<List<BankModel>?> fetchBankList(page, search) async {

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
        // List<dynamic> jsonbody1 = jsonBody['success']['bank_detail'];
        // List<BankModel>? list = BankModel.getListfromJson(jsonbody1);
        // return list;

      } else {
        EasyLoading.showError("No Banks Available");
      }
    } catch (e) {
      if (e is SocketException) showLongToast("Could not connect to internet");
    }
  }
  Future<List<UkModel>?> fetchBankUkList(page, search) async {

    try {
      var headers = {'Authorization': 'Bearer ' + Constant.token,'Content-Type': 'application/json',};
      var request = http.Request(
          'GET',
          Uri.parse(Constant.ukbanks));
      request.headers.addAll(headers);
      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);
      print(jsonBody.toString());
      if (response.statusCode == 200) {
        List<dynamic> jsonbody1 = jsonBody['success']['banks'];
        List<UkModel>? list = UkModel.getListfromJson(jsonbody1);
        return list;

      } else {
        EasyLoading.showError("No Banks Available");
      }
    } catch (e) {
      if (e is SocketException) showLongToast("Could not connect to internet");
    }
  }
}