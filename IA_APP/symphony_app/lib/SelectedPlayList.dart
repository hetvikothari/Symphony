import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:like_button/like_button.dart';

import 'utilities.dart';
import 'nowplaying.dart';
import 'playlist.dart';

class CustomPlaylist extends StatefulWidget {

  final String pname;
  final String pdesc;
  final Function callback;

  const CustomPlaylist({
    Key key,
    this.pname,
    this.pdesc,
    this.callback,
  });

  @override
  _CustomPlaylistState createState() => _CustomPlaylistState();
}

class _CustomPlaylistState extends State<CustomPlaylist> {


  Future<bool> onLikeButtonTapped(bool isLiked) async{
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return  Flexible(
        child: Column(
          children: [
            Container(
                margin:  EdgeInsets.all(1.0),
                padding: EdgeInsets.all(1.0),
                /*decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 6.0, color: Colors.lightBlue.shade900),
                  ),
                )*/
                child: Column(
                  children: [
                    Row(
                      children: [

                        GestureDetector(
                            child: Icon(Icons.arrow_back_ios, size: 30, color: Colors.blue[900],),
                            onTap:(){
                              widget.callback();
                            }),


                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            widget.pname,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontFamily: 'RockWell',
                              fontSize: 35,
                              color: Colors.black,
                              letterSpacing: 3.0,

                            ),


                          ),
                        ),



                      ],
                    ),

                    Text(
                      widget.pdesc,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontFamily: 'RockWell',
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 4.0,

                      ),
                      textAlign: TextAlign.center,

                    ),

                  ],
                )

            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Divider(color: Colors.black),
                  SizedBox(height: 15),
                  GestureDetector(
                      child: getPlayListItem('Tum ho', 'Rockstar / 4:03 ','rockstar.jpg'),
                      onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                          songName:'Tum ho',
                          imglocation:'assets/rockstar.jpg',
                          detail:'Rockstar / 4:03 '),
                      ),
                      );

                      }),
                  SizedBox(height: 15),
                  Divider(color: Colors.black),
                  SizedBox(height: 15,),
                  GestureDetector(
                      child: getPlayListItem('Maahi Ve', 'Highway / 3:33','highway.jpg'),
                      onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                          songName:'Maahi Ve',
                          imglocation:'assets/highway.jpg',detail:'Highway / 3:33'),
                      ),
                      );

                      }),
                  SizedBox(height: 15,),
                  Divider(color: Colors.black),
                  SizedBox(height: 15,),
                  GestureDetector(
                      child: getPlayListItem('All of me ', 'John Legend / 2:23', 'null.webp'),
                      onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                          songName:'All of me ',
                          imglocation:'assets/null.webp',detail:'John Legend / 2:23'),
                      ),
                      );

                      }),
                  SizedBox(height: 15,),
                  Divider(color: Colors.black),
                  SizedBox(height: 15,),
                  GestureDetector(
                      child: getPlayListItem('Roobaroo', 'Rang de Basanti / 3:21','rangde.jpg'),
                      onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                          songName:'Roobaroo',
                          imglocation:'assets/rangde.jpg',detail:'Rang de Basanti / 3:21'),
                      ),
                      );

                      }),
                  SizedBox(height: 15,),
                  Divider(color: Colors.black),
                  SizedBox(height: 15),
                  GestureDetector(
                      child: getPlayListItem('Tum ho', 'Rockstar / 4:03 ','rockstar.jpg'),
                      onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                          songName:'Tum ho',
                          imglocation:'assets/rockstar.jpg',
                          detail:'Rockstar / 4:03 '),
                      ),
                      );

                      }),
                  SizedBox(height: 15),
                  Divider(color: Colors.black),
                  SizedBox(height: 15,),
                  GestureDetector(
                      child: getPlayListItem('Maahi Ve', 'Highway / 3:33','highway.jpg'),
                      onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                          songName:'Maahi Ve',
                          imglocation:'assets/highway.jpg',detail:'Highway / 3:33'),
                      ),
                      );

                      }),
                  SizedBox(height: 15,),
                  Divider(color: Colors.black),
                  SizedBox(height: 15,),
                  GestureDetector(
                      child: getPlayListItem('All of me ', 'John Legend / 2:23', 'null.webp'),
                      onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                          songName:'All of me ',
                          imglocation:'assets/null.webp',detail:'John Legend / 2:23'),
                      ),
                      );

                      }),
                  SizedBox(height: 15,),
                  Divider(color: Colors.black),
                  SizedBox(height: 15,),
                  GestureDetector(
                      child: getPlayListItem('Roobaroo', 'Rang de Basanti / 3:21','rangde.jpg'),
                      onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                          songName:'Roobaroo',
                          imglocation:'assets/rangde.jpg',detail:'Rang de Basanti / 3:21'),
                      ),
                      );

                      }),
                  SizedBox(height: 15,),

                ],
              ),
            ),
          ],
        )
    );



  }
}
