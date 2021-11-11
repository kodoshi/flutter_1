import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/api/playlist/services.dart';
import 'package:flutter_1/api/tile/services.dart';
import 'package:flutter_1/bloc/playlist/bloc.dart';
import 'package:flutter_1/bloc/playlist/event.dart';
import 'package:flutter_1/bloc/playlist/state.dart';
import 'package:flutter_1/bloc/tile/bloc.dart';
import 'package:flutter_1/utils/globalVars.dart';
import 'package:flutter_1/widget/footer.dart';
import 'package:flutter_1/widget/music/playlist_category.dart';

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
  final _tileBloc = TilesBloc(repository: TileServices());

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
        body: Center(
          child: StreamBuilder(
              stream: _playlistBloc.playlists,
              initialData: PlaylistInitState(),
              builder: (BuildContext context,
                  AsyncSnapshot<PlaylistState> snapshot) {
                print(snapshot.data.toString());
                if (snapshot.data is PlaylistLoadedState) {
                  PlaylistLoadedState data = snapshot.data as PlaylistLoadedState;
                  return ListView(

                    children: <Widget>[
                      PlaylistCategory(name: "instrumental", data: data.playlists, tileBloc: _tileBloc),
                      PlaylistCategory(name: "nature", data: data.playlists, tileBloc: _tileBloc),
                      PlaylistCategory(name: "pop", data: data.playlists, tileBloc: _tileBloc),
                    ],
                  );
                } else if (snapshot.data is PlaylistErrorState) {
                  PlaylistErrorState error =
                      snapshot.data as PlaylistErrorState;
                  return AlertDialog(
                    title: Text("API Error"),
                    content: Text(error.message),
                    actions: [
                      TextButton(
                          onPressed: () {
                            _playlistBloc.playlistEventSink.add(error.event);
                          },
                          child: Text("Refresh"))
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        bottomNavigationBar: new Footer(page: "playlists"));
  }

  @override
  void dispose() {
    super.dispose();
    _playlistBloc.dispose();
    _tileBloc.dispose();
  }
}
