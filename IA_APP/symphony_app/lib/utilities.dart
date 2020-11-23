import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

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

Widget getPlayListItem(String playlistName, String playlistDesc, String imgname){
  String imagelocation = imgname;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:  AssetImage(imagelocation),
                  fit: BoxFit.fill,
                ),
              ),
            ),
      Container(
        width: 250,
        child: Column(
          children: [
            Text(
              playlistName,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Calibri',
                fontSize: 21,
              ),
              overflow: TextOverflow.ellipsis,
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
      ),
      LikeButton(
        isLiked: false,
        onTap: onLikeButtonTapped,
      ),
      Icon(Icons.more_vert,size: 30,),
    ],
  );
}

Widget getFavSong(String playlistName, String playlistDesc, String imgname){
  String imagelocation = imgname;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 55.0,
        height: 55.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:  AssetImage(imagelocation),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Container(
        width: 200,
        child: Column(
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
      ),
      LikeButton(
        isLiked: true,
        onTap: onLikeButtonTapped,
      ),
      Icon(Icons.more_vert,size: 40,),
    ],
  );
}

Future<bool> onLikeButtonTapped(bool isLiked) async{
  return !isLiked;
}

Widget getNowPlaying(String playlistName, String playlistDesc, String imgname){
  String imagelocation = 'assets/' + imgname;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      /*Icon(Icons.adjust, size: 50, color: Colors.blue[900],),*/
      Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:  AssetImage(imagelocation),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Row(
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
          SizedBox(width: 20.0),
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
      IconTheme(
        data: new IconThemeData(
            color: Colors.blue[800]),
        child: new Icon(Icons.play_arrow, size: 50,),
      ),
      IconTheme(
        data: new IconThemeData(
            color: Colors.blue[800]),
        child: new Icon(Icons.skip_next, size: 40,),
      ),
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
      label: 'Podcast',
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

Text getMainHeading(String name){
  return Text(
    name,
    style: TextStyle(
      fontStyle: FontStyle.italic,
      fontFamily: 'RockWell',
      fontSize: 45,
      color: Colors.black,
      letterSpacing: 3.0,
    ),
    textAlign: TextAlign.left,
  );
}

Widget roundbutton(String lbl, Color textcolor, Color buttoncolor, Color shadowcolor, Function func, {dynamic param}){
  return Container(
      height: 40.0,
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        shadowColor: shadowcolor,
        color: buttoncolor,
        elevation: 7.0,
        child: GestureDetector(
          onTap: () {
            func(param);
          },
          child: Center(
            child: Text(
              lbl,
              style: TextStyle(
                  color: textcolor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            ),
          ),
        ),
      )
  );
}

Widget textfield(IconData i, String hnt, String lbl){
  return TextFormField(
    decoration: InputDecoration(
      icon: Icon(i),
      hintText: hnt,
      labelText: lbl,
      labelStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.grey
      ),
    ),
  );
}

Widget GetPlaylist(String playlistName, String playlistDesc){
  return Row(

    mainAxisAlignment: MainAxisAlignment.spaceBetween,


    children: [
      Icon(Icons.adjust, size: 50, color: Colors.blue[900],),
      Container(
        width: 210,
        child: Column(
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
      ),

      Align(
        alignment: Alignment.centerRight,
        child: Icon(Icons.more_vert,size: 40,),
      ),
    ],
  );
}

Widget ProfileListItem(IconData icon, String text)
{
  return Container(
    height: 55,
    margin: EdgeInsets.symmetric(
      horizontal: 10,
    ).copyWith(
      bottom: 20,
    ),
    padding: EdgeInsets.symmetric(
      horizontal: 20,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.black12
    ),
    child: Row(
      children: <Widget>[
        Icon(
          icon,
          size: 25,
        ),
        SizedBox(width: 15),
        Text(
          text,
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'Calibri',
              fontWeight: FontWeight.w400,
              color: Colors.black87
          )
        ),
        Spacer(),
          Icon(
            Icons.keyboard_arrow_right,
            size: 25,
          ),
      ],
    ),
  );
}
