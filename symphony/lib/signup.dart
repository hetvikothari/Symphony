import 'package:flutter/material.dart';
import 'utilities.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  void popfromnavigator(param){
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
              Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                    child: Text('Hi',
                        style: TextStyle(fontSize: 120.0, fontWeight: FontWeight.bold, color: Colors.black)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 100.0, 0.0, 0.0),
                    child: Text('There.',
                        style: TextStyle(fontSize: 63.0, fontWeight: FontWeight.bold, color: Colors.black)),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    textfield(Icons.person, 'Enter your first and last name', 'Name'),
                    SizedBox(height: 20,),
                    textfield(Icons.phone, 'Enter a phone number', 'Phone'),
                    SizedBox(height: 20,),
                    textfield(Icons.email, "Enter your Email", "Email"),
                    SizedBox(height: 20,),
                    textfield(Icons.vpn_key_outlined, "Enter your Password", "Password"),
                    SizedBox(height: 20,),
                    textfield(Icons.vpn_key_sharp, "Enter your Password Again", "Confirm Password"),
                    SizedBox(height: 50),
                    roundbutton('SIGN UP', Colors.white, Colors.indigo[900], Colors.indigoAccent, null),
                    SizedBox(height: 20),
                    roundbutton('Go Back', Colors.black, Colors.white, Colors.white, popfromnavigator),
                  ],
                )),
          ]),
        ));
  }
}