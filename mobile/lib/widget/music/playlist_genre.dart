import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlaylistGenre extends StatefulWidget {
  final String genre;

  PlaylistGenre({
    Key? key,
    required this.genre,
  }) : super(key: key);

  @override
  _PlaylistGenreState createState() => _PlaylistGenreState();
}

class _PlaylistGenreState extends State<PlaylistGenre> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 20,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Align(
            alignment: Alignment.center,
            child: Text(widget.genre,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 14))));
  }
}
