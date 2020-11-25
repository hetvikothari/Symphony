import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'buildLists.dart';
import 'utilities.dart';
import 'nowplaying.dart';
import 'SelectedPlayList.dart';
import 'db_objects.dart';

class MyPlaylist extends StatefulWidget {
  @override
  _MyPlaylistState createState() => _MyPlaylistState();
}

class _MyPlaylistState extends State<MyPlaylist> {
  User firebaseUser = FirebaseAuth.instance.currentUser;
  final nameController = TextEditingController();
  final descController = TextEditingController();

  double _currentSliderValue = 1;
  static var selectedPlaylist = "none";
  static String selectedPlaylistId = "none";
  static String selectedPlaylistDesc = "none";
  static List selectedPlaylistSongs = [];
  void callback() {
    setState(() {
      selectedPlaylist = "none";
    });
  }

  _showDialog() async {
    await showDialog<String>(
      context: context,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: Column(children: [
          TextField(
            autofocus: true,
            decoration: new InputDecoration(labelText: 'Enter Playlist Name'),
            controller: nameController,
          ),
          TextField(
            autofocus: true,
            decoration:
                new InputDecoration(labelText: 'Enter Playlist Description'),
            controller: descController,
          ),
        ]),
        actions: <Widget>[
          new FlatButton(
              child: const Text('CREATE'),
              onPressed: () {
                CreatePlaylist(nameController.text, descController.text,
                    firebaseUser.email);
                Navigator.pop(context);
              })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              getSearchBar('Search album, song..'),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                child: new Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.blue,
                    ),
                    child: Center(
                        child: new Text(
                      "Create Playlist",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ))),
                onTap: _showDialog,
              ),
              SizedBox(
                height: 30,
              ),
              selectedPlaylist == "none"
                  ? PlayListBuilder(getUserPlaylists(firebaseUser.email))
                  : CustomPlaylist(
                      pid: selectedPlaylistId,
                      pname: selectedPlaylist,
                      pdesc: selectedPlaylistDesc,
                      psongs: selectedPlaylistSongs,
                      callback: callback,
                      q: getUserPlaylistSongs(selectedPlaylistId)),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                  child: getNowPlaying(
                      'Perfect', '(Ed Sheeran)', 'perfect.jpeg', 'Perfect.mp3'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NowPlaying(
                          songName: 'Perfect',
                          imglocation: 'assets/perfect.jpeg',
                          detail: 'Ed Sheeran',
                          songlocation: 'Perfect',
                        ),
                      ),
                    );
                  }),
              Slider(
                value: _currentSliderValue,
                min: 0,
                max: 60,
                divisions: 60,
                activeColor: Colors.blue[800],
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget PlayListBuilder(query) {
    return Flexible(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            margin: EdgeInsets.all(1.0),
            padding: EdgeInsets.all(1.0),
            child: getMainHeading('My Playlists')),
        SizedBox(height: 15),
        Expanded(
            child: StreamBuilder(
                stream: query,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const Text('Loading...');
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot doc = snapshot.data.documents[index];
                        return Column(children: [
                          GestureDetector(
                              child:
                                  GetPlaylist(doc['name'], doc['description']),
                              onTap: () {
                                setState(() {
                                  selectedPlaylist = doc['name'];
                                  selectedPlaylistDesc = doc['description'];
                                  selectedPlaylistSongs = doc['songs'];
                                  selectedPlaylistId = doc['id'];
                                });
                              }),
                          SizedBox(height: 15),
                          Divider(color: Colors.black),
                          SizedBox(
                            height: 15,
                          ),
                        ]);
                      });
                }))
      ],
    ));
  }

  // Widget getAllPlaylists() {
  //   return Flexible(
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.stretch,
  //         children: [
  //           Container(
  //               margin: EdgeInsets.all(1.0),
  //               padding: EdgeInsets.all(1.0),
  //               child: getMainHeading('My Playlists')),
  //           SizedBox(height: 15),
  //           Expanded(
  //             child: ListView.builder(
  //                 scrollDirection: Axis.vertical,
  //                 itemCount: playlists.length,
  //                 itemBuilder: (context, index) {
  //                   return Column(children: [
  //                     GestureDetector(
  //                         child: GetPlaylist(
  //                             playlists[index].name, playlists[index].desc),
  //                         onTap: () {
  //                           setState(() {
  //                             selectedPlaylist = playlists[index].name;
  //                             selectedPlaylistDesc = playlists[index].desc;
  //                           });
  //                         }),
  //                     SizedBox(height: 15),
  //                     Divider(color: Colors.black),
  //                     SizedBox(
  //                       height: 15,
  //                     ),
  //                   ]);
  //                 }),
  //           ),
  //         ],
  //       ));
  // }

  Widget CurrentPlaylist(String pname, String pdesc) {
    return Flexible(
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
                          setState(() {
                            selectedPlaylist = 'none';
                            selectedPlaylistDesc = 'none';
                          });
                        }),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        pname,
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
                  pdesc,
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
        PlayListItemsBuilder(query: getAllSongs())
      ],
    ));
  }
}
