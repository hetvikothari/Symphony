import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'utilities.dart';
import 'selectedAlbum.dart';


class MyPodcast extends StatefulWidget {
  @override
  _MyPodcastState createState() => _MyPodcastState();
}

class _MyPodcastState extends State<MyPodcast> {

  static bool album = false;
  static var selectedAlbum = "none";
  static String selectedAlbumDesc = "none";

  void callback() {
    setState(() {
      album = false;
    });
  }

  void pushtonavigator(String routename) {
    Navigator.of(context).pushNamed(routename);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: (album==true? AlbumSongs(pname:selectedAlbum , pdesc: selectedAlbumDesc, callback: callback,) : getPodcastList())
      )
    );
  }

  Widget getPodcastList()
  {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          getSearchBar('Search album, song..'),
          SizedBox(height: 30,),
          Text(
            'Podcasts',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontFamily: 'RockWell',
              fontSize: 45,
              color: Colors.black,
              letterSpacing: 3.0,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height:20,),
          getHeading('Crime'),
          Flexible(
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                        child: getPoster('assets/murder.jpg', 'MURDER MYSTERY',18),
                        onTap:(){
                          setState(() { selectedAlbum = 'Murder Mystery'; selectedAlbumDesc = 'Podcasts'; album = true;});
                        }),
                    SizedBox(width:20),
                    GestureDetector(
                        child: getPoster('assets/murder.jpg', 'MURDER MYSTERY',18),
                        onTap:(){
                          setState(() { selectedAlbum = 'Murder Mystery'; selectedAlbumDesc = 'Podcasts'; album = true;});
                        }),
                    SizedBox(width:20),
                    GestureDetector(
                        child: getPoster('assets/murder.jpg', 'MURDER MYSTERY',18),
                        onTap:(){
                          setState(() { selectedAlbum = 'Murder Mystery'; selectedAlbumDesc = 'Podcasts'; album = true;});
                        }),
                    SizedBox(width:20),
                    GestureDetector(
                        child: getPoster('assets/murder.jpg', 'MURDER MYSTERY',18),
                        onTap:(){
                          setState(() { selectedAlbum = 'Murder Mystery'; selectedAlbumDesc = 'Podcasts'; album = true;});
                        }),
                  ]
              )
          ),
          getHeading('Science & Technology'),
          Flexible(
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                        child: getPoster('assets/girl.jpg', 'GIRL IN SPACE', 18),
                        onTap:(){
                          setState(() { selectedAlbum = 'Girl in space'; selectedAlbumDesc = 'Podcasts'; album = true;});
                        }),
                    SizedBox(width:20),
                    GestureDetector(
                        child: getPoster('assets/girl.jpg', 'GIRL IN SPACE', 18),
                        onTap:(){
                          setState(() { selectedAlbum = 'Girl in space'; selectedAlbumDesc = 'Podcasts'; album = true;});
                        }),
                    SizedBox(width:20),
                    GestureDetector(
                        child: getPoster('assets/girl.jpg', 'GIRL IN SPACE', 18),
                        onTap:(){
                          setState(() { selectedAlbum = 'Girl in space'; selectedAlbumDesc = 'Podcasts'; album = true;});
                        }),
                    SizedBox(width:20),
                    GestureDetector(
                        child: getPoster('assets/girl.jpg', 'GIRL IN SPACE', 18),
                        onTap:(){
                          setState(() { selectedAlbum = 'Girl in space'; selectedAlbumDesc = 'Podcasts'; album = true;});
                        }),
                  ]
              )
          ),
        ],

      ),
    );
  }
}


