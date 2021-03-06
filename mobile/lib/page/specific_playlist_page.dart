import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_1/bloc/tile/bloc.dart';
import 'package:flutter_1/bloc/tile/event.dart';
import 'package:flutter_1/utils/globalVars.dart';
import 'package:flutter_1/widget/footer.dart';
import 'package:flutter_1/widget/music/playlist_description.dart';
import 'package:flutter_1/widget/music/playlist_genre.dart';
import 'package:flutter_1/widget/music/playlist_title.dart';
import 'package:flutter_1/widget/music/song_list.dart';

/// this page is used to display details about a specific playlist that was selected in Playlists page,
/// and has a button which adds the specific playlist chosen to the Home screen
class SpecificPlaylistPage extends StatefulWidget {
  final int index;
  final String id;
  final List<String> songs;
  final String name;
  final String imageName;
  final String description;
  final String category;
  final TilesBloc tileBloc;

  SpecificPlaylistPage(
      {Key? key,
      required this.index,
      required this.id,
      required this.songs,
      required this.name,
      required this.imageName,
      required this.description,
      required this.category,
      required this.tileBloc})
      : super(key: key);

  @override
  _SpecificPlaylistPageState createState() => _SpecificPlaylistPageState();
}

class _SpecificPlaylistPageState extends State<SpecificPlaylistPage>
    with TickerProviderStateMixin {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    final controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3200));
    final animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(controller);
    controller.forward();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: BackButton(),
        title: Text(getText('playlist').toString()),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(children: <Widget>[
        PlaylistTitle(title: widget.name),
        PlaylistGenre(genre: widget.category),
        Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            margin: EdgeInsets.fromLTRB(0, 20, 0, 15),
            child: Divider(color: Colors.blueGrey)),
        Container(
            margin: EdgeInsets.fromLTRB(80, 0, 80, 0),
            child: ElevatedButton(
              onPressed: () {
                widget.tileBloc.tileEventSink.add(TileAddEvent(id: widget.id));
                // specificPlaylistInfo instance is updated in Playlists screen, right before this page is loaded,
                // Through that instance we can track which Tile is needed to be added to the Home screen through globalTiles
              },
              child: Text(getText('addHome').toString()),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      (Theme.of(context).cardColor)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)))),
            )),
        Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: Divider(color: Colors.blueGrey)),
        Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        getText('aboutPack').toString(),
                      ))),
              PlaylistDescription(description: widget.description),
              FadeTransition(
                  opacity: animation,
                  child: SongList(songs: widget.songs, width: width)),
            ]))
      ]),
      bottomNavigationBar: new Footer(page: "playlists"),
    );
  }
}
