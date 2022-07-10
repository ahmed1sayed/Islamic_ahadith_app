import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_widgits.dart';
import '../constants/colors.dart';
import '../cubit/app_cubit.dart';
import '../cubit/app_states.dart';
import '../cubit/cach_helper.dart';
import 'home.dart';

class InsertScreen extends StatefulWidget {
  const InsertScreen({Key? key}) : super(key: key);

  @override
  State<InsertScreen> createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(builder: (context, state) {
      return  Scaffold(
        body: Stack(
            alignment: Alignment.center,
            children: [
              backColor(1,2),
              SvgPicture.asset(color: AppColors.greenOpacity,
                  "assets/images/96325.svg",
                  width: double.maxFinite,
                  fit: BoxFit.cover),
          Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [                const SizedBox(height: 50,),
              Center(child: SvgPicture.asset(
                "assets/images/Group10.svg", height: 120, width: 120,)),
              const SizedBox(height: 120,),
              Text('إبدأ الاستخدام', textDirection: TextDirection.rtl,
                style: GoogleFonts.tajawal(
                    color: Colors.green,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),)
              ,
              const SizedBox(height: 30,),
              Center(
                child: Container(
                  decoration: BoxDecoration(color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                  ),
                  width: 180,
                  height: 55,
                   child: TextButton(  onPressed: () {
                    AppCubit
                        .get(context)
                        .listhadiths
                        .forEach((element) async {
                      await AppCubit.get(context).insertDatabase(
                          key: element.key,
                          nameHadith: element.nameHadith,
                          textHadith: element.textHadith,
                          explanationHadith: element.explanationHadith,
                          translateNarrator: element.translateNarrator,
                          audioHadith: element.audioHadith);
                    });
                    CacheHelper.saveData(key: 'Inserted', value: true).then((value) => Navigator.of(context).
                    pushReplacement(MaterialPageRoute(builder: (context)=>const HomeScreen())));
                  },
                      child: Text('إبدأ', textDirection: TextDirection.rtl,
                        style: GoogleFonts.tajawal(
                            color: Colors.green,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),)),
                ),
              )
            ],
          ),

            ]
        ),);
    }, listener: (context, state) {});
  }

}