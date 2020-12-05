import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:symphony/utilities.dart';
import 'nowplaying.dart';

class PostersWithoutLabelBuilder extends StatelessWidget {
  @required
  Stream<QuerySnapshot> query;

  PostersWithoutLabelBuilder({Key key, this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: StreamBuilder(
            stream: query,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading...');
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // itemExtent: 80,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot doc = snapshot.data.documents[index];
                    Widget w1 = getPosterWithoutText(doc['image_location']);
                    Widget w2 = NowPlaying(
                      songName: doc['name'],
                      imglocation: doc['image_location'],
                      detail: doc['description'],
                      songlocation: doc['song_location'],
                    );
                    return PosterBuilder(w1, w2, doc);
                  });
            }));
  }
}

class PosterListBuilder extends StatelessWidget {
  @required
  Stream<QuerySnapshot> query;

  PosterListBuilder({Key key, this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: StreamBuilder(
            stream: query,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading...');
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot doc = snapshot.data.documents[index];
                    Widget w1 =
                        getPoster(doc['image_location'], doc['name'], 15);
                    Widget w2 = NowPlaying(
                      songName: doc['name'],
                      imglocation: doc['image_location'],
                      detail: doc['description'],
                      songlocation: doc['song_location'],
                    );
                    return PosterBuilder(w1, w2, doc);
                  });
            }));
  }
}

class PlayListItemsBuilder extends StatelessWidget {
  @required
  Stream<QuerySnapshot> query;

  PlayListItemsBuilder({Key key, this.query}) : super(key: key);

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
                        songName: doc['name'],
                        songDesc: doc['description'],
                        imagelocation: doc['image_location'],
                        songId: doc.id
                    );
                    // getPlayListItem(
                    //     doc['name'], doc['description'], doc['image_location']);
                    Widget w2 = NowPlaying(
                      songName: doc['name'],
                      imglocation: doc['image_location'],
                      detail: doc['description'],
                      songlocation: doc['song_location'],
                    );
                    return ItemBuilder(w1, w2, doc);
                  });
            }));
  }
}

class ItemBuilder extends StatelessWidget {
  @required
  Widget SongItem;
  @required
  Widget NavItem;
  @required
  DocumentSnapshot doc;

  ItemBuilder(this.SongItem, this.NavItem, this.doc);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
          child: SongItem,
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NavItem));
          }),
      SizedBox(height: 10),
      Divider(color: Colors.black),
      SizedBox(
        height: 10,
      ),
    ]);
  }
}

class PosterBuilder extends StatelessWidget {
  @required
  Widget PosterItem;
  @required
  Widget NavItem;
  @required
  DocumentSnapshot doc;

  PosterBuilder(this.PosterItem, this.NavItem, this.doc);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      GestureDetector(
          child: PosterItem,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavItem),
            );
          }),
      SizedBox(
        width: 15,
      ),
    ]);
  }
}
