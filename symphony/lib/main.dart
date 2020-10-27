import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'login.dart';
import 'signup.dart';
import 'playlist.dart';
import 'utilities.dart';
import 'podcast.dart';
import 'profile.dart';
import 'fav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _selectedIndex = 0;
  final List<Widget> _children =
  [
    MyHomePage(),
    MyPlaylist(),
    MyPodcast(),
    MyFav(),
    MyProfile(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(subtitle1: TextStyle(color: Colors.grey)),
      ),
      home:  Scaffold(
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
      ),
    );
  }
}




