import 'dart:io';
import 'dart:typed_data';
import 'package:digital_banking/screens/dashBoardPage/qrCodeScan/qrSummary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../wedget/textWedget.dart';

class QrCodeScanView extends StatefulWidget {
  const QrCodeScanView({Key? key}) : super(key: key);

  @override
  State<QrCodeScanView> createState() => _QrCodeScanViewState();
}

class _QrCodeScanViewState extends State<QrCodeScanView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller!.resumeCamera();
  //   } else if (Platform.isIOS) {
  //     controller!.resumeCamera();
  //   }
  // }



  Image? picker;
  Uint8List? img;
  File? image;
  XFile? photo;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // leading: IconButton(
        //     onPressed: () {
        //       Get.off(QrCodeGenerate());
        //     },
        //     icon: Icon(
        //       Icons.arrow_circle_left_rounded,
        //       color: Colors.white,
        //     )),
        actions: [
          IconButton(
              onPressed: () async {
                await controller?.toggleFlash();
                setState(() {});
              },
              icon: Icon(
                Icons.flash_on,
                color: Colors.white,
              )),
          // IconButton(
          //     onPressed: () async {
          //       photo = await _picker.pickImage(source: ImageSource.gallery);
          //       image = File(photo!.path);
          //       img = image?.readAsBytesSync();
          //     },
          //     icon: Icon(
          //       Icons.photo,
          //       color: Colors.white,
          //     )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderRadius: 10,
                borderLength: 20,
                borderWidth: 10,
                borderColor: Theme.of(context).toggleableActiveColor,
                cutOutSize: MediaQuery.of(context).size.width * 0.8,
              ),

            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0057FC),
                ),
                child: TextButton(
                  onPressed: () {
                    //Get.to(QrCodeScanView());
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: text1(
                              size: 16,
                              color: Color(0xFFFFFFFF),
                              text: 'Scanning...',
                              fontWeight: FontWeight.w600),
                      ),
                      Expanded(
                          child: Text("Align QR code to fill inside the frame",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white)))),

                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.resumeCamera();

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        print("Hi++++++++"+scanData.code.toString());
        // Get.off(QRSummary());
        // Get.to(SecurePinQRCode());
      });
    });
  }
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
