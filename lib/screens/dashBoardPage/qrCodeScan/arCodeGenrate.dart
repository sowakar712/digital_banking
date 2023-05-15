import 'package:digital_banking/screens/dashBoardPage/dashBordPage/dashBoardPage.dart';
import 'package:digital_banking/screens/dashBoardPage/qrCodeScan/qrCodeScanView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeGenerate extends StatefulWidget {
  const QrCodeGenerate({Key? key}) : super(key: key);

  @override
  State<QrCodeGenerate> createState() => _QrCodeGenerateState();
}

class _QrCodeGenerateState extends State<QrCodeGenerate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:Colors.white,

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex:0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Scan QR code",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:35,fontWeight: FontWeight.bold,color: Color(0xFFF0057FC)))),
              ],
            ),
          ),
          SizedBox(height:20),
          Expanded(
            flex:3,
            child: Container(
              alignment:Alignment.center,
              child: QrImage(
                data:"https://in.linkedin.com/company/smi-infotech",
                version: QrVersions.auto,
                size:300.0,
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 97,
                decoration: BoxDecoration(
                  color:const Color(0xFFF0057FC),
                ),
                child:TextButton(
                  onPressed: (){
                    Get.off(QrCodeScanView());
                  },
                  child:Text("Scanning",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:25,fontWeight: FontWeight.normal,color: Color(0xFFFD2E2FF)))),
                )
            ),
          ),
        ],
      ),
    );
  }
}
