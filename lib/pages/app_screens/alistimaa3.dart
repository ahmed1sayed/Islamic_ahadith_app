import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/cubit/app_cubit.dart';
import 'package:islamic_app/pages/run_audio.dart';
import '../../constants/app_widgits.dart';
import '../../constants/colors.dart';

import '../../constants/strings.dart';
import '../../cubit/model.dart';

class SecondItem extends StatefulWidget {

  const SecondItem({Key? key}) : super(key: key);

  @override
  State<SecondItem> createState() => _SecondItemState();
}

class _SecondItemState extends State<SecondItem> {
  @override
  Widget build(BuildContext context) {
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
                              onPressed: ( ){   Navigator.pop(context);}, icon:const Icon(Icons.arrow_forward_ios))
                        ],
                      ),        const SizedBox(height: 25,),

                      Padding(
                        padding: const EdgeInsets.only(right: 13.0),

                        child: AppStrings.bookTwoScreenGreen ,
                      ),
                      const SizedBox(height: 15,),
                      Expanded(
                        child: SingleChildScrollView(

                          child: GridView.count(
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 0,
                            crossAxisCount:2,
                            childAspectRatio: 1/1,

                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: List.generate(   AppCubit.get(context).listhadiths.length,
                                    (index) => GestureDetector(onTap: (){Navigator.push(
                                        context, MaterialPageRoute(
                                        builder: (context)=>RunAudio(index:index)));},child: buildProductsItem(AppCubit.get(context).listhadiths[index] ))),

                          ),
                        ),
                      )
                    ]),)])
    );  }
}
Widget buildProductsItem(Hadith hadithModel)=>Stack(
  alignment: Alignment.center,
  children: [
    SvgPicture.asset('assets/images/Path40.svg',height: 180,width: 180,),
    SvgPicture.asset('assets/images/Path41.svg',height: 180,width: 180,),
    Center(
      child:   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(hadithModel.key,style: GoogleFonts.tajawal(color: Colors.amber),),
          Text(hadithModel.nameHadith,style: GoogleFonts.tajawal(color: Colors.amber),),


        ],
      ),
    ),
  ],
);