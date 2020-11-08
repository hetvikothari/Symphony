import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'utilities.dart';
import 'nowplaying.dart';


class MyFav extends StatefulWidget {
  @override
  _MyFavState createState() => _MyFavState();
}

class _MyFavState extends State<MyFav> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              getSearchBar('Search album, song..'),
              SizedBox(height: 30,),
              Text(
                'Favourites',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'RockWell',
                  fontSize: 45,
                  color: Colors.black,
                  letterSpacing: 3.0,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 30,),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Divider(color: Colors.black),
                    SizedBox(height: 15),
                    GestureDetector(
                        child: getFavSong('Tum ho', 'Rockstar / 4:03 ','rockstar.jpg'),
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
                        child: getFavSong('Maahi Ve', 'Highway / 3:33','highway.jpg'),
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
                        child: getFavSong('All of me ', 'John Legend / 2:23', 'null.webp'),
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
                        child: getFavSong('Roobaroo', 'Rang de Basanti / 3:21','rangde.jpg'),
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
                        child: getFavSong('Tum ho', 'Rockstar / 4:03 ','rockstar.jpg'),
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
                        child: getFavSong('Maahi Ve', 'Highway / 3:33','highway.jpg'),
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
                        child: getFavSong('All of me ', 'John Legend / 2:23', 'null.webp'),
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
                        child: getFavSong('Roobaroo', 'Rang de Basanti / 3:21','rangde.jpg'),
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
          ),
        ),
      ),
    );
  }
}





