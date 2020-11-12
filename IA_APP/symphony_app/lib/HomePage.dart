import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'utilities.dart';
import 'nowplaying.dart';
import 'selectedAlbum.dart';

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

  void pushtonavigator(String routename) {
    Navigator.of(context).pushNamed(routename);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
      child: (album==true? AlbumSongs(pname:selectedAlbum , pdesc: selectedAlbumDesc, callback: callback,) : getHome())
    ));
  }


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

  Widget getHome(){
    return Container(
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
                GestureDetector(
                    child: getPoster('assets/kas.jpg', 'KAR GAYI CHULL', 18),
                    onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                        songName:'Kar gayi Chull',
                        imglocation:'assets/kas.jpg',detail:'Kapoor and sons / 3:21'),
                    ),
                    );

                    }),
                SizedBox(width:20),
                GestureDetector(
                    child: getPoster('assets/tamasha.jpg', 'MATARGASHTI', 18),
                    onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                        songName:'Matargashti',
                        imglocation:'assets/tamasha.jpg',detail:'Tamasha / 5:41'),
                    ),
                    );

                    }),
                SizedBox(width:20),
                GestureDetector(
                    child: getPoster('assets/rangde.jpg', 'Roobaroo', 18),
                    onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                        songName:'Roobaroo',
                        imglocation:'assets/rangde.jpg',detail:'Rang de Basanti / 3:21'),
                    ),
                    );

                    }),
                SizedBox(width:20),
                GestureDetector(
                    child: getPoster('assets/kas.jpg', 'KAR GAYI CHULL', 18),
                    onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                        songName:'Kar gayi Chull',
                        imglocation:'assets/kas.jpg',detail:'Kapoor and sons / 3:21'),
                    ),
                    );

                    }),
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
                GestureDetector(
                    child: getPlayListItem('Tum ho', 'Rockstar / 4:03 ','rockstar.jpg'),
                    onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                        songName:'Tum ho',
                        imglocation:'assets/rockstar.jpg',
                        detail:'Rockstar / 4:03 '),
                    ),
                    );

                    }),
                SizedBox(height: 15),
                Divider(color: Colors.black),
                SizedBox(height: 15,),
                GestureDetector(
                    child: getPlayListItem('Maahi Ve', 'Highway / 3:33','highway.jpg'),
                    onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                        songName:'Maahi Ve',
                        imglocation:'assets/highway.jpg',detail:'Highway / 3:33'),
                    ),
                    );

                    }),
                SizedBox(height: 15,),
                Divider(color: Colors.black),
                SizedBox(height: 15,),
                GestureDetector(
                    child: getPlayListItem('All of me ', 'John Legend / 2:23', 'null.webp'),
                    onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                        songName:'All of me ',
                        imglocation:'assets/null.webp',detail:'John Legend / 2:23'),
                    ),
                    );

                    }),
                SizedBox(height: 15,),
                Divider(color: Colors.black),
                SizedBox(height: 15,),
                GestureDetector(
                    child: getPlayListItem('Roobaroo', 'Rang de Basanti / 3:21','rangde.jpg'),
                    onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                        songName:'Roobaroo',
                        imglocation:'assets/rangde.jpg',detail:'Rang de Basanti / 3:21'),
                    ),
                    );

                    }),
                SizedBox(height: 15,),
                Divider(color: Colors.black),
                SizedBox(height: 15),
                GestureDetector(
                    child: getPlayListItem('Tum ho', 'Rockstar / 4:03 ','rockstar.jpg'),
                    onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                        songName:'Tum ho',
                        imglocation:'assets/rockstar.jpg',
                        detail:'Rockstar / 4:03 '),
                    ),
                    );

                    }),
                SizedBox(height: 15),
                Divider(color: Colors.black),
                SizedBox(height: 15,),
                GestureDetector(
                    child: getPlayListItem('Maahi Ve', 'Highway / 3:33','highway.jpg'),
                    onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                        songName:'Maahi Ve',
                        imglocation:'assets/highway.jpg',detail:'Highway / 3:33'),
                    ),
                    );

                    }),
                SizedBox(height: 15,),
                Divider(color: Colors.black),
                SizedBox(height: 15,),
                GestureDetector(
                    child: getPlayListItem('All of me ', 'John Legend / 2:23', 'null.webp'),
                    onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                        songName:'All of me ',
                        imglocation:'assets/null.webp',detail:'John Legend / 2:23'),
                    ),
                    );

                    }),
                SizedBox(height: 15,),
                Divider(color: Colors.black),
                SizedBox(height: 15,),
                GestureDetector(
                    child: getPlayListItem('Roobaroo', 'Rang de Basanti / 3:21','rangde.jpg'),
                    onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(
                        songName:'Roobaroo',
                        imglocation:'assets/rangde.jpg',detail:'Rang de Basanti / 3:21'),
                    ),
                    );

                    }),
                SizedBox(height: 15,),

              ],
            ),
          ),
        ],
      ),
    );
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
                  GestureDetector(
                      child: getArtistPoster('assets/sonu.jpg', 'Sonu Nigam'),
                      onTap:(){
                        setState(() { selectedAlbum = 'Sonu Nigam'; selectedAlbumDesc = 'Artist'; album = true;});
                      }),
                  SizedBox(width:20),
                  GestureDetector(
                      child: getArtistPoster('assets/shaan.jpg', 'Shaan'),
                      onTap:(){
                        setState(() { selectedAlbum = 'Shaan'; selectedAlbumDesc = 'Artist'; album = true;});
                      }),
                  SizedBox(width:20),
                  GestureDetector(
                      child: getArtistPoster('assets/shreya.jpg', 'Shreya Ghoshal'),
                      onTap:(){
                        setState(() { selectedAlbum = 'Shreya Ghoshal'; selectedAlbumDesc = 'Artist'; album = true;});
                      }),
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

                      GestureDetector(
                          child: getPoster('assets/kishore.jpg', 'KISHORE KUMAR TOP 50', 15),
                          onTap:(){
                            setState(() { selectedAlbum = 'Kishore Kumar'; selectedAlbumDesc = 'KISHORE KUMAR TOP 50'; album = true;});
                          }),
                      SizedBox(width:20),
                      GestureDetector(
                          child: getPoster('assets/arijit.webp', 'BEST OF ARIJIT SINGH', 15),
                          onTap:(){
                            setState(() { selectedAlbum = 'Arijit Singh'; selectedAlbumDesc = 'BEST OF ARIJIT SINGH'; album = true;});
                          }),
                      SizedBox(width:20),
                      GestureDetector(
                          child: getPoster('assets/kishore.jpg', 'KISHORE KUMAR TOP 50', 15),
                          onTap:(){
                            setState(() { selectedAlbum = 'Kishore Kumar'; selectedAlbumDesc = 'KISHORE KUMAR TOP 50'; album = true;});
                          }),
                      SizedBox(width:20),
                      GestureDetector(
                          child: getPoster('assets/arijit.webp', 'BEST OF ARIJIT SINGH', 15),
                          onTap:(){
                            setState(() { selectedAlbum = 'Arijit Singh'; selectedAlbumDesc = 'BEST OF ARIJIT SINGH'; album = true;});
                          }),
                      SizedBox(width:20),

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

                  GestureDetector(
                      child: getPosterWithoutText('assets/dream.jpg'),
                      onTap:(){
                        setState(() { selectedAlbum = 'Dreams'; selectedAlbumDesc = 'Podcasts'; album = true;});
                      }),
                  SizedBox(width:20),
                  GestureDetector(
                      child: getPosterWithoutText('assets/purpose.png'),
                      onTap:(){
                        setState(() { selectedAlbum = 'Purpose'; selectedAlbumDesc = 'Podcasts'; album = true;});
                      }),
                  SizedBox(width:20),
                  GestureDetector(
                      child: getPosterWithoutText('assets/dream.jpg'),
                      onTap:(){
                        setState(() { selectedAlbum = 'Dreams'; selectedAlbumDesc = 'Podcasts'; album = true;});
                      }),
                  SizedBox(width:20),
                  GestureDetector(
                      child: getPosterWithoutText('assets/purpose.png'),
                      onTap:(){
                        setState(() { selectedAlbum = 'Purpose'; selectedAlbumDesc = 'Podcasts'; album = true;});
                      }),
                  SizedBox(width:20),

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
                      GestureDetector(
                          child: getPoster('assets/murder.jpg', 'MURDER MYSTERY',18),
                          onTap:(){
                            setState(() { selectedAlbum = 'Murder Mystery'; selectedAlbumDesc = 'Podcasts'; album = true;});
                          }),
                      SizedBox(width:20),
                      GestureDetector(
                          child: getPoster('assets/girl.jpg', 'GIRL IN SPACE', 18),
                          onTap:(){
                            setState(() { selectedAlbum = 'Girl in space'; selectedAlbumDesc = 'Podcasts'; album = true;});
                          }),
                      SizedBox(width:20),
                      GestureDetector(
                          child: getPoster('assets/murder.jpg', 'MURDER MYSTERY',18),
                          onTap:(){
                            setState(() { selectedAlbum = 'Murder Mystery'; selectedAlbumDesc = 'Podcasts'; album = true;});
                          }),
                      SizedBox(width:20),
                      GestureDetector(
                          child: getPoster('assets/girl.jpg', 'GIRL IN SPACE', 18),
                          onTap:(){
                            setState(() { selectedAlbum = 'Girl in space'; selectedAlbumDesc = 'Podcasts'; album = true;});
                          }),
                      SizedBox(width:20),
                    ]
                )
            ),
          ]
      ),
    );
  }


}

