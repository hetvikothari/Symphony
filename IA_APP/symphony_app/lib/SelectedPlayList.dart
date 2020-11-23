import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:symphony/buildLists.dart';

class CustomPlaylist extends StatefulWidget {

  @required dynamic q;

  final String pname;
  final String pdesc;
  final Function callback;

  CustomPlaylist({
    Key key,
    this.pname,
    this.pdesc,
    this.callback,
    this.q
  });

  @override
  _CustomPlaylistState createState() => _CustomPlaylistState();
}

class _CustomPlaylistState extends State<CustomPlaylist> {

  Future<bool> onLikeButtonTapped(bool isLiked) async{
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
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
            PlayListItemsBuilder(query: widget.q),
          ],
        )
    );
  }
}
