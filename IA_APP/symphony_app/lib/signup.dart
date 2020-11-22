import 'package:flutter/material.dart';
import 'utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  String pass,email;
  bool s=false;
  final _auth= FirebaseAuth.instance;

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
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                    child: Text('Hi',
                        style: TextStyle(fontSize: 120.0, fontWeight: FontWeight.bold, color: Colors.black)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 10.0, 0.0, 0.0),
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
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
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
                    SizedBox(height: 20,),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
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
                    SizedBox(height: 20,),
                    /*textfield(Icons.vpn_key_sharp, "Enter your Password Again", "Confirm Password"),
                    SizedBox(height: 50),*/
                    SizedBox(height: 20),
                    roundbutton('Go Back', Colors.black, Colors.white, Colors.white, popfromnavigator),
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
                                      try{
                                      final newUser=await _auth.createUserWithEmailAndPassword(email: email, password: pass);
                                      if(newUser!=null){
                                      Navigator.pushNamed(context, '/homepage');
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
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                              ),
                          ),
                          ),
                          )
                          )

                  ],
                )),
          ]),
        ));
  }
}