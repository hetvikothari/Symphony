import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'utilities.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String email,pass;
  bool s=false;
  final _auth=FirebaseAuth.instance;

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
                    TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: "Enter your Email",
                    labelText: "Email",
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                    ),
                  ),
                  onChanged: (value) {
                    email=value;
                  },

                ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          icon: Icon(Icons.vpn_key_sharp),
                          hintText: "Enter your Password",
                          labelText: "Password",
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          ),
                        ),
                        onChanged: (value) {
                          pass=value;
                        },

                      ),
                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: GestureDetector(
                          onTap: (){},
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.bold, fontFamily: 'Montserrat', decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.white,
                            color: Colors.indigo[900],
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: ()
                              async{
                                setState(() {
                                  s=true;
                                });
                                try {
                                  final user = await _auth.signInWithEmailAndPassword(
                                      email: email, password: pass);
                                  if (user != null) {
                                    Navigator.pushNamed(context, "/homepage");
                                  }
                                  setState(() {
                                    s=false;
                                  });
                                }catch(e){
                                  print(e);
                                }
                              }
                              ,
                              child: Center(
                                child: Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                      color: Colors.indigoAccent,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )
                      ),

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
                      style: TextStyle(color: Colors.indigo[900], fontFamily: 'Montserrat', fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}