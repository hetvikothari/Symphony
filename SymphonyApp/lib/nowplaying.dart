import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:like_button/like_button.dart';

class NowPlaying extends StatefulWidget {
 String songName;
 String imglocation;
 String detail;
 String songlocation;
 NowPlaying({
    Key key,
    this.songName,
    this.imglocation,
    this.detail,
    this.songlocation,
  });

  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  bool playing = false;
  IconData playbtn = Icons.play_arrow;

  AudioPlayer _player;
  AudioCache cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  Widget slider() {
    return Container(
        width: 300.0,
        child: Slider.adaptive(
            activeColor: Colors.black,
            inactiveColor: Colors.grey[350],
            value: position.inSeconds.toDouble(),
            max: musicLength.inSeconds.toDouble(),
            onChanged: (value) {
              seektosec(value.toInt());
            }));
  }

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);
    _player.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };
    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };
    // cache.load("Behti-Hawa-Sa-Tha-Woh-Shaan,Shantanu-Moitra.mp3");
  }

  void seektosec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    return !isLiked;
  }

  void popfromnavigator(param) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          // decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //         begin: Alignment.topLeft,
          //         end: Alignment.bottomRight,
          //         colors: [
          //           Colors.blue[800],
          //           Colors.blue[200],
          //         ],
          //     )
          // ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(children: [
                  GestureDetector(
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.black45,
                      ),
                      onTap: () {
                        popfromnavigator(context);
                         _player.pause();
                          setState(() {
                            playbtn = Icons.play_arrow;
                            playing = false;
                          });
                      }),
                  Spacer(),
                  Text(
                    "Now Playing",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Spacer(),
                  LikeButton(onTap: onLikeButtonTapped),
                ]),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        widget.imglocation,
                        height: 350,
                        fit: BoxFit.cover,
                      )),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Text(widget.songName,
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Text(widget.detail,
                            style: TextStyle(color: Colors.black, fontSize: 20))
                      ],
                    )),
                // Expanded(
                //   child: Container(

                //     decoration:BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.only(
                //         topLeft:Radius.circular(30),
                //         topRight: Radius.circular(30),
                //       )
                //     ),
                //     ),
                //     ),

                Container(
                  width: 600.0,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                            "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),),

                        slider(),
                        Text(
                            "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),),
                            
                        //   Text("1:20"),
                        //   Flexible(
                        //       flex:1,
                        //       child:Slider(
                        //         activeColor: Colors.blue[800],
                        //         onChanged: (v){},
                        //         max: 100,
                        //         min:0,
                        //         value:20,
                        //       )
                        //   ),
                        //   Text("5:50"),
                      ]),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 45.0,
                      color: Colors.black,
                      onPressed: () {
                      _player.pause();
                          setState(() {
                    _player.durationHandler = (d) {
                      setState(() {
                        musicLength = d;

                    });
                        };
                     _player.positionHandler = (p) {
                    setState(() {
                       position = p;
                        });
                          };                            
                            playbtn = Icons.play_arrow;
                            playing = false;                            
                            playbtn = Icons.play_arrow;
                            playing = false;
                            widget.songName='Matargashti';
                            widget.imglocation='assets/tamasha.jpg';
                            widget.songlocation='Matargashti_-_Tamasha_Song_(Bestwap.in)';
                            widget.detail='Tamasha';
                          });
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => NowPlaying(
                        //       songName: 'Matargashti',
                        //       imglocation: 'assets/tamasha.jpg',
                        //       detail: 'Tamasha',
                        //       songlocation:
                        //           'Matargashti_-_Tamasha_Song_(Bestwap.in)',
                        //     ),
                        //   ),
                        // );
                        // var obj = new NowPlaying();
                        // obj.songName = 'Matargashti';
                        // obj.imglocation = 'assets/tamasha.jpg';
                        // obj.detail = 'Tamasha';
                        // obj.songlocation = 'Matargashti_-_Tamasha_Song_(Bestwap.in)';

                      },
                      icon: Icon(
                        Icons.skip_previous,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      iconSize: 62.0,
                      color: Colors.black,
                      onPressed: () {
                        if (!playing) {
                          cache.play("songs/${widget.songlocation}.mp3");
                          setState(() {
                            playbtn = Icons.pause;
                            playing = true;
                          });
                        } else {
                          _player.pause();
                          setState(() {
                            playbtn = Icons.play_arrow;
                            playing = false;
                          });
                        }
                      },
                      icon: Icon(
                        playbtn,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      iconSize: 45.0,
                      color: Colors.black,
                      onPressed: () {
                      _player.pause();
                          setState(() {
                    _player.durationHandler = (d) {
                      setState(() {
                        musicLength = d;

                    });
                        };
                     _player.positionHandler = (p) {
                    setState(() {
                       position = p;
                        });
                          };                            
                            playbtn = Icons.play_arrow;
                            playing = false;
                            widget.songName='Maahi Ve';
                            widget.imglocation='assets/highway.jpg';
                            widget.songlocation='Maahi-Ve-A.R.-Rahman';
                            widget.detail='Highway';
                          });                        
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => NowPlaying(
                        //       songName: 'Maahi Ve',
                        //       imglocation: 'assets/highway.jpg',
                        //       detail: 'Highway',
                        //       songlocation: 'Maahi-Ve-A.R.-Rahman',
                        //     ),
                        //   ),
                        // );
                        // var obj = new NowPlaying();
                        // obj.songName = 'Maahi Ve';
                        // obj.imglocation = 'assets/highway.jpg';
                        // obj.detail = 'Highway';
                        // obj.songlocation = 'Maahi-Ve-A.R.-Rahman';                        
                      },
                      icon: Icon(
                        Icons.skip_next,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
