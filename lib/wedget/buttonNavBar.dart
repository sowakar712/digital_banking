import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

 navBarButton({String? lable,Function? onPressed,Color? color,Widget? image}){
  return GestureDetector(
    onTap: (){
      onPressed!();
    },
    child:Column(
      children: [
        Expanded(
          flex: 0,
          child:Container(
            width: 31,
            height:53,
            child: image,
          ),
        ),
        Expanded(
          flex: 0,
            child: Text(lable!,style: GoogleFonts.quicksand(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),)
        )
      ],
    ),
  );
}

navBarButton1({String? lable,Function? onPressed,Color? color,Widget? image,}){
  return GestureDetector(
    onTap: (){
      onPressed!();
    },
    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 31,
          height:40,
          child: image,
        ),
        Text(lable!,style: GoogleFonts.openSans(fontWeight: FontWeight.bold,fontSize: 13,
            color: color
        ),)
      ],
    ),
  );
}



