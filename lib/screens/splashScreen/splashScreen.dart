import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
         children: [
           Container(
             height: MediaQuery.of(context).size.height,
             width: MediaQuery.of(context).size.width,
             color:  Color(0xFFFFFFFFF),
           ),
           Padding(

             padding:  EdgeInsets.only(
                 // bottom:MediaQuery.of(context).size.width*0.6,
                 bottom:0,
             ),
             child: Align(
               alignment: Alignment.center,
               child:Image(
                 image: AssetImage("assets/images/splash.png",
                 ),
                 width:MediaQuery.of(context).size.width*0.7,
               ),
             ),
           ),
           // Container(
           //   alignment: Alignment.center,
           //   child: Column(
           //     children: [
           //       SizedBox(
           //         height: MediaQuery.of(context).size.height*0.35,
           //       ),
           //      const Image(
           //         image: AssetImage("assets/images/splash.png"),
           //       ),
           //       SizedBox(
           //         height: MediaQuery.of(context).size.height*0.10,
           //       ),
           //      Row(
           //        mainAxisAlignment: MainAxisAlignment.center,
           //        children: [
           //          Text("Digital Banking",style: GoogleFonts.quicksand(textStyle:const TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Color(0xFFFFFFFFF))))
           //        ],
           //      )
           //     ],
           //   ),
           // )
         ],
      ),
    );
  }
}
