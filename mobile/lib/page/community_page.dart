import 'package:flutter/material.dart';
import 'package:flutter_1/api/playlist/services.dart';
import 'package:flutter_1/bloc/common/state.dart';
import 'package:flutter_1/bloc/playlist/bloc.dart';
import 'package:flutter_1/bloc/playlist/event.dart';
import 'package:flutter_1/bloc/playlist/state.dart';
import 'package:flutter_1/model/playlist.dart';
import 'package:flutter_1/utils/globalVars.dart';
import 'package:flutter_1/widget/community/category_button.dart';
import 'package:flutter_1/widget/error/alert_error.dart';
import 'package:flutter_1/widget/footer.dart';
import 'package:flutter_1/widget/music/minimal_music_tile.dart';

/// this page contains the most liked and played playlists from the user community
/// at the moment has mostly placeholders since this info is needed from the backend
class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  var size, height, width;
  final _playlistBloc = PlaylistsBloc(repository: PlaylistServices());

  List<Widget> _buildMinimalTiles(List<Playlist> playlists) {
    return List<Widget>.from(playlists
        .map((item) => MinimalMusicTile(
              imageName: item.image,
              metaTitle: item.metaTitle,
            ))
        .toList());
  }

  @override
  void initState() {
    super.initState();
    _playlistBloc.playlistEventSink.add(PlaylistGetEvent());
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          title: Text(getText('community').toString()),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(width / 16, height / 16, 0, 0),
                width: width,
                height: 100,
                child: Text(getText('communityFavorites').toString(), style: TextStyle(fontSize: 30))),
            Container(
                child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                  height: height / 25,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: <Widget>[
                      CategoryButton(category: "Pop"),
                      CategoryButton(category: "Nature"),
                      CategoryButton(category: "Instrumental"),
                    ],)),)),
            StreamBuilder(
              stream: _playlistBloc.playlists,
              initialData: PlaylistInitState(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data is PlaylistLoadedState) {
                  PlaylistLoadedState data = snapshot.data as PlaylistLoadedState;
                  return Container(
                      child: SizedBox(
                          height: 200,
                          child: GridView.count(
                            //primary: false,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.all(25),
                            crossAxisSpacing: 12.5,
                            mainAxisSpacing: 12.5,
                            crossAxisCount: 1,
                            children: _buildMinimalTiles(data.playlists),)));
                } else if (snapshot.data is PlaylistErrorState) {
                  PlaylistErrorState error = snapshot.data as PlaylistErrorState;
                  return AlertError(
                      error: error,
                      callback: (ErrorState error) =>
                          _playlistBloc.playlistEventSink.add(error.event as PlaylistEvent));
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }},),],),
        backgroundColor: Theme.of(context).backgroundColor,
        bottomNavigationBar: new Footer(page: "community"));
  }

  @override
  void dispose() {
    _playlistBloc.dispose();
    super.dispose();
  }
}
