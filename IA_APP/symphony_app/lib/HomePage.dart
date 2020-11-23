import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'utilities.dart';
import 'nowplaying.dart';
import 'selectedAlbum.dart';
import 'db_objects.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _activetab = 'MOODS';
  static bool album = false;
  static var selectedAlbum = "none";
  static String selectedAlbumDesc = "none";

  void callback() {
    setState(() {
      album = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
        
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: (album == true
                ? AlbumSongs(
                    pname: selectedAlbum,
                    pdesc: selectedAlbumDesc,
                    callback: callback,
                  )
                : getHome())));
  }

  Widget getTextWid(String txt) {
    return Text(
      txt,
      style: TextStyle(
        fontFamily: 'Segoe-UI',
        fontSize: 18.5,
        color: (_activetab == txt) ? Colors.black : Colors.grey,
        fontWeight: FontWeight.bold,
        decoration: (_activetab == txt)
            ? TextDecoration.underline
            : TextDecoration.none,
        decorationColor: Colors.blue,
        decorationThickness: 3,
        letterSpacing: 2.0,
      ),
    );
  }

  Widget getHome() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          getSearchBar('Search album, song..'),
          SizedBox(
            height: 30,
          ),
          getMainHeading('Browse'),
          SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            GestureDetector(
                child: getTextWid('MOODS'),
                onTap: () {
                  setState(() {
                    _activetab = 'MOODS';
                  });
                }),
            GestureDetector(
              child: getTextWid('ARTISTS'),
              onTap: () {
                setState(() {
                  _activetab = 'ARTISTS';
                });
              },
            ),
            GestureDetector(
                child: getTextWid('PODCASTS'),
                onTap: () {
                  setState(() {
                    _activetab = 'PODCASTS';
                  });
                }),
          ]),
          SizedBox(
            height: 30,
          ),
          _activetab == 'MOODS'
              ? getMOODlayout()
              : (_activetab == 'ARTISTS'
                  ? getARTISTlayout()
                  : getPODCASTlayout())
        ],
      ),
    );
  }

  Widget getMOODlayout() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: song_posters.length,
                itemBuilder: (context, index) {
                  return Row(children: [
                    GestureDetector(
                        child: getPoster(song_posters[index].imglocation,
                            song_posters[index].songName, 18),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NowPlaying(
                                songName: song_posters[index].songName,
                                imglocation: song_posters[index].imglocation,
                                detail: song_posters[index].detail,
                              ),
                            ),
                          );
                        }),
                    SizedBox(width: 15),
                  ]);
                }),
          ),
          SizedBox(height: 30),
          getHeading('Most Played'),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: song_posters.length,
                itemBuilder: (context, index) {
                  return Column(children: [
                    GestureDetector(
                        child: getPlayListItem(
                          song_posters[index].songName,
                          song_posters[index].detail,
                          song_posters[index].imglocation,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NowPlaying(
                                songName: song_posters[index].songName,
                                imglocation: song_posters[index].imglocation,
                                detail: song_posters[index].detail,
                              ),
                            ),
                          );
                        }),
                    SizedBox(height: 15),
                    Divider(color: Colors.black),
                    SizedBox(height: 15),
                  ]);
                }),
          ),
        ],
      ),
    );
  }

  List<String> artist_name = ['Sonu Nigam', 'Shaan', 'Shreya Ghoshal'];
  List<String> artist_image = [
    'assets/sonu.jpg',
    'assets/shaan.jpg',
    'assets/shreya.jpg'
  ];

  List<String> most_played_playist_name = [
    'Kishore Kumar Top 50',
    'Best Of Arijit Singh',
    'Kishore Kumar Top 50',
    'Best Of Arijit Singh'
  ];
  List<String> most_played_playist_artist_name = [
    'Kishore Kumar',
    'Arijit Singh',
    'Kishore Kumar',
    'Arijit Singh'
  ];
  List<String> most_played_playist_artist_image = [
    'assets/kishore.jpg',
    'assets/arijit.webp',
    'assets/kishore.jpg',
    'assets/arijit.webp'
  ];

  Widget getARTISTlayout() {
    return Flexible(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Flexible(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: artist_name.length,
              itemBuilder: (context, index) {
                return Row(children: [
                  GestureDetector(
                      child: getArtistPoster(
                          artist_image[index], artist_name[index]),
                      onTap: () {
                        setState(() {
                          selectedAlbum = artist_name[index];
                          selectedAlbumDesc = 'Artist';
                          album = true;
                        });
                      }),
                  SizedBox(width: 15),
                ]);
              }),
        ),
        SizedBox(height: 10),
        getHeading('MOST PLAYED PLAYLISTS'),
        SizedBox(
          height: 20,
        ),
        Flexible(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: most_played_playist_name.length,
              itemBuilder: (context, index) {
                return Row(children: [
                  GestureDetector(
                      child: getPoster(most_played_playist_artist_image[index],
                          most_played_playist_artist_name[index], 15),
                      onTap: () {
                        setState(() {
                          selectedAlbum = most_played_playist_artist_name[index];
                          selectedAlbumDesc = most_played_playist_name[index];
                          album = true;
                        });
                      }),
                  SizedBox(width: 15),
                ]);
              }),
        ),
      ]),
    );
  }

  Widget getPODCASTlayout() {
    return Flexible(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        getHeading('TOP SHOWS'),
        Flexible(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: top_podcasts.length,
              itemBuilder: (context, index) {
                return Row(children: [
                  GestureDetector(
                      child:
                          getPosterWithoutText(top_podcasts[index].imglocation),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NowPlaying(
                              songName: top_podcasts[index].songName,
                              imglocation: top_podcasts[index].imglocation,
                              detail: top_podcasts[index].detail,
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    width: 15,
                  ),
                ]);
              }),
        ),
        SizedBox(height: 20),
        getHeading('STAY UPDATED'),
        SizedBox(
          height: 20,
        ),
        Flexible(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: latest_podcasts.length,
              itemBuilder: (context, index) {
                return Row(children: [
                  GestureDetector(
                      child: getPoster(latest_podcasts[index].imglocation,
                          latest_podcasts[index].songName, 18),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NowPlaying(
                              songName: latest_podcasts[index].songName,
                              imglocation: latest_podcasts[index].imglocation,
                              detail: latest_podcasts[index].detail,
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    width: 15,
                  ),
                ]);
              }),
        ),
      ]),
    );
  }
}
