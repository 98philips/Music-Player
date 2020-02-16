import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Player") ,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 25,
          itemBuilder: (BuildContext buildContext, int index){
            return Card(
              child: Container(
                padding: EdgeInsets.all(16),
                  child:Text("Music File "+ index.toString()
                  )
              ),
            );
          }),
    );
  }
}