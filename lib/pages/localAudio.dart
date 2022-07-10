/*

 import 'package:audioplayer/audioplayer.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/constants/colors.dart';

import '../cubit/model.dart';

class LocalAudio extends StatefulWidget {
  final Hadith hadith;
  final String localAudioPath;
  const LocalAudio({super.key, required this.localAudioPath, required this.hadith});

  @override
  _LocalAudio createState() =>  _LocalAudio();
}

class _LocalAudio extends State<LocalAudio> {
  Duration _duration =   const Duration();
  Duration _position =   const Duration();

  static final AudioPlayer  advancedPlayer =   AudioPlayer();
  final AudioCache  audioCache =   AudioCache(fixedPlayer: advancedPlayer);

  @override
  void initState() {
    super.initState();
    initPlayer();
  }
  @override

  void initPlayer() {
    advancedPlayer.durationHandler = (d) => setState(() {
      onError: (Exception exception) =>
          print('_loadFile => exception $exception');
      _duration = d;
    });

    advancedPlayer.positionHandler = (p) => setState(() {
      _position = p;
    });
  }

  String? localFilePath;

  Widget _tab(List<Widget> children) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Icon(Icons.add_shopping_cart,color:Colors.cyan,size: 250),

        slider(),
        Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: children
                .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
                .toList(),
          ),
        ),
      ],
    );
  }

  //// test
  VoidCallback onPressedplypus(){
    bool bol=true;
    if(bol){
      audioCache.play("path");
      _btn(Icon(Icons.play_arrow), () => advancedPlayer.pause());
    }else{
      bol=false;
      advancedPlayer.pause();
      _btn(Icon(Icons.pause), () => advancedPlayer.pause());
    }

  }
  Widget _btn(Icon icon, VoidCallback onPressed) {
    return ButtonTheme(
      minWidth: 50.0,
      child: Container(
        width: 70,
        height: 50,
        child: ElevatedButton(style:    ButtonStyle(backgroundColor:Colors.black45 as MaterialStateProperty<Color?>?,
        ),
            textColor: AppColors.yellow1,


            onPressed: onPressed,

            child: icon),
      ),
    );
  }

  Widget slider() {
    return Slider(
        activeColor: AppColors.yellow1,
        inactiveColor: Colors.black45,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  Widget LocalAudio( String path) {

    return _tab([
      _btn(const Icon(Icons.play_arrow), () => audioCache.play(path)),
      _btn(const Icon(Icons.pause), () => advancedPlayer.pause()),
      _btn(const Icon(Icons.stop), () => advancedPlayer.stop()),
    ]);
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Container(

      decoration: const BoxDecoration(
        // assets/ryan.jpg
        image: DecorationImage(image: AssetImage("assets/aa.jpg"), fit: BoxFit.cover),
      ),
      child:    LocalAudio(widget.localAudioPath),


    ),) ;
  }

}
*/
