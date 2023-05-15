import 'package:digital_banking/controller/ukBankController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bankController.dart';
import 'beneficiaryController.dart';
import 'beneficiaryNGNController.dart';



class NetworkBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<BeneficiaryController>(() => BeneficiaryController());
    Get.lazyPut<BeneficiaryNGNController>(() => BeneficiaryNGNController());
    Get.lazyPut<BankController>(() => BankController());
    Get.lazyPut<UkBankController>(() => UkBankController());
  }
}