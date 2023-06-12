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

    mySnackbar(context , msg){
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    };

    var MyItems = [
      {"img" : "https://upload.wikimedia.org/wikipedia/en/thumb/e/e2/IMG_Academy_Logo.svg/800px-IMG_Academy_Logo.svg.png" , "title" : ""},
      {"img" : "https://upload.wikimedia.org/wikipedia/en/thumb/e/e2/IMG_Academy_Logo.svg/800px-IMG_Academy_Logo.svg.png" , "title" : ""},
      {"img" : "https://upload.wikimedia.org/wikipedia/en/thumb/e/e2/IMG_Academy_Logo.svg/800px-IMG_Academy_Logo.svg.png" , "title" : ""},
      {"img" : "https://upload.wikimedia.org/wikipedia/en/thumb/e/e2/IMG_Academy_Logo.svg/800px-IMG_Academy_Logo.svg.png" , "title" : ""},
      {"img" : "https://upload.wikimedia.org/wikipedia/en/thumb/e/e2/IMG_Academy_Logo.svg/800px-IMG_Academy_Logo.svg.png" , "title" : ""},
      {"img" : "https://upload.wikimedia.org/wikipedia/en/thumb/e/e2/IMG_Academy_Logo.svg/800px-IMG_Academy_Logo.svg.png" , "title" : ""},
    ];

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
            ),),
            Container(
              height: 100,
              width:  20,
              child: ListView.builder(itemCount: MyItems.length,itemBuilder : (context , index){
                return GestureDetector(
            child: Container(height: 100, width: 100,
                 child: Image.network(MyItems[index]['img']! , fit: BoxFit.fill,),
),
                );
              }),),
            Container(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: (){
                  mySnackbar(context , "Photo Uploaded Successfully");
                },
                iconSize: 100,
                color: Colors.deepPurple,
                icon: Icon(
                  Icons.cloud_upload,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}