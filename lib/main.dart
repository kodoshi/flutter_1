import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  @override
  void initState() {
    super.initState();
    audioPlayer.open(Audio('assets/sounds/lofi.mp3'),
        autoStart: false, showNotification: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Vaporware'),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: Row(
          children: <Widget>[
            Container(
              height: 195,
              width: 195,
              child: Stack(
                children: <Widget>[
                  Card(
                    child: Image.asset(
                      'assets/images/street-japan-night.jpg',
                      fit: BoxFit.cover,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 8,
                    // shadowColor: Colors.green,
                    margin: EdgeInsets.fromLTRB(20, 20, 15, 20),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black, width: 0)),
                  ),
                  Positioned(
                    top: 24,
                    left: 115,
                    child: ElevatedButton(
                      child: Icon(Icons.play_arrow),
                      onPressed: () => playSound(),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black54,
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 123,
                    left: 115,
                    child: ElevatedButton(
                      child: Icon(Icons.more_vert_sharp),
                      onPressed: () => print("MENU"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black54,
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 195,
              width: 195,
              child: Stack(
                children: <Widget>[
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 7,
                    color: Colors.blue,
                    // shadowColor: Colors.green,
                    margin: EdgeInsets.fromLTRB(15, 20, 20, 20),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                  ),
                  Center(
                    child: ElevatedButton(
                      child: Icon(Icons.add_box_rounded),
                      onPressed: () => print("MENU"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(60, 60),
                        primary: Colors.black54,
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromRGBO(20, 25, 39, 1)
        //bottomNavigationBar: ,
        );
  }

  void playSound() {
    setState(() {
      isPlaying = !isPlaying;
      if (isPlaying) {
        audioPlayer.play();
      } else {
        audioPlayer.pause();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer.dispose();
    super.dispose();
  }
}