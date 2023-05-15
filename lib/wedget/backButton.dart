import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

 BackButtonAppBar(){
   return InkWell(
     onTap: () {
       Get.back();
     },
     child:Padding(
       padding: const EdgeInsets.fromLTRB(12.0,8,6,8),
       child: SvgPicture.asset(
         "assets/svg/backButton.svg",
       ),
     ),
   );
 }