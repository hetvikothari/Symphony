import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'utilities.dart';
import 'nowplaying.dart';
import 'db_objects.dart';

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
              getMainHeading('Favourites'),
              SizedBox(height: 30,),
              Flexible(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: favs.length,
                    itemBuilder: (context, index){
                      return Column(
                          children: [
                            GestureDetector(
                              child: getFavSong(favs[index].songName, favs[index].detail, favs[index].imglocation),
                              onTap:() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      NowPlaying(
                                        songName: favs[index].songName,
                                        imglocation:favs[index].imglocation,
                                        detail: favs[index].detail,
                                      ),
                                  ),
                                );
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
          ),
        ),
      ),
    );
  }
}





