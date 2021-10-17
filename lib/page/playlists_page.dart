import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/utils/globalVars.dart';
import 'package:flutter_1/widget/footer.dart';
import 'package:flutter_1/page/specific_playlist_page.dart';
import 'package:flutter_1/widget/music/music_tile.dart';

class PlaylistsPage extends StatefulWidget {
  @override
  _PlaylistsPageState createState() => _PlaylistsPageState();
}

class _PlaylistsPageState extends State<PlaylistsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          title: Text(getText('playlists').toString()),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width / 16,
                    MediaQuery.of(context).size.height / 32,
                    0,
                    0),
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: Text(getText('instrumental').toString(),
                    style: TextStyle(fontSize: 30))),
            Container(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width / 16, 0, 0, 0),
                width: MediaQuery.of(context).size.width,
                height: 30,
                child: Text(getText('instrumentalDescription').toString(),
                    style: TextStyle(fontSize: 20))),
            Container(
                child: SizedBox(
                    height: 180,
                    child: GridView.count(
                      //primary: false,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 12.5,
                      mainAxisSpacing: 12.5,
                      crossAxisCount: 1,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            specificPlaylistInfo = {
                              'id': '0',
                              'mainName': 'Lo-Fi',
                              'description': 'Lorem Ipsum',
                              'category': 'Instrumentals',
                              'songs': 'lofi',
                            };
                            setState(() {
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SpecificPlaylistPage()));
                          },
                          child: placeholderTiles[0],
                        ),
                        GestureDetector(
                          onTap: () {
                            specificPlaylistInfo = {
                              'id': '1',
                              'mainName': 'Lo-Fi',
                              'description': 'Lorem Ipsum',
                              'category': 'Instrumentals',
                              'songs': 'lofi4',
                            };
                            setState(() {
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SpecificPlaylistPage()));
                          },
                          child: placeholderTiles[1],
                        ),
                        GestureDetector(
                          onTap: () {
                            specificPlaylistInfo = {
                              'id': '2',
                              'mainName': 'Lo-Fi1',
                              'description': 'Lorem Ipsum2',
                              'category': 'Instrumentals3',
                              'songs': 'lofi4',
                            };
                            setState(() {
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SpecificPlaylistPage()));
                          },
                          child: placeholderTiles[2],
                        ),
                        GestureDetector(
                          onTap: () {
                            specificPlaylistInfo = {
                              'id': '3',
                              'mainName': 'Lo-Fi1',
                              'description': 'Lorem Ipsum2',
                              'category': 'Instrumentals3',
                              'songs': 'lofi4',
                            };
                            setState(() {
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SpecificPlaylistPage()));
                          },
                          child: placeholderTiles[3],
                        ),
                      ],
                    ))),
            Container(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width / 16,
                    MediaQuery.of(context).size.height / 32,
                    0,
                    0),
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: Text(getText('nature').toString(),
                    style: TextStyle(fontSize: 30))),
            Container(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width / 16, 0, 0, 0),
                width: MediaQuery.of(context).size.width,
                height: 30,
                child: Text(getText('natureDescription').toString(),
                    style: TextStyle(fontSize: 20))),
            Container(
                child: SizedBox(
                    height: 180,
                    child: GridView.count(
                      //primary: false,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 12.5,
                      mainAxisSpacing: 12.5,
                      crossAxisCount: 1,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            specificPlaylistInfo = {
                              'id': '4',
                              'mainName': 'Lo-Fi1',
                              'description': 'Lorem Ipsum2',
                              'category': 'Instrumentals3',
                              'songs': 'lofi4',
                            };
                            setState(() {
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SpecificPlaylistPage()));
                          },
                          child: placeholderTiles[4],
                        ),
                        GestureDetector(
                          onTap: () {
                            specificPlaylistInfo = {
                              'id': '5',
                              'mainName': 'Lo-Fi1',
                              'description': 'Lorem Ipsum2',
                              'category': 'Instrumentals3',
                              'songs': 'lofi4',
                            };
                            setState(() {
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SpecificPlaylistPage()));
                          },
                          child: placeholderTiles[5],
                        ),
                        GestureDetector(
                          onTap: () {
                            specificPlaylistInfo = {
                              'id': '6',
                              'mainName': 'Lo-Fi1',
                              'description': 'Lorem Ipsum2',
                              'category': 'Instrumentals3',
                              'songs': 'lofi4',
                            };
                            setState(() {
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SpecificPlaylistPage()));
                          },
                          child: placeholderTiles[6],
                        ),
                        GestureDetector(
                          onTap: () {
                            specificPlaylistInfo = {
                              'id': '7',
                              'mainName': 'Lo-Fi1',
                              'description': 'Lorem Ipsum2',
                              'category': 'Instrumentals3',
                              'songs': 'lofi4',
                            };
                            setState(() {
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SpecificPlaylistPage()));
                          },
                          child: placeholderTiles[7],
                        ),
                      ],
                    ))),
          ],
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        bottomNavigationBar: new Footer(page: "playlists"));
  }
}