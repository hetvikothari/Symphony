import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utilities.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void pushtonavigator(String routename) {
    Navigator.of(context).pushNamed(routename);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){ pushtonavigator('/homepage'); },
                      child: Text('Skip this', style: TextStyle(color: Colors.black, fontSize: 20, decoration: TextDecoration.underline,), textAlign: TextAlign.right,),
                    ),
                    Container(
                      child: Text('Hi There.',
                          style: TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold, color: Colors.black)),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      textfield(Icons.email, "Enter your Email", "Email"),
                      SizedBox(height: 20.0),
                      textfield(Icons.vpn_key_sharp, "Enter your Password", "Password"),
                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: GestureDetector(
                          onTap: (){},
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontFamily: 'Montserrat', decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      roundbutton('LOGIN', Colors.white, Colors.green, Colors.greenAccent, pushtonavigator, param: '/signup'),
                      SizedBox(height: 20.0),
                    ],
                  )),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'New to Symphony ?',
                    style: TextStyle(fontFamily: 'Montserrat', color: Colors.black),
                  ),
                  SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/signup');
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.green, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}