import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class Play extends StatefulWidget{
//   @override
//   _PlayState createState() => _PlayState();
// }
// class _PlayState extends State<Play>
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Scaffold(
  // @override
  // Widget build(BuildContext context){
  //   return Scaffold(

      appBar: AppBar(
        title: Text("Now Playing")
        ,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Row(
                children: [Icon(Icons.add),Spacer(),
                Icon(Icons.favorite)],
                ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0),
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "images/kas.jpg",
                    height: 300,
                    fit: BoxFit.cover,
                    )
                  ),
              ),
                Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                  child:Column(
                    children: [
                      Text("Kar Gayi Chull",
                      style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                      ),

                      Text("Kapoor & Sons")],)
                ),
                Row(
                  children:[
                    Text("1:20"),
                    Flexible(
                      flex:1,
                    child:Slider(
                      activeColor:Colors.pink,
                      onChanged: (v){},
                      max: 100,
                      min:0,
                      value:20,
                    )
                    ),
                    Text("5:50"),
                  ]
                ),

                Row(

                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_left,
                      size:70
                      ),
                      SizedBox(width: 20,),
                    Icon(
                      Icons.pause_circle_outline,
                      size: 60
                      ),
                      SizedBox(width: 20,),
                    Icon(
                      Icons.arrow_right,
                      size: 70)
                    ],)

            ],
          ),
        ),
      ),
    ),
  );
}
}