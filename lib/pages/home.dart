import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic_app/constants/colors.dart';
import 'package:islamic_app/constants/strings.dart';
import 'package:islamic_app/cubit/app_cubit.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    AppCubit.get(context).splashHomeNav(context);
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.green,

      body: Stack(
        children: [
          SvgPicture.asset("assets/images/96325.svg", width: double.maxFinite,
              fit: BoxFit.cover),
          Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/home_back_ground_3.svg",),
                const SizedBox(height: 20,),
                AppStrings.splashScreen,


              ]),)
        ],
      ),);
  }
}