import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  MyHomePage({super.key});

  Map<String, String> photos = {
    "Sample Photo 1": "Category 1",
    "Sample Photo 2": "Category 2",
    "Sample Photo 3": "Category 3",
    "Sample Photo 4": "Category 4",
    "Sample Photo 5": "Category 5",
  };

  snackBarMsg(message, context){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /*AppBar*/
      appBar: AppBar(
        title: const Text("Photo Gallery"),
        centerTitle: true,
      ),

      /*Floating Action Button*/
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          snackBarMsg("Photos Uploaded Successfully!", context);
        },
        child: const Icon(Icons.cloud_upload),
      ),

      /*Body of this application*/
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(children: [
          /*Container*/
          Container(
            alignment: Alignment.center,
            child: const Text("Welcome to My Photo Gallery!",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),


          /*SizedBox*/
          const SizedBox(height: 20),

          /*TextField*/
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child:  TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                prefixIcon: Icon(Icons.search, color: Colors.black,),
                hintText: "Search",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue, width: 2
                    )
                ),
              ),
            ),
          ),

          /*SizedBox*/
          const SizedBox(height: 20),

          /*Wrap*/
          Wrap(
              spacing: 10, runSpacing: 10,
              children: const [
                Images(number: 1),
                Images(number: 2),
                Images(number: 3),
                Images(number: 4),
                Images(number: 5),
                Images(number: 6),
              ]),

          /*SizedBox*/
          const SizedBox(height: 20),

          /*ListView and ListTile*/
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: photos.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTccAUbsX5rEZUPfzQmOHTb_7fptbxzx2Szvi2akXSGKQ&s"),
                title: Text(photos.keys.elementAt(index).toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(photos.values.elementAt(index).toString()),
              );
            },
          )
        ]),
      ),
    );
  }

}

class Images extends StatelessWidget{
  final int number;
  const Images({super.key, required this.number});

  mySnackBar(message, context){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(

        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,padding: EdgeInsets.zero,
            side: const BorderSide(color: Colors.white),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
        ),
        onPressed: (){
          mySnackBar("Clicked on photo!", context);
        },
        child: Stack(children: [
          Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTccAUbsX5rEZUPfzQmOHTb_7fptbxzx2Szvi2akXSGKQ&s",
            width: 123, height: 123, fit: BoxFit.fill,),
          Positioned.fill(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(color: Colors.black.withOpacity(0.5),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text("Image $number", style: const TextStyle(color: Colors.white),
                    ),
                  )
              )
          )
        ])
    );
  }

}

