
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/cubit/app_cubit.dart';

import '../constants/app_widgits.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';

class RunAudio extends StatefulWidget {
  late int index;
   RunAudio({Key? key,required this.index}) : super(key: key);

  @override
  State<RunAudio> createState() => _RunAudioState();
}

class _RunAudioState extends State<RunAudio> {
 late AudioPlayer audioPlayer;
  late AudioCache audioCache;
   Duration currentPosition=const Duration();
   Duration audioLength=const Duration();

 bool isPlaying=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer=AudioPlayer();
    audioCache=AudioCache(fixedPlayer: audioPlayer);
    setUp();
  }  setUp() {
   audioPlayer.onAudioPositionChanged.listen((d) { setState((){currentPosition=d;});});
   audioPlayer.onDurationChanged.listen((d) { setState((){audioLength=d;});});

 }
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
                  children: [
                    const SizedBox(height: 20,),

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
                            onPressed: ( ){
                              audioPlayer.pause();
                              Navigator.pop(context);}, icon:const Icon(Icons.arrow_forward_ios))
                      ],
                    ),        const SizedBox(height: 25,),

                    Padding(
                      padding: const EdgeInsets.only(right: 13.0),

                      child:  Text(AppCubit.get(context).listhadiths[widget.index].nameHadith,
                        style: GoogleFonts.tajawal(
                            color: Colors.green,fontSize: 25,
                            fontWeight: FontWeight.bold),)

                    ),
                    const SizedBox(height: 30,),

                    const SizedBox(height: 5,),
                    Expanded(
                      child:   Column(

                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [                      const SizedBox(height: 20,),
                          Center(
                            child: SvgPicture.asset(
                              "assets/images/Group31.svg",
                              fit: BoxFit.cover,width: 250,height: 250,),
                          ),                    const SizedBox(height: 30,),
                          Padding(
                              padding: const EdgeInsets.only(right: 13.0),

                              child:  Text(AppCubit.get(context).listhadiths[widget.index].key,
                                style: GoogleFonts.tajawal(
                                    color: Colors.black,fontSize: 15,
                                    ),)

                          ),
                         Padding(
                            padding: const EdgeInsets.only(right: 13.0),

                            child:  Text(AppCubit.get(context).listhadiths[widget.index].nameHadith,
                              style: GoogleFonts.tajawal(
                                  color: Colors.green,fontSize: 25,
                                  fontWeight: FontWeight.bold),)

                        ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                              Text(currentPosition.inSeconds.toString(),style: GoogleFonts.tajawal( ),),
                              SizedBox(width: 350,child: Slider(thumbColor: Colors.amber,activeColor: Colors.amber,inactiveColor: Colors.black12,value: currentPosition.inSeconds.toDouble(), max:audioLength.inSeconds.toDouble() ,onChanged: (val){
                                seekTo((val.toInt()));

                              })),
                              Text(audioLength.inSeconds.toString(),style: GoogleFonts.tajawal( ),),


                            ],),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(onPressed: ( ){
                                if(currentPosition.inSeconds==0||currentPosition.inSeconds<10){
                                  seekTo(0);
                                }else if(currentPosition.inSeconds>10){
                                  seekTo(currentPosition.inSeconds-10);

                                }

                              }, icon: const Icon(Icons.first_page,),iconSize:35,),
                              IconButton(onPressed: ( ){
                                setState((){
                                  isPlaying=!isPlaying;
                                  isPlaying?playMusic(AppCubit.get(context).listhadiths[widget.index].audioHadith):stopMusic();
                                }

                                );}, icon:isPlaying?const Icon(Icons.pause,):const Icon(Icons.play_arrow),iconSize:35,),
                              IconButton(onPressed: ( ){
                                if(currentPosition<audioLength-const Duration(seconds: 10)){
                                  seekTo(currentPosition.inSeconds+10);
                                }else{
                                  setState((){
                                    isPlaying=false;
                                    stopMusic();
                                  });
                                }
                              }, icon:const Icon(Icons.last_page,),iconSize:35,),

                            ],
                          )


                        ],
                      ),
                    )
                  ]),)])

    );
  }
 playMusic(String item){
   audioCache.play('audio/'+item);
 }
 stopMusic(){
   audioPlayer.pause();

 }
 seekTo(int sec){
    audioPlayer.seek( Duration(seconds: sec));

 }
  
}
