
import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:digital_banking/controller/task_provider.dart';
import 'package:digital_banking/modelClass/ukBankModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UkBankController extends GetxController {

  String search = "";
  var myList = <UkModel>[].obs;
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
    // paginateTask();
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
        TaskProvider().fetchBankUkList(page,search).then((resp) {
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

  // void paginateTask() {
  //   scrollController.addListener(() {
  //     if (scrollController.position.pixels ==
  //         scrollController.position.maxScrollExtent) {
  //       print("reach End");
  //       page++;
  //       getMoreTask(page);
  //     }
  //   });
  // }

  // Future<void> getMoreTask(var page) async {
  //   try {
  //     isMoreDataAvailable.value = true;
  //     await determinePosition().then((value) {
  //       position=value;
  //     });
  //     TaskProvider().fetchPartyNList(
  //       page,
  //       search,
  //       isnearby,
  //       position!.latitude,position!.longitude
  //     ).then((resp) {
  //       if (resp!.length > 0) {
  //         isMoreDataAvailable.value = false;
  //       } else {
  //         isMoreDataAvailable.value = false;
  //         showLongToast("No more item");
  //       }
  //       myList.addAll(resp);
  //     }, onError: (err) {
  //       isDataProcessing.value = false;
  //       showSnackbar("Error", err.toString(), Colors.red);
  //     });
  //   } catch (e) {
  //     isDataProcessing.value = false;
  //     showSnackbar("Exception", e.toString(), Colors.red);
  //   }
  // }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    scrollController.dispose();
  }

}
