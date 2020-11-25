import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:symphony/buildLists.dart';

import 'utilities.dart';
import 'db_objects.dart';

class MyFav extends StatefulWidget {
  @override
  _MyFavState createState() => _MyFavState();
}

class _MyFavState extends State<MyFav> {
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
              getMainHeading('Favourites'),
              SizedBox(
                height: 30,
              ),
              PlayListItemsBuilder(
                query: getAllSongs(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
