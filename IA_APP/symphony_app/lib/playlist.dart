import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'utilities.dart';

class MyPlaylist extends StatefulWidget{
  @override
  _MyPlaylistState createState() => _MyPlaylistState();
}

class _MyPlaylistState extends State<MyPlaylist> {
  double _currentSliderValue = 1;
  String selectedPlaylist = "none";
 
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
              Text(
                'Playlist',
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
                  Divider(
                      color: Colors.black
                  ),
                  SizedBox(height: 15),
                  getPlayList('Just Wanna Dance', 'Party Mood'),
                  SizedBox(height: 15),
                  Divider(
                      color: Colors.black
                  ),
                  SizedBox(height: 15,),
                  getPlayList('Love is in the Air', 'Romantic ones'),
                  SizedBox(height: 15,),
                  Divider(
                      color: Colors.black
                  ),
                  SizedBox(height: 15,),
                  getPlayList('Tute Dil ki Dastaan ', 'Sad wibes'),
                  SizedBox(height: 15,),
                  Divider(
                      color: Colors.black
                  ),
                  SizedBox(height: 15,),
                  getPlayList('Navratri Specials', 'Garba songs'),
                  SizedBox(height: 15,),
                  Divider(
                      color: Colors.black
                  ),
                  SizedBox(height: 15),
                  getPlayList('Just Wanna Dance', 'Party Mood'),
                  SizedBox(height: 15),
                  Divider(
                      color: Colors.black
                  ),
                  SizedBox(height: 15,),
                  getPlayList('Love is in the Air', 'Romantic ones'),
                  SizedBox(height: 15,),
                  Divider(
                      color: Colors.black
                  ),
                  SizedBox(height: 15,),
                  getPlayList('Tute Dil ki Dastaan ', 'Sad wibes'),
                  SizedBox(height: 15,),
                  Divider(
                      color: Colors.black
                  ),
                  SizedBox(height: 15,),
                  getPlayList('Navratri Specials', 'Garba songs'),
                  SizedBox(height: 15,),
                  Divider(
                      color: Colors.black
                  ),
                ],
              ),
            ),
              Divider(color: Colors.black),
              SizedBox(height: 15,),
              getNowPlaying('Perfect', '(Ed Sheeran)','perfect.jpeg'),
            Slider(
              value: _currentSliderValue,
              min: 0,
              max: 60,
              divisions: 60,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
            },
          )
            ],
          ),
        ),
      ),
    );
  }
}

Widget getPlaylist() {
  return ( ListView(
  scrollDirection: Axis.vertical,
  children: [
  Divider(
  color: Colors.black
  ),
  SizedBox(height: 15),
  getPlayList('Just Wanna Dance', 'Party Mood'),
  SizedBox(height: 15),
  Divider(
  color: Colors.black
  ),
  SizedBox(height: 15,),
  getPlayList('Love is in the Air', 'Romantic ones'),
  SizedBox(height: 15,),
  Divider(
  color: Colors.black
  ),
  SizedBox(height: 15,),
  getPlayList('Tute Dil ki Dastaan ', 'Sad wibes'),
  SizedBox(height: 15,),
  Divider(
  color: Colors.black
  ),
  SizedBox(height: 15,),
  getPlayList('Navratri Specials', 'Garba songs'),
  SizedBox(height: 15,),
  Divider(
  color: Colors.black
  ),
  SizedBox(height: 15),
  getPlayList('Just Wanna Dance', 'Party Mood'),
  SizedBox(height: 15),
  Divider(
  color: Colors.black
  ),
  SizedBox(height: 15,),
  getPlayList('Love is in the Air', 'Romantic ones'),
  SizedBox(height: 15,),
  Divider(
  color: Colors.black
  ),
  SizedBox(height: 15,),
  getPlayList('Tute Dil ki Dastaan ', 'Sad wibes'),
  SizedBox(height: 15,),
  Divider(
  color: Colors.black
  ),
  SizedBox(height: 15,),
  getPlayList('Navratri Specials', 'Garba songs'),
  SizedBox(height: 15,),
  Divider(
  color: Colors.black
  ),
  ],
  ));
}

