import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/bloc/tile/bloc.dart';
import 'package:flutter_1/model/playlist.dart';
import 'package:flutter_1/page/specific_playlist_page.dart';
import 'package:flutter_1/utils/globalVars.dart';

import 'minimal_music_tile.dart';

class PlaylistCategory extends StatefulWidget {
  final String name;
  final List<Playlist> data;
  final TilesBloc tileBloc;

  PlaylistCategory(
      {Key? key,
      required this.name,
      required this.data,
      required this.tileBloc});

  @override
  _PlaylistCategoryState createState() => _PlaylistCategoryState();
}

class _PlaylistCategoryState extends State<PlaylistCategory> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget> _getPlaylist(List<Playlist> data, String category) {
    return List<Widget>.from(data
        .where((item) => item.category.toLowerCase() == category.toLowerCase())
        .toList()
        .map((item) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 1700),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeScaleTransition(
                              animation: animation, child: child);
                        },
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return SpecificPlaylistPage(
                            id: item.id,
                            index: item.index,
                            songs: item.songs,
                            name: item.metaTitle,
                            imageName: item.image,
                            category: item.category,
                            description: item.description,
                            tileBloc: widget.tileBloc,
                          );
                        }));
              },
              child: MinimalMusicTile(
                imageName: item.image,
                metaTitle: item.metaTitle,
              ),
            ))
        .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 16,
                MediaQuery.of(context).size.height / 32, 0, 0),
            width: MediaQuery.of(context).size.width,
            height: 70,
            child: Text(getText(widget.name).toString(),
                style: TextStyle(fontSize: 30))),
        Container(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width / 16, 0, 0, 0),
            width: MediaQuery.of(context).size.width,
            height: 30,
            child: Text(getText(widget.name + 'Description').toString(),
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
                    children: _getPlaylist(widget.data, widget.name)))),
      ],);
  }
}
