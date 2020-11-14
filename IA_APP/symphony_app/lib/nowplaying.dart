import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:like_button/like_button.dart';

class NowPlaying extends StatefulWidget {

  final String songName;
  final String imglocation;
  final String detail;
  const NowPlaying({
    Key key,
    this.songName,
    this.imglocation,
    this.detail,
  });

  @override
  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {

  Future<bool> onLikeButtonTapped(bool isLiked) async{
    return !isLiked;
  }

  void popfromnavigator(param){
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
      SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                    children: [
                  GestureDetector(
                      child: Icon(Icons.arrow_back_ios, size: 30, color: Colors.black45,),
                    onTap:(){
                        popfromnavigator(context);
              }),
                      Spacer(),
                      LikeButton(onTap: onLikeButtonTapped),
                    ]),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child:ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        widget.imglocation,
                        height: 350,
                        fit: BoxFit.cover,
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child:Column(
                      children: [
                        Text(
                            widget.songName,
                            style:TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black)
                        ),

                        Text(
                            widget.detail, style: TextStyle(color:Colors.black, fontSize: 20))],)
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Row(
                      children:[
                        Text("1:20"),
                        Flexible(
                            flex:1,
                            child:Slider(
                              activeColor: Colors.blue[800],
                              onChanged: (v){},
                              max: 100,
                              min:0,
                              value:20,
                            )
                        ),
                        Text("5:50"),
                      ]
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                        Icons.arrow_left,
                        size:70
                    ),
                    SizedBox(width: 20,),
                    Icon(
                        Icons.pause_circle_outline,
                        size: 60
                    ),
                    SizedBox(width: 20,),
                    Icon(
                        Icons.arrow_right,
                        size: 70)
                  ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


