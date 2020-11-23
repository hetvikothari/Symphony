import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'buildLists.dart';
import 'utilities.dart';
import 'nowplaying.dart';
import 'SelectedPlayList.dart';
import 'db_objects.dart';

class MyPlaylist extends StatefulWidget{
  @override
  _MyPlaylistState createState() => _MyPlaylistState();
}

class _MyPlaylistState extends State<MyPlaylist> {
  double _currentSliderValue = 1;
  static var selectedPlaylist = "none";
  static String selectedPlaylistDesc = "none";

  void callback() {
    setState(() {
      selectedPlaylist = "none";
    });
  }

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
              selectedPlaylist == "none"? getAllPlaylists() : CustomPlaylist(pname:selectedPlaylist,pdesc:selectedPlaylistDesc,callback: callback, q: getAllSongs()),
              SizedBox(height: 20,),
              GestureDetector(
                  child: getNowPlaying('Perfect', '(Ed Sheeran)','perfect.jpeg'),
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                        songName:'Perfect',
                        imglocation:'assets/perfect.jpeg',
                        detail:'Ed Sheeran'),
                    ),
                    );
                  }
              ),
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                margin:  EdgeInsets.all(1.0),
                padding: EdgeInsets.all(1.0),
                child: getMainHeading('My Playlists')
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: playlists.length,
                  itemBuilder: (context, index){
                    return Column(
                        children: [
                          GestureDetector(
                              child: GetPlaylist(playlists[index].name, playlists[index].desc),
                              onTap:(){
                                setState(() { selectedPlaylist = playlists[index].name; selectedPlaylistDesc = playlists[index].desc;});
                              }
                          ),
                          SizedBox(height: 15),
                          Divider(color: Colors.black),
                          SizedBox(height: 15,),
                        ]
                    );
                  }
              ),
            ),
          ],
        )
    );

  }

  Widget CurrentPlaylist(String pname, String pdesc)
  {
    return Flexible(
        child: Column(
          children: [
            Container(
                margin:  EdgeInsets.all(1.0),
                padding: EdgeInsets.all(1.0),
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
            PlayListItemsBuilder(query: allsongs)
          ],
        )
    );
  }
}
