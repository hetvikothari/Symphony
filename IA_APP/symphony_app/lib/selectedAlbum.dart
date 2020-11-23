import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:symphony/playlist.dart';

import 'buildLists.dart';
import 'utilities.dart';

class AlbumSongs extends StatefulWidget {
  @required
  Stream<QuerySnapshot> query;
  final String pname;
  final String pdesc;
  final Function callback;

  AlbumSongs({Key key, this.pname, this.pdesc, this.callback, this.query});

  @override
  _AlbumSongsState createState() => _AlbumSongsState();
}

class _AlbumSongsState extends State<AlbumSongs> {
  Future<bool> onLikeButtonTapped(bool isLiked) async {
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        getSearchBar('Search album, song..'),
        SizedBox(
          height: 30,
        ),
        Flexible(
            child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(1.0),
                padding: EdgeInsets.all(1.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                              color: Colors.blue[900],
                            ),
                            onTap: () {
                              widget.callback();
                            }),
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
                )),
            SizedBox(
              height: 20,
            ),
            PlayListItemsBuilder(query: widget.query),
          ],
        )),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
