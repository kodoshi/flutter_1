import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// class which holds a list of Song strings fulfilled by the api calls
class SongList extends StatefulWidget {
  final double width;
  final List<String> songs;

  SongList({
    Key? key,
    required this.width,
    required this.songs,
  }) : super(key: key);

  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  Widget _getSongs(List<String> songs) {
    int counter = 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: songs.map((item) {
        counter++;
        var pos = item.lastIndexOf('/');
        var result = (pos != -1) ? item.substring(pos + 1) : item;
        return Text("0" + counter.toString() + "     " + result,
            style: TextStyle(color: Colors.white));
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: widget.width,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 0, 10),
                  child: Text("Music", style: TextStyle(color: Colors.white))),
              Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 0, 10),
                  child: _getSongs(widget.songs))
            ],
          ),
        ),
      ),
    );
  }
}
