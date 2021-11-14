import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// class which allows to build easy placeholders
class MinimalMusicTile extends StatefulWidget {
  final String imageName;
  final String metaTitle;

  MinimalMusicTile({
    Key? key,
    required this.imageName,
    required this.metaTitle,
  }) : super(key: key);

  @override
  _MinimalMusicTileState createState() => _MinimalMusicTileState();
}

class _MinimalMusicTileState extends State<MinimalMusicTile> {
  bool isPlaying = false;
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Card(
            child: Image.asset(
              widget.imageName,
              fit: BoxFit.cover,
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 2,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.black, width: 0)),
          ),
          Positioned(
            bottom: 14,
            left: 20,
            child: Text(widget.metaTitle, style: TextStyle(fontSize: 15, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
