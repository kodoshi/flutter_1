import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/api/tile/services.dart';
import 'package:flutter_1/bloc/tile/bloc.dart';
import 'package:flutter_1/bloc/tile/event.dart';
import 'package:flutter_1/bloc/tile/state.dart';
import 'package:flutter_1/widget/footer.dart';
import 'package:flutter_1/utils/globalVars.dart';

/// this page will contain all the active playlists and audio players,
/// that are added by PlaylistsPage and SpecificPlaylistPage
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _tileBloc = TilesBloc(repository: TileServices());

  @override
  void initState() {
    super.initState();
    _tileBloc.tileEventSink.add(TileGetEvent());
  }

  void addTileToList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    emitter.on('updateTileList', this, (event, context) {
      addTileToList();
    });
    return Scaffold(
        appBar: AppBar(
          title: Text('VaporWare'),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SafeArea(
          child: StreamBuilder(
            stream: _tileBloc.tiles,
            initialData: TileInitState(),
            builder: (BuildContext context, AsyncSnapshot<TileState> snapshot) {
              print(snapshot.data.toString());
              if (snapshot.data is TileLoadedState) {
                TileLoadedState data = snapshot.data as TileLoadedState;

                return (data.tiles.length == 0)
                    ? Align(
                        alignment: Alignment.center,
                        child: Text(
                          getText('lonelyText').toString(),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ))
                    : GridView.builder(
                        padding: const EdgeInsets.all(25),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 250,
                                childAspectRatio: 1,
                                crossAxisSpacing: 25,
                                mainAxisSpacing: 25),
                        itemCount: data.tiles.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            alignment: Alignment.center,
                            child: specificTiles[index],
                          );
                        });
              } else if (snapshot.data is TileErrorState) {
                TileErrorState error = snapshot.data as TileErrorState;
                return AlertDialog(
                  title: Text("API Error"),
                  content: Text(error.message),
                  actions: [
                    TextButton(
                        onPressed: () {
                          _tileBloc.tileEventSink.add(error.event);
                        },
                        child: Text("Refresh"))
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        bottomNavigationBar: new Footer(page: "home"));
  }

  @override
  void dispose() {
    super.dispose();
    _tileBloc.dispose();
  }
}

/*
(globalTiles.length == 0)
              ? Align(
                  alignment: Alignment.center,
                  child: Text(
                    getText('lonelyText').toString(),
                    style: TextStyle(fontSize: 20,),
                    textAlign: TextAlign.center,
                  ))
              : GridView.builder(
                  padding: const EdgeInsets.all(25),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                      childAspectRatio: 1,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 25),
                  itemCount: globalTiles.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      child: globalTiles[index],
                    );
                  }),
 */
