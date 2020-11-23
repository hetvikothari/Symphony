
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:symphony/utilities.dart';
import 'nowplaying.dart';

class PlayListItemsBuilder extends StatelessWidget {
  @required Stream<QuerySnapshot> query;

  PlayListItemsBuilder({
    Key key,
    this.query
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: StreamBuilder(
            stream: query,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading...');
              return ListView.builder(
                  itemExtent: 80,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot doc = snapshot.data.documents[index];
                    Widget w1 = getPlayListItem(
                        doc['name'], doc['description'],
                        doc['image_location']
                    );
                    Widget w2 = NowPlaying(
                      songName: doc['name'],
                      imglocation: doc['image_location'],
                      detail: doc['description'],
                    );
                    return ItemBuilder(w1, w2, doc);
                  }
              );
            }
        )
    );
  }
}

class ItemBuilder extends StatelessWidget {
  @required Widget SongItem;
  @required Widget NavItem;
  @required DocumentSnapshot doc;

  ItemBuilder(this.SongItem, this.NavItem, this.doc);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          GestureDetector(
              child: SongItem,
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => NavItem));}
          ),
          SizedBox(height: 10),
          Divider(color: Colors.black),
          SizedBox(height: 10,),
        ]
    );
  }
}

