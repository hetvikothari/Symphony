import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Song {
  String songName;
  String imglocation;
  String songlocation;
  String detail;
  String artist;
  String type;

  Song(
      {Key key,
      this.songName,
      this.imglocation,
      this.songlocation,
      this.detail,
      this.artist,
      this.type});
}

class Playlist {
  String name;
  String desc;

  Playlist(name, desc) {
    this.name = name;
    this.desc = desc;
  }
}
