import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

text({String? text,Color? color,double? size,FontWeight? fontWeight}){
  return AutoSizeText(
    text??"",
    style: GoogleFonts.quicksand(
      fontSize: size,
      fontWeight: fontWeight,
      color: color
    ),
  );
}
text1({String? text,Color? color,double? size,FontWeight? fontWeight,TextAlign? textAlign,TextDecoration? textdecoration,double? height,}){
  return AutoSizeText(
    text??"",
    textAlign: textAlign,

    style: GoogleFonts.openSans(
      height: height,
      fontSize: size,
      fontWeight: fontWeight,

      color: color,
      decoration: textdecoration,
      decorationStyle: TextDecorationStyle.solid,
// <-- SEE HERE

    ),
  );
}