import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Song{
  String songName;
  String imglocation;
  String detail;

  Song({
    Key key,
    this.songName,
    this.imglocation,
    this.detail,
  });
}

class Playlist{
  String name;
  String desc;

  Playlist(name, desc){
    this.name=name;
    this.desc= desc;
  }
}
