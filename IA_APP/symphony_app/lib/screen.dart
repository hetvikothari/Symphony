import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:symphony/nowplaying.dart';

import 'HomePage.dart';
import 'login.dart';
import 'signup.dart';
import 'playlist.dart';
import 'utilities.dart';
import 'podcast.dart';
import 'profile.dart';
import 'fav.dart';
import 'nowplaying.dart';

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {

  int _selectedIndex = 0;
  final List<Widget> _children =
  [
    MyHomePage(),
    MyPlaylist(),
    MyPodcast(),
    MyFav(),
    MyProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _children[_selectedIndex],
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






