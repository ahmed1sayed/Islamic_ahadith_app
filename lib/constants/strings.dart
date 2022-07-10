import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStrings {

  static Text splashScreen = Text("الأربعون النوويه"
    , style: GoogleFonts.tajawal(
        color: Colors.white,
        fontWeight: FontWeight.bold, fontSize: 36),);

  static Text topHomeScreen = Text(
    "الأربعون النوويه", textDirection: TextDirection.rtl,
    style: GoogleFonts.tajawal(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),);

  static Text headerHomeScreen = Text("لحفظ وسماع الأحاديث النوويه"
    , textDirection: TextDirection.rtl,style: GoogleFonts.tajawal(
        color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25),);


  static   Text bookOneScreen = Text("الأحاديث الاربعون",style: GoogleFonts.tajawal(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),);
  static   Text bookOneScreenGreen = Text("الأحاديث الاربعون",style: GoogleFonts.tajawal(
      color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25),);

  //============================================================================
  static   Text bookTwoScreen = Text("الإستماع للأحاديث",style: GoogleFonts.tajawal(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),);
  static   Text bookTwoScreenGreen = Text("الإستماع للأحاديث",style: GoogleFonts.tajawal(
      color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25),);
  //============================================================================

  static   Text bookThreeScreen = Text("الأحاديث المحفوظه",style: GoogleFonts.tajawal(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),);
  static   Text bookThreeScreenGreen = Text("الأحاديث المحفوظه",style: GoogleFonts.tajawal(
      color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25),);
  static   Text bookThreeCustom = Text("الإستماع",style: GoogleFonts.tajawal(
      color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),);
}