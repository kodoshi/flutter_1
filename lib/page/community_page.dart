import 'package:flutter/material.dart';
import 'package:flutter_1/widget/music/music_tile.dart';

class MyCommunityPage extends StatefulWidget {
  @override
  _MyCommunityPageState createState() => _MyCommunityPageState();
}

class _MyCommunityPageState extends State<MyCommunityPage> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Vaporware'),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(width / 16, height / 16, 0, 0),
                width: width,
                height: 100,
                child: Text('Community',
                    style: TextStyle(fontSize: 30, color: Colors.white))),
            Container(
                child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                  height: height / 25,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Pop Music'),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          (Colors.blueGrey[900])!),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0)))))),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Rock'),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          (Colors.blueGrey[900])!),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0)))))),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Hip Hop'),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          (Colors.blueGrey[900])!),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0)))))),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Summer'),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          (Colors.blueGrey[900])!),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0)))))),
                    ],
                  )),
            )),
            // Container(
            //     child: GridView.count(
            //   primary: false,
            //   crossAxisCount: 2,
            //   crossAxisSpacing: 10,
            //   scrollDirection: ,
            //   children: [],
            // ))
            Container(
                child: SizedBox(
                    height: 200,
                    child: GridView.count(
                      //primary: false,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(25),
                      crossAxisSpacing: 12.5,
                      mainAxisSpacing: 12.5,
                      crossAxisCount: 1,
                      children: <Widget>[
                        MusicTile(
                          trackName: 'assets/sounds/tropical.mp3',
                          imageName: 'assets/images/street-japan-night.jpg',
                          metaTitle: 'Lo-Fi',
                          metaArtist: 'Various Artists',
                          metaAlbum: 'Instrumentals',
                        ),
                        MusicTile(
                          trackName: 'assets/sounds/tropical.mp3',
                          imageName: 'assets/images/street-japan-night.jpg',
                          metaTitle: 'Lo-Fi',
                          metaArtist: 'Various Artists',
                          metaAlbum: 'Instrumentals',
                        ),
                        MusicTile(
                          trackName: 'assets/sounds/tropical.mp3',
                          imageName: 'assets/images/street-japan-night.jpg',
                          metaTitle: 'Lo-Fi',
                          metaArtist: 'Various Artists',
                          metaAlbum: 'Instrumentals',
                        ),
                        MusicTile(
                          trackName: 'assets/sounds/tropical.mp3',
                          imageName: 'assets/images/street-japan-night.jpg',
                          metaTitle: 'Lo-Fi',
                          metaArtist: 'Various Artists',
                          metaAlbum: 'Instrumentals',
                        ),
                        MusicTile(
                          trackName: 'assets/sounds/tropical.mp3',
                          imageName: 'assets/images/street-japan-night.jpg',
                          metaTitle: 'Lo-Fi',
                          metaArtist: 'Various Artists',
                          metaAlbum: 'Instrumentals',
                        )
                      ],
                    ))),
            Container(
                child: SizedBox(
                    height: 200,
                    child: GridView.count(
                      //primary: false,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(25),
                      crossAxisSpacing: 12.5,
                      mainAxisSpacing: 12.5,
                      crossAxisCount: 1,
                      children: <Widget>[
                        MusicTile(
                          trackName: 'assets/sounds/tropical.mp3',
                          imageName: 'assets/images/street-japan-night.jpg',
                          metaTitle: 'Lo-Fi',
                          metaArtist: 'Various Artists',
                          metaAlbum: 'Instrumentals',
                        ),
                        MusicTile(
                          trackName: 'assets/sounds/tropical.mp3',
                          imageName: 'assets/images/street-japan-night.jpg',
                          metaTitle: 'Lo-Fi',
                          metaArtist: 'Various Artists',
                          metaAlbum: 'Instrumentals',
                        ),
                        MusicTile(
                          trackName: 'assets/sounds/tropical.mp3',
                          imageName: 'assets/images/street-japan-night.jpg',
                          metaTitle: 'Lo-Fi',
                          metaArtist: 'Various Artists',
                          metaAlbum: 'Instrumentals',
                        ),
                        MusicTile(
                          trackName: 'assets/sounds/tropical.mp3',
                          imageName: 'assets/images/street-japan-night.jpg',
                          metaTitle: 'Lo-Fi',
                          metaArtist: 'Various Artists',
                          metaAlbum: 'Instrumentals',
                        ),
                        MusicTile(
                          trackName: 'assets/sounds/tropical.mp3',
                          imageName: 'assets/images/street-japan-night.jpg',
                          metaTitle: 'Lo-Fi',
                          metaArtist: 'Various Artists',
                          metaAlbum: 'Instrumentals',
                        )
                      ],
                    ))),
          ],
        ),
        backgroundColor: Color.fromRGBO(20, 25, 39, 1));
  }
}
