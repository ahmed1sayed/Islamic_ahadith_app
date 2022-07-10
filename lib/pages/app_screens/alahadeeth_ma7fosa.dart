import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/cubit/app_cubit.dart';
import 'package:islamic_app/cubit/app_states.dart';

import '../../constants/app_widgits.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../cubit/model.dart';
import '../home_mahfosat.dart';

class ThirdItem extends StatefulWidget {
  const ThirdItem({Key? key}) : super(key: key);

  @override
  State<ThirdItem> createState() => _ThirdItemState();
}

class _ThirdItemState extends State<ThirdItem> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(builder:(context,state){

      return Scaffold(


          body: Stack(
              alignment: Alignment.center,
              children: [
                backColor(1,4),
                SvgPicture.asset(color: AppColors.greenOpacity,
                    "assets/images/96325.svg",
                    width: double.maxFinite,
                    fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [                    const SizedBox(height: 20,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 170,),
                                SvgPicture.asset(
                                    "assets/images/Group27.svg",
                                    fit: BoxFit.cover),
                              ],
                            ),

                            IconButton(
                                onPressed: ( ){Navigator.pop(context);}, icon:const Icon(Icons.arrow_forward_ios))
                          ],
                        ),        const SizedBox(height: 25,),

                        Padding(
                          padding: const EdgeInsets.only(right: 13.0),

                          child: AppStrings.bookThreeScreenGreen,
                        ),
                        const SizedBox(height: 30,),

                        Center(
                          child: Container(
                            height: 55,
                            width: 340,
                            decoration:BoxDecoration(
                                color: Colors.white,
                                border: Border.all(width: 1,),
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [ Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 60,
                                    width: 150,
                                    decoration:BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                    child:
                                    AppStrings.bookThreeCustom,),),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                        alignment: Alignment.center,
                                        height: 60,
                                        width: 180,
                                        decoration:BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(50)
                                        ),
                                        child: AppStrings.bookOneScreen),
                                  ),


                                ]),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Expanded(
                          child:AppCubit.get(context).favorList.isNotEmpty?SingleChildScrollView(

                            child: GridView.count(
                              mainAxisSpacing: 1,
                              crossAxisSpacing: 0,
                              crossAxisCount:2,
                              childAspectRatio: 1/1,

                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: List.generate( AppCubit.get(context).favorList.length,
                                      (index) => InkWell(onTap: (){  Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeMahfozat(
                                                      hadith: AppCubit
                                                          .get(context).favorList[index],index:index)));}, child: buildProductsItem(AppCubit.get(context).favorList[index]  ))),

                            ),
                          ):  Center(child: Text('لا يوجد احاديث محفوظة',style: GoogleFonts.tajawal(fontSize: 30),),),
                        )
                      ]),)])
      );
    }, listener: (context,state){});
  }
}
Widget buildProductsItem(Map hadithModel)=>Stack(
  alignment: Alignment.center,
  children: [
    SvgPicture.asset('assets/images/Path40.svg',height: 180,width: 180,),
    SvgPicture.asset('assets/images/Path41.svg',height: 180,width: 180,),
    Center(
      child:   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(hadithModel['key'],style: GoogleFonts.tajawal(color: Colors.amber),),
          Text(hadithModel['nameHadith'],style: GoogleFonts.tajawal(color: Colors.amber),),


        ],
      ),
    ),
  ],
);