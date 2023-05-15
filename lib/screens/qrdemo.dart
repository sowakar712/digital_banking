import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQR extends StatefulWidget {
  @override
  _GenerateQRState createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {

  String qrData="https://github.com/ChinmayMunje";
  final qrdataFeed = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar having title
      appBar: AppBar(
        title: Center(child: Text("Generate QR Code")),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(

          //Scroll view given to Column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width:MediaQuery.of(context).size.width/3.5,
                    decoration: BoxDecoration(
                      // color: Colors.black,

                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFF0057FC),

                      ),
                      shape: BoxShape.rectangle,
                    ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8,8,8,0),
                          child: QrImage(
                              padding: EdgeInsets.zero,
                              data: qrData,
                              size: 100),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

