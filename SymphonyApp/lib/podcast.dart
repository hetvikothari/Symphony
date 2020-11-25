import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'buildLists.dart';
import 'db_objects.dart';
import 'utilities.dart';


class MyPodcast extends StatefulWidget {
  @override
  _MyPodcastState createState() => _MyPodcastState();
}

class _MyPodcastState extends State<MyPodcast> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: getPodcastList()
      )
    );
  }

  Widget getPodcastList()
  {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          getSearchBar('Search album, song..'),
          SizedBox(height: 30,),
          getMainHeading('Podcasts'),
          SizedBox(height:20,),
          getHeading('Crime'),
          SizedBox(height: 5,),
          PosterListBuilder(query: getGenrePodcast('Crime'),),
          SizedBox(height: 5),
          getHeading('Science & Technology'),
          SizedBox(height: 5),
          PosterListBuilder(query: getGenrePodcast('Science & Technology'),)
        ],
      ),
    );
  }
}


