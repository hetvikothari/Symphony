import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'utilities.dart';
import 'db_objects.dart';
import 'nowplaying.dart';


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
          Flexible(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: crime_podcasts.length,
                itemBuilder: (context, index){
                  return Row(
                      children: [
                        GestureDetector(
                            child: getPoster(crime_podcasts[index].imglocation, crime_podcasts[index].songName, 18),
                            onTap:() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    NowPlaying(
                                      songName: crime_podcasts[index].songName,
                                      imglocation:crime_podcasts[index].imglocation,
                                      detail: crime_podcasts[index].detail,
                                    ),
                                ),
                              );
                            }
                        ),
                        SizedBox(width: 15),
                      ]
                  );
                }
            ),
          ),
          SizedBox(height: 5),
          getHeading('Science & Technology'),
          SizedBox(height: 5),
          Flexible(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sci_podcasts.length,
                itemBuilder: (context, index){
                  return Row(
                      children:[
                        GestureDetector(
                            child: getPoster(sci_podcasts[index].imglocation, sci_podcasts[index].songName, 18),
                            onTap:() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    NowPlaying(
                                      songName: sci_podcasts[index].songName,
                                      imglocation:sci_podcasts[index].imglocation,
                                      detail: sci_podcasts[index].detail,
                                    ),
                                ),
                              );
                            }
                        ),
                        SizedBox( width: 15),
                      ]
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}


