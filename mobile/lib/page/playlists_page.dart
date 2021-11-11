import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/api/playlist/services.dart';
import 'package:flutter_1/bloc/playlist/bloc.dart';
import 'package:flutter_1/bloc/playlist/event.dart';
import 'package:flutter_1/page/specific_playlist_page.dart';
import 'package:flutter_1/utils/globalVars.dart';
import 'package:flutter_1/widget/footer.dart';

/// this page is responsible for showing categories and specific playlists that can be chosen by the user
/// when these playlists are clicked or tapped, this page will redirect to SpecificPlaylistPage
/// some of these categories are repeated or placeholders for the moment
/// in the future most of the palceholder info will be gathered from the backend, dynamically
class PlaylistsPage extends StatefulWidget {
  @override
  _PlaylistsPageState createState() => _PlaylistsPageState();
}

class _PlaylistsPageState extends State<PlaylistsPage> {
  final _playlistBloc = PlaylistsBloc(repository: PlaylistServices());

  @override
  void initState() {
    super.initState();

    _playlistBloc.playlistEventSink.add(PlaylistGetEvent());
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
                              'mainName': 'Trappin',
                              'description':
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              'category': 'Instrumentals',
                              'songs': 'lofi',
                            };
                            setState(() {});
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
                              'mainName': 'Trappin',
                              'description':
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              'category': 'Instrumentals',
                              'songs': 'lofi',
                            };
                            setState(() {});
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
                              'mainName': 'Trappin',
                              'description':
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              'category': 'Instrumentals',
                              'songs': 'lofi',
                            };
                            setState(() {});
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
                              'mainName': 'Trappin',
                              'description':
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              'category': 'Instrumentals',
                              'songs': 'lofi',
                            };
                            setState(() {});
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
                              'mainName': 'Tropical',
                              'description':
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              'category': 'Nature',
                              'songs': 'tropical',
                            };
                            setState(() {});
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
                              'mainName': 'Tropical',
                              'description':
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              'category': 'Nature',
                              'songs': 'tropical',
                            };
                            setState(() {});
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
                              'mainName': 'Tropical',
                              'description':
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              'category': 'Nature',
                              'songs': 'tropical',
                            };
                            setState(() {});
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
                              'mainName': 'Tropical',
                              'description':
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              'category': 'Nature',
                              'songs': 'tropical',
                            };
                            setState(() {});
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

  @override
  void dispose() {
    super.dispose();
    _playlistBloc.dispose();
  }
}

/*
ListView(
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
                              'mainName': 'Trappin',
                              'description':
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              'category': 'Instrumentals',
                              'songs': 'lofi',
                            };
                            setState(() {});
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
                              'mainName': 'Trappin',
                              'description':
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              'category': 'Instrumentals',
                              'songs': 'lofi',
                            };
                            setState(() {});
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
                              'mainName': 'Trappin',
                              'description':
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              'category': 'Instrumentals',
                              'songs': 'lofi',
                            };
                            setState(() {});
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
                              'mainName': 'Trappin',
                              'description':
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              'category': 'Instrumentals',
                              'songs': 'lofi',
                            };
                            setState(() {});
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
                              'mainName': 'Tropical',
                              'description':
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              'category': 'Nature',
                              'songs': 'tropical',
                            };
                            setState(() {});
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
                              'mainName': 'Tropical',
                              'description':
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              'category': 'Nature',
                              'songs': 'tropical',
                            };
                            setState(() {});
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
                              'mainName': 'Tropical',
                              'description':
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              'category': 'Nature',
                              'songs': 'tropical',
                            };
                            setState(() {});
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
                              'mainName': 'Tropical',
                              'description':
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              'category': 'Nature',
                              'songs': 'tropical',
                            };
                            setState(() {});
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
 */

/*
Center(
        child: StreamBuilder(
            stream: _playlistBloc.playlists,
            initialData: PlaylistInitState(),
            builder: (BuildContext context, AsyncSnapshot<PlaylistState> snapshot) {
              print(snapshot.data.toString());
              if (snapshot.data is PlaylistLoadedState) {
                return Text((snapshot.data as PlaylistLoadedState).playlists[0].description);
              } else if (snapshot.data is PlaylistErrorState) {
                return Text("Error");
              } else {
                return Text("Loading ...");
              }
            }
      ),
    ),
 */
