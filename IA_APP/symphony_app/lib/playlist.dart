import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:marquee_widget/marquee_widget.dart';

import 'utilities.dart';
import 'nowplaying.dart';

class MyPlaylist extends StatefulWidget{
  @override
  _MyPlaylistState createState() => _MyPlaylistState();
}

class _MyPlaylistState extends State<MyPlaylist> {
  double _currentSliderValue = 1;
  String selectedPlaylist = "none";
  String selectedPlaylistDesc = "none";



@override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              getSearchBar('Search album, song..'),
              SizedBox(height: 30,),
              selectedPlaylist == "none"? getAllPlaylists() : CurrentPlaylist(selectedPlaylist, selectedPlaylistDesc),

              SizedBox(height: 20,),
              GestureDetector(
                  child: getNowPlaying('Perfect', '(Ed Sheeran)','perfect.jpeg'),
                  onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                      songName:'Perfect',
                      imglocation:'assets/perfect.jpeg',
                      detail:'Ed Sheeran'),
                  ),
                  );

                  }),

              Slider(
                value: _currentSliderValue,
                min: 0,
                max: 60,
                divisions: 60,
                activeColor: Colors.blue[800],
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              )],
          ),
        ),
      ),
    );
  }

  Widget getAllPlaylists()
  {
    return Flexible(
        child:  Column(
          children: [
            Container(
              margin:  EdgeInsets.all(1.0),
              padding: EdgeInsets.all(1.0),
              /*decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 6.0, color: Colors.lightBlue.shade900),
                  ),
                )*/
              child: Text(
                'My Playlists',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'RockWell',
                  fontSize: 45,
                  color: Colors.black,
                  letterSpacing: 3.0,

                ),
                textAlign: TextAlign.left,

              ),

            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [

                  SizedBox(height: 15),
                  GestureDetector(
                      child: GetPlaylist('Just Wanna Dance','Party Mood'),
                      onTap:(){
                        setState(() { selectedPlaylist = 'Just Wanna Dance'; selectedPlaylistDesc = 'Party Mood';});
                      }),
                  SizedBox(height: 15,),
                  Divider(
                      color: Colors.black
                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                      child: GetPlaylist('Tute Dil ki dastan','Break up songs'),
                      onTap:(){
                        setState(() { selectedPlaylist = 'Tute Dil ki dastan'; selectedPlaylistDesc = 'Break up songs';});
                      }),
                  SizedBox(height: 15,),
                  Divider(
                      color: Colors.black
                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                      child: GetPlaylist('Relax and chillll','Serene songs'),
                      onTap:(){
                        setState(() { selectedPlaylist = 'Relax and chillll'; selectedPlaylistDesc = 'Serene songs';});
                      }),
                  SizedBox(height: 15,),
                  Divider(
                      color: Colors.black
                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                      child: GetPlaylist('Workout Rhythm','Inspirational songs'),
                      onTap:(){
                        setState(() { selectedPlaylist = 'Workout Rhythm'; selectedPlaylistDesc = 'Inspirational songs';});
                      }),
                  SizedBox(height: 15,),
                  Divider(
                      color: Colors.black
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                      child: GetPlaylist('Just Wanna Dance','Party Mood'),
                      onTap:(){
                        setState(() { selectedPlaylist = 'Just Wanna Dance'; selectedPlaylistDesc = 'Party Mood';});
                      }),
                  SizedBox(height: 15,),
                  Divider(
                      color: Colors.black
                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                      child: GetPlaylist('Tute Dil ki dastan','Break up songs'),
                      onTap:(){
                        setState(() { selectedPlaylist = 'Tute Dil ki dastan'; selectedPlaylistDesc = 'Break up songs';});
                      }),
                  SizedBox(height: 15,),
                  Divider(
                      color: Colors.black
                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                      child: GetPlaylist('Relax and chillll','Serene songs'),
                      onTap:(){
                        setState(() { selectedPlaylist = 'Relax and chillll'; selectedPlaylistDesc = 'Serene songs';});
                      }),
                  SizedBox(height: 15,),
                  Divider(
                      color: Colors.black
                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                      child: GetPlaylist('Workout Rhythm','Inspirational songs'),
                      onTap:(){
                        setState(() { selectedPlaylist = 'Workout Rhythm'; selectedPlaylistDesc = 'Inspirational songs';});
                      }),
                  SizedBox(height: 15,),
                  Divider(
                      color: Colors.black
                  ),

                ],
              ),
            ),
          ],
        )
    );

  }

  Widget CurrentPlaylist( String pname, String pdesc)
  {
    return Flexible(
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
                              setState(() { selectedPlaylist = 'none'; selectedPlaylistDesc = 'none';});
                            }),


                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          pname,
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
                    pdesc,
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



