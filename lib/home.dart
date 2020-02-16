import 'dart:io';

import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home>{


  List<FileSystemEntity> _files;
  List<FileSystemEntity> _songs = [];
  AudioPlayer audioPlayer;
  AudioPlayerState playerState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSongs();
    audioPlayer = new AudioPlayer();
    playerState = AudioPlayerState.PAUSED;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Player") ,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _songs.length,
          itemBuilder: (BuildContext buildContext, int index){
            return GestureDetector(
                child:Card(
              child: Container(
                padding: EdgeInsets.all(16),
                  child:Text(
                      _songs.elementAt(index).path.split('/').last.replaceAll(".mp3", "")
                  )
              ),
            ),
              onTap: (){
                  if(playerState == AudioPlayerState.PAUSED){
                    play(_songs[index]);
                  }else{
                    pause();
                  }

            },
            );
          }),
    );
  }

  Future<void> play(FileSystemEntity file) async {
    await audioPlayer.play(file.path);
    setState(() => playerState = AudioPlayerState.PLAYING);
  }

  Future<void> pause() async {
    await audioPlayer.pause();
    setState(() => playerState = AudioPlayerState.PAUSED);
  }

  getSongs(){
    Directory dir = Directory('/storage/emulated/0/');
    String mp3Path = dir.toString();
    print(mp3Path);
    _files = dir.listSync(recursive: true, followLinks: false);
    for(FileSystemEntity entity in _files) {
      String path = entity.path;
      if(path.endsWith('.mp3'))
        setState(() {
          _songs.add(entity);
        });

    }
    print(_songs);
    print(_songs.length);
  }
}