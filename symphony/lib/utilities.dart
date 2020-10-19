import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getPosterWithoutText(String imgPath){
  return Container(
    height: 205,
    width: 165,
    child: Image.asset(imgPath),
  );
}

Widget getPoster(String imgPath, String songName, double sz){
  return Container(
    height: 225,
    width: 180,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: Colors.black12,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          imgPath,
          height: 180,
        ),
        Text(
          songName,
          style: TextStyle(
              fontSize: sz,
              color: Colors.black,
              fontFamily: 'Nirmala',
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget getPlayListItem(String playlistName, String playlistDesc){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Icon(Icons.adjust, size: 50, color: Colors.blue[900],),
      Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            playlistName,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Calibri',
              fontSize: 25,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            playlistDesc,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Calibri',
              fontSize: 15,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      Icon(Icons.favorite_border,size: 40,),
    ],
  );
}

Widget getSearchBar(String hinttext){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.black12,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 10,
        ),
        Icon(Icons.search),
        Expanded(
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: hinttext,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        Icon(Icons.mic),
        Icon(Icons.more_vert),
        SizedBox(width: 10,)
      ],
    ),
  );
}

List<BottomNavigationBarItem> bottomnavbar(){
  return <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.playlist_add_outlined),
      label: 'Playlist',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.radio),
      label: 'FM Radio',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.music_note),
      label: 'Music',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Account',
    )
  ];
}

Widget getArtistPoster(String imgPath, String artistName){
  return Column(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage(imgPath),
          // child: Text(artistName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.end,),
        ),
        Text(
            artistName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Segoe-UI'
            ),
        ),
      ]
  );
}

Text getHeading(String name){
  return Text(
    name,
    style: TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontFamily: 'Segoe',
      letterSpacing: 2.5,
      fontWeight: FontWeight.bold,
    ),
  );
}
