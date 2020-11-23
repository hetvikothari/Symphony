import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'utilities.dart';
import 'login.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User firebaseUser = FirebaseAuth.instance.currentUser;
  var activetab = 'none';
  IconData i;

  _signOut() async {
    await _firebaseAuth.signOut();
    Navigator.pushNamed(context, "/");
  }

  void pushtonavigator(String routename) {
    Navigator.of(context).pushNamed(routename);
  }

  @override
  Widget build(BuildContext context) {
    return firebaseUser != null ? getProfile() : LoginPage();
  }

  Widget getProfile() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            children: [
              getSearchBar('Search album, song..'),
              Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.only(top: 30),
                child: Stack(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          heightFactor: 15,
                          widthFactor: 15,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                firebaseUser.email,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Calibri',
                    color: Colors.black87),
              ),
              SizedBox(height: 5),
              Text('Symphony User',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Calibri',
                      fontWeight: FontWeight.w400,
                      color: Colors.black87)),
              SizedBox(height: 10),
              Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue[900],
                ),
                child: Center(
                  child: Text(
                    'Upgrade to PRO',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              activetab == 'none' ? getItemList() : getItem(activetab, i),
            ],
          ),
        ),
      ),
    );
  }

  Widget getItemList() {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          GestureDetector(
              child: ProfileListItem(
                Icons.privacy_tip_outlined,
                'Privacy',
              ),
              onTap: () {
                setState(() {
                  activetab = 'Privacy';
                  i = Icons.privacy_tip_outlined;
                });
              }),
          GestureDetector(
              child: ProfileListItem(
                Icons.settings,
                'Settings',
              ),
              onTap: () {
                setState(() {
                  activetab = 'Settings';
                  i = Icons.settings;
                });
              }),
          GestureDetector(
              child: ProfileListItem(
                Icons.help_outline,
                'Help & Support',
              ),
              onTap: () {
                setState(() {
                  activetab = 'Help & Support';
                  i = Icons.help_outline;
                });
              }),
          ProfileListItem(
            Icons.person_add_rounded,
            'Invite a Friend',
          ),
          GestureDetector(
              child: ProfileListItem(
                Icons.logout,
                'Log out',
              ),
              onTap: () {
                _signOut();
              }),
        ],
      ),
    );
  }

  Widget getItem(String name, IconData i) {
    return Container(
      height: 380,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20).copyWith(
        bottom: 20,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.black12),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Row(children: <Widget>[
            GestureDetector(
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.blue[900],
                ),
                onTap: () {
                  setState(() {
                    activetab = 'none';
                  });
                }),
            SizedBox(width: 75),
            Icon(
              i,
              size: 30,
              color: Colors.blue[900],
            ),
            Text(
              activetab,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Calibri',
                  color: Colors.black87),
            ),
          ]),
          activetab == 'Privacy'
              ? getPrivacy()
              : (activetab == 'Settings' ? getSettings() : getHelp())
        ],
      ),
    );
  }

  Widget getPrivacy() {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 10),
          ListTile(
            title: Text(
              '1. While using our Site we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you.',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Calibri',
                  color: Colors.black87),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text(
              '2. In addition, we may use third party services such as Google Analytics that collect monitor and analyze this ',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Calibri',
                  color: Colors.black87),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text(
              '3. Cookies are files with small amount of data which may include an anonymous unique identifier Cookies are sent to your browser from a web site and stored on your computers hard drive',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Calibri',
                  color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget getSettings() {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 10),
          ListTile(
            title: Text(
              '1. While using our Site we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you.',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Calibri',
                  color: Colors.black87),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text(
              '2. In addition, we may use third party services such as Google Analytics that collect monitor and analyze this ',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Calibri',
                  color: Colors.black87),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text(
              '3. Cookies are files with small amount of data which may include an anonymous unique identifier Cookies are sent to your browser from a web site and stored on your computers hard drive',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Calibri',
                  color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget getHelp() {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 25),
          ListTile(
            title: Text(
              '1. We at Symphony try our best to provide satisfying services. For any help or query please contact 012345678.',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Calibri',
                  color: Colors.black87),
            ),
          ),
          SizedBox(height: 25),
          ListTile(
            title: Text(
              '2. To contact us via mail , feel free to use our mail services. Symphony@Symphony.com',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Calibri',
                  color: Colors.black87),
            ),
          ),
          SizedBox(height: 25),
          ListTile(
            title: Text(
              '3. Everyone loves feedbacks. Please send your valuable feedbacks to feedback@symphony.com',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Calibri',
                  color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
