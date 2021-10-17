import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/widget/music/music_tile.dart';
import 'package:flutter_1/widget/footer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('VaporWare'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: SafeArea(
          child: GridView.count(
            //primary: false,
            padding: const EdgeInsets.all(25),
            crossAxisSpacing: 12.5,
            mainAxisSpacing: 12.5,
            crossAxisCount: 2,
            children: <Widget>[
              MusicTile(
                trackName: 'assets/sounds/lofi.mp3',
                imageName: 'assets/images/street-japan-night.jpg',
                metaTitle: 'Lo-Fi',
                metaArtist: 'Various Artists',
                metaAlbum: 'Instrumentals',
              ),
              MusicTile(
                trackName: 'assets/sounds/lofi.mp3',
                imageName: 'assets/images/street-japan-night.jpg',
                metaTitle: 'Lo-Fi',
                metaArtist: 'Various Artists',
                metaAlbum: 'Instrumentals',
              ),
              MusicTile(
                trackName: 'assets/sounds/lofi.mp3',
                imageName: 'assets/images/street-japan-night.jpg',
                metaTitle: 'Lo-Fi',
                metaArtist: 'Various Artists',
                metaAlbum: 'Instrumentals',
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromRGBO(20, 25, 39, 1),
        bottomNavigationBar: new Footer(page: "home"));
  }
}