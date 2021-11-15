import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlaylistDescription extends StatefulWidget {
  final String description;

  PlaylistDescription({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  _PlaylistDescriptionState createState() => _PlaylistDescriptionState();
}

class _PlaylistDescriptionState extends State<PlaylistDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.description,
            )));
  }
}
