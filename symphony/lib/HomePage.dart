import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'utilities.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              getSearchBar('Search album, song..'),
              SizedBox(height: 30,),
              Text(
                'Browse',
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
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    getTextWid('MOODS', val: 'active'),
                    getTextWid('ARTISTS'),
                    getTextWid('PODCASTS')
                  ]
              ),
              SizedBox(height: 30,),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    getSongPoster('assets/kas.jpg', 'KAR GAYI CHULL'),
                    SizedBox(width:20),
                    getSongPoster('assets/tamasha.jpg', 'MATARGASHTI'),
                    SizedBox(width:20),
                    getSongPoster('assets/kas.jpg', 'KAR GAYI CHULL'),
                    SizedBox(width:20),
                    getSongPoster('assets/tamasha.jpg', 'MATARGASHTI'),
                  ],
                ),
              ),
              SizedBox(height:30),
              Text(
                'PLAYLISTS',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'Segoe',
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height:10,),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Divider(color: Colors.black),
                    SizedBox(height: 15),
                    getPlayListItem('Just Wanna Dance', 'Party Mood'),
                    SizedBox(height: 15),
                    Divider(color: Colors.black),
                    SizedBox(height: 15,),
                    getPlayListItem('Love is in the Air', 'Romantic ones'),
                    SizedBox(height: 15,),
                    Divider(color: Colors.black),
                    SizedBox(height: 15,),
                    getPlayListItem('Tute Dil ki Dastaan ', 'Sad wibes'),
                    SizedBox(height: 15,),
                    Divider(color: Colors.black),
                    SizedBox(height: 15,),
                    getPlayListItem('Navratri Specials', 'Garba songs'),
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
        onTap: _onItemTapped,
        items: bottomnavbar(),
      ),
    );
  }
}
