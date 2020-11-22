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


  _signOut() async {
    await _firebaseAuth.signOut();
    Navigator.pushNamed(context, "/");
  }

  void pushtonavigator(String routename) {
    Navigator.of(context).pushNamed(routename);
  }

  @override
  Widget build(BuildContext context) {
    return firebaseUser!=null? getProfile() : LoginPage();
  }

  Widget getProfile()
  {
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
                child:
                Stack(
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
                      ),),

                  ],
                ),),
              SizedBox(height: 10),
              Text(
                firebaseUser.email,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Calibri',
                    color: Colors.black87
                ),
              ),
              SizedBox(height: 5),
              Text(
                  firebaseUser.email,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Calibri',
                      fontWeight: FontWeight.w400,
                      color: Colors.black87
                  )
              ),
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
              SizedBox(height: 30),
              ProfileListItem(
                Icons.privacy_tip_outlined,
                'Privacy',
              ),
              ProfileListItem(
                Icons.settings,
                'Settings',
              ),
              ProfileListItem(
                Icons.help_outline,
                'Help and Support',
              ),
              ProfileListItem(
                Icons.person_add_rounded,
                'Invite a Friend',
              ),
              GestureDetector(
                  child: ProfileListItem(
                    Icons.logout,
                    'Log out',
                  ),
                  onTap:(){
                    _signOut();
                  }
              ),




            ],
          ),
        ),
      ),
    );
  }
}




