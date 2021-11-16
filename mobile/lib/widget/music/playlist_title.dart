import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// class which holds Title strings fulfilled by the api calls
class PlaylistTitle extends StatefulWidget {
  final String title;

  PlaylistTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _PlaylistTitleState createState() => _PlaylistTitleState();
}

class _PlaylistTitleState extends State<PlaylistTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        padding: EdgeInsets.fromLTRB(15, 25, 0, 0),
        child: Align(
            alignment: Alignment.center,
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            )));
  }
}
