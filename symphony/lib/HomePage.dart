import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'utilities.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _activetab = 'MOODS';
  bool heart = false;


  Widget getTextWid(String txt){
    return Text(
      txt,
      style: TextStyle(
        fontFamily: 'Segoe-UI',
        fontSize: 18.5,
        color: (_activetab == txt) ? Colors.black : Colors.grey,
        fontWeight: FontWeight.bold,
        decoration: (_activetab == txt) ? TextDecoration.underline : TextDecoration.none,
        decorationColor: Colors.blue,
        decorationThickness: 3,
        letterSpacing: 2.0,
      ),
    );
  }

  void pushtonavigator(String routename) {
    Navigator.of(context).pushNamed(routename);
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
              SizedBox(height: 30,),
              Text(
                'Browse',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'RockWell',
                  fontSize: 45,
                  color: Colors.black,
                  letterSpacing: 3.0,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 30,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: getTextWid('MOODS'),
                      onTap:(){
                        setState(() { _activetab = 'MOODS';});
                      }),
                    GestureDetector(
                      child: getTextWid('ARTISTS'),
                      onTap:(){
                        setState(() { _activetab = 'ARTISTS';});
                      },),
                    GestureDetector(
                      child: getTextWid('PODCASTS'),
                      onTap:(){
                        setState(() { _activetab = 'PODCASTS';});
                      }),
                  ]
              ),
              SizedBox(height: 30,),
              _activetab == 'MOODS' ? getMOODlayout() : (_activetab == 'ARTISTS' ? getARTISTlayout() : getPODCASTlayout())
            ],

          ),
        ),

      ),


    );
  }
}

Widget getARTISTlayout(){
  return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            Flexible(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  getArtistPoster('assets/shaan.jpg', 'Shaan'),
                  SizedBox(width:20),
                  getArtistPoster('assets/sonu.jpg', 'Sonu Nigam'),
                  SizedBox(width:20),
                  getArtistPoster('assets/shreya.jpg', 'Shreya Ghoshal'),
                ],
              ),
            ),
          SizedBox(height:10),
          getHeading('MOST PLAYED PLAYLISTS'),
          SizedBox(height:20,),
           Flexible(
               child: ListView(
                   scrollDirection: Axis.horizontal,
                   children: [
                     getPoster('assets/kishore.jpg', 'KISHORE KUMAR TOP 50', 15),
                     SizedBox(width:20),
                     getPoster('assets/arijit.webp', 'BEST OF ARIJIT SINGH', 15),
                     SizedBox(width:20),
                     getPoster('assets/kishore.jpg', 'KISHORE KUMAR TOP 50', 15),
                     SizedBox(width:20),
                     getPoster('assets/arijit.webp', 'BEST OF ARIJIT SINGH', 15),
               ]
            )
         ),
        ]
      ),
  );
}

Widget getPODCASTlayout(){
  return Flexible(
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          getHeading('TOP SHOWS'),
          Flexible(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                getPosterWithoutText('assets/dream.jpg'),
                SizedBox(width:20),
                getPosterWithoutText('assets/purpose.png'),
                SizedBox(width:20),
                getPosterWithoutText('assets/dream.jpg'),
                SizedBox(width:20),
                getPosterWithoutText('assets/purpose.png'),
              ],
            ),
          ),
          SizedBox(height:20),
          getHeading('STAY UPDATED'),
          SizedBox(height:20,),
          Flexible(
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    getPoster('assets/murder.jpg', 'MURDER MYSTERY',18),
                    SizedBox(width:20),
                    getPoster('assets/girl.jpg', 'GIRL IN SPACE', 18),
                    SizedBox(width:20),
                    getPoster('assets/murder.jpg', 'MURDER MYSTERY', 18),
                    SizedBox(width:20),
                    getPoster('assets/girl.jpg', 'GIRL IN SPACE', 18),
                  ]
              )
          ),
        ]
    ),
  );
}

Widget getMOODlayout(){
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              getPoster('assets/kas.jpg', 'KAR GAYI CHULL', 18),
              SizedBox(width:20),
              getPoster('assets/tamasha.jpg', 'MATARGASHTI', 18),
              SizedBox(width:20),
              getPoster('assets/kas.jpg', 'KAR GAYI CHULL', 18),
              SizedBox(width:20),
              getPoster('assets/tamasha.jpg', 'MATARGASHTI', 18),
            ],
          ),
        ),
        SizedBox(height:30),
        getHeading('Most Played'),
        SizedBox(height:10,),
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Divider(color: Colors.black),
              SizedBox(height: 15),
              getPlayListItem('Tum ho', 'Rockstar / 4:03 ','rockstar.jpg'),
              SizedBox(height: 15),
              Divider(color: Colors.black),
              SizedBox(height: 15,),
              getPlayListItem('Maahi Ve', 'Highway / 3:33','highway.jpg'),
              SizedBox(height: 15,),
              Divider(color: Colors.black),
              SizedBox(height: 15,),
              getPlayListItem('All of me ', 'John Legend / 2:23','null.webp'),
              SizedBox(height: 15,),
              Divider(color: Colors.black),
              SizedBox(height: 15,),
              getPlayListItem('Roobaroo', 'Rang de Basanti / 3:21','rangde.jpg'),
              SizedBox(height: 15,),
              Divider(color: Colors.black),
            ],
          ),
        ),
      ],
    ),
  );
}
