import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'utilities.dart';

class MyPlaylist extends StatefulWidget{
  @override
  _MyPlaylistState createState() => _MyPlaylistState();
}

class _MyPlaylistState extends State<MyPlaylist> {
  int _selectedIndex = 0;
  double _currentSliderValue = 20;
 
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
              Divider(color: Colors.black),
              SizedBox(height: 15),
              getPlayListItem('Agar tum ', 'Tamasha / 4:03','tamasha.jpg'),
              SizedBox(height: 15),
              Divider(color: Colors.black),
              SizedBox(height: 15,),
              getPlayListItem('Patakha Guddi', 'Highway / 3:09','highway.jpg'),
              SizedBox(height: 15,),
              Divider(color: Colors.black),
              SizedBox(height: 15,),
              getPlayListItem('Paathshala ', 'Rang De Basanti / 5:45','rangde.jpg'),
              SizedBox(height: 15,),
              Divider(color: Colors.black),
              SizedBox(height: 15,),
              getPlayListItem('Phir Ud chala', 'Rockstar / 4:25','rockstar.jpg'),
              SizedBox(height: 15,),
              Divider(color: Colors.black),
              SizedBox(height: 15),
              getPlayListItem('Matargashti', 'Tamasha / 4:03','tamasha.jpg'),
              SizedBox(height: 15),
              Divider(color: Colors.black),
              SizedBox(height: 15,),
              getPlayListItem('Wanna MashUp', 'Highway / 3:09','highway.jpg'),
              SizedBox(height: 15,),
              Divider(color: Colors.black),
              SizedBox(height: 15,),
              getPlayListItem('Luka CHupi', 'Rang De Basanti / 5:45','rangde.jpg'),
              SizedBox(height: 15,),
              Divider(color: Colors.black),
              SizedBox(height: 15,),
              getPlayListItem('Aur Ho', 'Rockstar / 4:25','rockstar.jpg'),
              SizedBox(height: 15,),
            ],
          ),
        ),
              Divider(color: Colors.black),
              SizedBox(height: 15,),
              getNowPlaying('Perfect', '(Ed Sheeran)','perfect.jpeg'),
            Slider(
            value: _currentSliderValue,
            min: 0,
            max: 100,
            divisions: 5,
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
