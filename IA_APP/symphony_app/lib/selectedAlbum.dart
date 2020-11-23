import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:symphony/playlist.dart';

import 'buildLists.dart';
import 'utilities.dart';
import 'nowplaying.dart';
import 'db_objects.dart';

class AlbumSongs extends StatefulWidget {
  final String pname;
  final String pdesc;
  final Function callback;

  const AlbumSongs({
    Key key,
    this.pname,
    this.pdesc,
    this.callback,
  });

  @override
  _AlbumSongsState createState() => _AlbumSongsState();
}

class _AlbumSongsState extends State<AlbumSongs> {

  Future<bool> onLikeButtonTapped(bool isLiked) async{
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              getSearchBar('Search album, song..'),
              SizedBox(height: 30,),
              PlayListItemsBuilder(),
              SizedBox(height: 20,),
              ]
          ),
    );
  }

  Widget songs() {
    return  Flexible(
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
                              widget.callback();
                            }
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            widget.pname,
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
                      widget.pdesc,
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
            SizedBox(height: 20,),
            Flexible(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: favs.length,
                  itemBuilder: (context, index){
                    return Column(
                        children: [
                          GestureDetector(
                              child: getPlayListItem(favs[index].songName, favs[index].detail, favs[index].imglocation),
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
        )
    );


  }
}





