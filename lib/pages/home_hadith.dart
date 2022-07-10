

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/constants/colors.dart';
import 'package:islamic_app/cubit/app_cubit.dart';
import 'package:islamic_app/pages/run_audio.dart';
 import 'package:share_plus/share_plus.dart';

import '../constants/app_widgits.dart';
 import '../cubit/app_states.dart';
import '../cubit/model.dart';

class HomeHadith extends StatefulWidget {
  final Map  hadith;
final int index;
  const HomeHadith({super.key, required this.hadith,required this.index});

  @override
  State<StatefulWidget> createState() {
    return HomeHadithState();
  }
}

class HomeHadithState extends State<HomeHadith> {
 var controller= ScrollController();
 var scrollKey= const Key('hh');
 var key= GlobalKey<ScaffoldState>();
  bool bol = true;
 bool isUpdate = true;

//boolean used to handle container animation which expands from the FAB


  @override

  void initState() {
    // TODO: implement initState
/*
    AppCubit.get(context). updateTabSelection(0, widget.hadith.textHadith);
*/
    super.initState();

    controller.addListener(() {
      if(controller.position.userScrollDirection==ScrollDirection.reverse){
        setState((){bol=false;});
      }else{
        setState((){bol=true;});      }

    });
   }



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(builder: (context, state) {

       return Scaffold(key: key,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black38,
          onPressed: () {

            //          Share text
            Share.share(widget.hadith['textHadith'], subject: widget.hadith['nameHadith']);
          },
          tooltip: "Centre FAB",
          elevation: 4.0,
          child: Container(
            margin: const EdgeInsets.all(15.0),            child: const Icon(Icons.share),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation
            . miniCenterFloat,
        body:/*AppCubit.get(context).hadithModel!=null?*/ Stack(
          alignment: Alignment.center,
          children: [
            backColor(1, 3),
            SvgPicture.asset(color: AppColors.greenOpacity,
                "assets/images/96325.svg",
                width: double.maxFinite,
                fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ const SizedBox(height: 20,),

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
                          onPressed: () {AppCubit.get(context).selectedIndex=0;
                          isUpdate=false;
                            Navigator.pop(context);
                          }, icon: const Icon(Icons.arrow_forward_ios))
                    ],
                  ), const SizedBox(height: 20,),

                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: IconButton(onPressed: ()  {
                          if(isUpdate){
                            AppCubit.get(context).updateDatabase(status: 'saved', id: widget.hadith['id']);

                            isUpdate=false;}  else{  AppCubit.get(context).updateDatabase(status: 'status', id: widget.hadith['id']);
                          isUpdate=true;
                          print('tmm');}

                  /*           ScaffoldMessenger.of(context).showSnackBar(

                              SnackBar( duration: const Duration(seconds: 1),

                           content: SizedBox(
                           height: 25
                           ,child: Center(
                             child: Text(
                               'تم الحفظ بنجاح',
                               style: GoogleFonts.tajawal(fontSize: 20),),
                           ),
                         ),
                         key: key,
                         backgroundColor: Colors.black38,
                         dismissDirection: DismissDirection.startToEnd,))  ;*/

                         },icon :isUpdate?const Icon(
                          Icons.bookmarks_outlined, size: 40,color: Colors.amber,): const Icon(
                          Icons.bookmarks_rounded, size: 40,color: Colors.amber,)),
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.end,
                        children: [ Padding(
                          padding: const EdgeInsets.only(right: 13.0),

                          child: Text(
                            widget.hadith['key'], style: GoogleFonts.tajawal(
                              fontSize: 20, fontWeight: FontWeight.bold)
                            ,),
                        ), const SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(right: 13.0),

                            child: Text(widget.hadith['nameHadith'],
                                style: GoogleFonts.tajawal(color: Colors.green,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ],
                  ), const SizedBox(height: 5,),
                  if(bol)
                   Container(width: 300,
                     height: 45,
                     decoration: BoxDecoration(color: Colors.green,
                       borderRadius: BorderRadius.circular(50),


                     ),

                     margin: const EdgeInsets.only(left: 12.0, right: 12.0),
                     child: Row(
                       mainAxisSize: MainAxisSize.max,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: <Widget>[//AppCubit.get(context). updateTabSelection
                         customRowItem( context, widget.hadith['textHadith'],0,  Icons.book,(){AppCubit.get(context). updateTabSelection(0, widget.hadith['textHadith']);}),
                         customRowItem(  context, widget.hadith['translateNarrator'], 1,  Icons.library_books,(){AppCubit.get(context). updateTabSelection(1, widget.hadith['translateNarrator']);}),
                         customRowItem(  context, widget.hadith['explanationHadith']??'', 2, Icons.collections_bookmark,(){AppCubit.get(context). updateTabSelection(2, widget.hadith['explanationHadith']);}),
                         customRowItem(  context, widget, 3, Icons.volume_up,(){Navigator.push(context, MaterialPageRoute(builder: (context)=>RunAudio(index:widget.index)));}),
                       ],
                     ),
                   ),

                  Expanded(

                    child: SingleChildScrollView(key: scrollKey,controller: controller,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.end,

                        children: [
                          const SizedBox(height: 15,),
                         if (widget.hadith!=null)
                           AppCubit.get(context).convertHadith(context, AppCubit.get(context).txt??widget.hadith['textHadith']) else
                             const Center(child: CircularProgressIndicator(color: Colors.amber,),),
                        ],
                      ),
                    ),
                  ),

                ],
              ),)
          ],
        )/*:const Center(child: Text('jkfdgikjldfng'),)*/,

      );
    }, listener: (context, state) { })
    ;
  }

}Widget customRowItem( context,widget,selectedIndex, icon, void Function()? onPress){
  return         IconButton(
    //update the bottom app bar view each time an item is clicked
    onPressed:   onPress,
    iconSize: 27.0,
    icon: Icon(
      icon,
      //darken the icon if it is selected or else give it a different color
      color: AppCubit.get(context).selectedIndex == selectedIndex
          ? AppColors.yellow1
          : Colors.white,
    ),
  );
}
