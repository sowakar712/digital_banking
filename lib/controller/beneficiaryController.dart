
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:digital_banking/Components/Constant.dart';
import 'package:digital_banking/controller/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:digital_banking/modelClass/beneficiaryModel.dart';
import 'package:http/http.dart' as http;

class BeneficiaryController extends GetxController {

  String search = "";
  var myList = <BeneficiaryModel>[].obs;
  // List<BeneficiaryModel> myList = <BeneficiaryModel>[].obs;
  var page = 1;
  var isDataProcessing = false.obs;
  var isnearby = true;

  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = false.obs;
  int currentPage = 1;
  StreamSubscription? subscription;
  var isoffline = false.obs;


  bool? checkNetwork() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        isoffline.value = true;
      } else if (result == ConnectivityResult.mobile) {
        isoffline.value = false;
      } else if (result == ConnectivityResult.wifi) {
        isoffline.value = false;
      } else {
        Get.snackbar("Network Error", "Failed to get network connection");
        isoffline.value = true;
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTask(page);
    checkNetwork();
    paginateTask();
  }

  void updateData(search) {
    print("Hello");
    this.search = search;
    page = 1;
    getTask(page);
  }

  Future<void> getTask(var page) async {
    try {
      isDataProcessing.value = true;

      if (isoffline.value == false) {
        TaskProvider().fetchBeneficiaries(page,search).then((resp) {
          if(resp!=null){
            print("Hello ++++++++"+resp.length.toString());
            print(resp[0].toJson());
            isDataProcessing.value = false;
            myList.clear();
            myList.addAll(resp!);



          }

        }, onError: (err) {
          isDataProcessing.value = false;
          showSnackbar("Error", err.toString(), Colors.red);
        });
      }
    } catch (e) {
      isDataProcessing.value = false;
      showSnackbar("Exception", e.toString(), Colors.red);
    }
  }

  showSnackbar(title, message, color) {
    Get.snackbar(title, message,
        colorText: Colors.white, backgroundColor: color);
  }
  void paginateTask() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("reach End");
        page++;
        getMoreTask(page);
      }
    });
  }
  Future<void> getMoreTask(var page) async {
    try {
      isMoreDataAvailable.value = true;

      TaskProvider().fetchBeneficiaries(page,search).then((resp) {
        if (resp!.length > 0) {
          isMoreDataAvailable.value = false;
        } else {
          isMoreDataAvailable.value = false;
          showLongToast("No more item");
        }
        myList.addAll(resp);
      }, onError: (err) {
        isDataProcessing.value = false;
        showSnackbar("Error", err.toString(), Colors.red);
      });
    } catch (e) {
      isDataProcessing.value = false;
      showSnackbar("Exception", e.toString(), Colors.red);
    }
  }
  Future DeleteBeneficiary(id) async {
    EasyLoading.show(status: "Loading...");
    var headers = {'Authorization': 'Bearer ' + Constant.token};
    try {
      var request = http.Request(
          'DELETE',
          Uri.parse(Constant.DeleteBeneficiary+"${id}"));
      request.headers.addAll(headers);
      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);
      print(jsonBody.toString());

      if (response.statusCode == 200) {
        EasyLoading.showSuccess("User Deleted Successfully");
        myList.removeWhere(((item) => item.id == id));
      } else {
        EasyLoading.showError("Oops Delete Failed!");
      }
    } catch (e) {
      if (e is SocketException) showLongToast("Could not connect to internet");
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    scrollController.dispose();
  }

}
