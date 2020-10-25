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
              SizedBox(height:30),
        SizedBox(height:10,),
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Divider(color: Colors.black),
              SizedBox(height: 15),
              getPlayListItem('Agar tum saath ho', 'Tamasha / 4:03','tamasha.jpg'),
              SizedBox(height: 15),
              Divider(color: Colors.black),
              SizedBox(height: 15,),
              getPlayListItem('Love is in the Air', 'Romantic ones / 3:09','null.webp'),
              SizedBox(height: 15,),
              Divider(color: Colors.black),
              SizedBox(height: 15,),
              getPlayListItem('Tute Dil ki Dastaan ', 'Sad wibes / 5:45','null.webp'),
              SizedBox(height: 15,),
              Divider(color: Colors.black),
              SizedBox(height: 15,),
              getPlayListItem('Navratri Specials', 'Garba songs / 4:25','null.webp'),
              SizedBox(height: 15,),
              Divider(color: Colors.black),
            ],
          ),
        ),
              
              
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40,
        backgroundColor: Colors.black12,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue[900],
        currentIndex: _selectedIndex,
        items: bottomnavbar(),
      ),
    );
  }
}
