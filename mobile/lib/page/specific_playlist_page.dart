import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_1/bloc/tile/bloc.dart';
import 'package:flutter_1/bloc/tile/event.dart';
import 'package:flutter_1/utils/globalVars.dart';
import 'package:flutter_1/widget/footer.dart';

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

  SpecificPlaylistPage({
    Key? key,
    required this.index,
    required this.id,
    required this.songs,
    required this.name,
    required this.imageName,
    required this.description,
    required this.category,
    required this.tileBloc
  }) : super(key: key);

  @override
  _SpecificPlaylistPageState createState() => _SpecificPlaylistPageState();
}

class _SpecificPlaylistPageState extends State<SpecificPlaylistPage> {
  var size, height, width;

  Widget _getSongs(List<String> songs) {
    int counter = 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: songs.map((item) {
      counter++;
      var pos = item.lastIndexOf('/');
      var result = (pos != -1) ? item.substring(pos + 1) : item;
      return Text(
          "0" + counter.toString() + "     " + result,
          style: TextStyle(color: Colors.white));
    }
    ).toList(),);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;
    height = size.height;
    width = size.width;

    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .backgroundColor,
      appBar: AppBar(
        leading: BackButton(),
        title: Text(getText('playlist').toString()),
        centerTitle: true,
        backgroundColor: Theme
            .of(context)
            .primaryColor,
      ),
      body: ListView(
        children: <Widget>[
          Container(
              height: 60,
              padding: EdgeInsets.fromLTRB(15, 25, 0, 0),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.imageName,
                    style: TextStyle(fontSize: 28),
                    textAlign: TextAlign.center,
                  ))),
          Container(
              height: 20,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(widget.category,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14)))),
          Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              margin: EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: Divider(color: Colors.blueGrey)),
          Container(
              margin: EdgeInsets.fromLTRB(80, 0, 80, 0),
              child: ElevatedButton(
                  onPressed: () {
                    widget.tileBloc.tileEventSink.add(TileAddEvent(id: widget.id));
                    /*
                    globalTiles.add(
                        specificTiles[int.parse(specificPlaylistInfo['id']!)]); */
                    // specificPlaylistInfo instance is updated in Playlists screen, right before this page is loaded,
                    // Through that instance we can track which Tile is needed to be added to the Home screen through globalTiles
                  },
                  child: Text(getText('addHome').toString()),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          (Theme
                              .of(context)
                              .cardColor)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)))))),
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
                        child: Text(getText('aboutPack').toString(),
                          //style: TextStyle(color: Colors.white),
                        ))),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(widget.description,
                          // style:
                          //     TextStyle(color: Colors.white, height: 1.5),
                        ))),
                Container(
                  height: 200.0,
                  width: width,
                  color: Colors.transparent,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .cardColor,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0))),
                      child: SizedBox(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              Container(
                                  margin: EdgeInsets.fromLTRB(10, 15, 0, 10),
                                  child: Text("Music",
                                      style: TextStyle(color: Colors.white))),
                              Container(
                                  margin: EdgeInsets.fromLTRB(10, 15, 0, 10),
                                  child: _getSongs(widget.songs))
                            ],
                          ))),
                ),
              ]))
        ],
      ),
      bottomNavigationBar: new Footer(page: "playlists"),
    );
  }
}