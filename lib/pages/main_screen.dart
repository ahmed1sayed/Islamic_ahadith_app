import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamic_app/constants/colors.dart';
import 'package:islamic_app/constants/strings.dart';
import 'package:islamic_app/cubit/app_cubit.dart';

import '../constants/app_widgits.dart';
import '../cubit/app_states.dart';

class MainScreen extends StatefulWidget {

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    var screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      body: Stack(
          alignment: Alignment.center,
          children: [
            backColor(1,2),
            SvgPicture.asset(color: AppColors.greenOpacity,
                "assets/images/96325.svg",
                width: double.maxFinite,
                fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(20.0),
                child: BlocConsumer<AppCubit,AppStates >(builder: (context,state){
                  return   Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    const SizedBox(height: 10,),
                    Center(child: SvgPicture.asset(
                      "assets/images/Group10.svg", height: 80, width: 80,)),
                    const SizedBox(height: 30,),

                    AppStrings.topHomeScreen,
                    const SizedBox(height: 5,),

                    AppStrings.headerHomeScreen,
                    const SizedBox(height: 50,),

                    InkWell(
                      onTap: () {AppCubit.get(context).mainItemsNav(1, context);},
                      child: homeCard(
                          AppColors.darkGreen,
                          AppColors.green,
                          AppStrings.bookOneScreen,
                          'assets/images/quran(3)@2x.svg',
                          'assets/images/Group11.svg',
                          screenHeight * .15,
                          screenWidth * .9),
                    ),
                    const SizedBox(height: 20,),
                    InkWell(
                      onTap: () {AppCubit.get(context).mainItemsNav(2, context);},
                      child: homeCard(
                          AppColors.red2,
                          AppColors.yellow1,
                          AppStrings.bookTwoScreen,
                          'assets/images/play@2x.svg',
                          'assets/images/Group33.svg',
                          screenHeight * .15,
                          screenWidth * .9),),
                    const SizedBox(height: 20,),

                    InkWell(
                        onTap: () {AppCubit.get(context).mainItemsNav(3, context);},
                        child: homeCard(
                            AppColors.red1,
                            AppColors.red2,
                            AppStrings.bookThreeScreen,
                            'assets/images/mythecond.svg',
                            'assets/images/therd1.svg',
                            screenHeight * .15,
                            screenWidth * .9)),
                  ],);}, listener: (context,state){}),

              ),

          ]
      ),);
  }
}


Widget homeCard( Color color1, Color color2, Text text, String imagePath1,
    String imagePath2,h,w,) =>
    Container(
height:h ,
      width: w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient( colors: [color1, color2],begin:Alignment.bottomLeft ,end:Alignment.centerRight )
      ),

      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        SvgPicture.asset(imagePath1,width:h*.7  ,height:h*.7 ),
        text,
        SvgPicture.asset(imagePath2, ),


      ]),
    );
