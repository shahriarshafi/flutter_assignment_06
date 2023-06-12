import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Photo Gallery"),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(height: 20, width: 1000 , alignment: Alignment.center, child: Text("Welcome to my photo Gallery"),),
            Padding(padding: EdgeInsets.all(10) , child: TextField(
              decoration: InputDecoration(
                labelText: "Search For Photos" ,
                border: OutlineInputBorder(),
              ),
            ),)
          ],
        ),
      ),
    );
  }

}