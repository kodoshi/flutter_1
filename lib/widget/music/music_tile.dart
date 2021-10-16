import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MusicTile extends StatefulWidget {
  final String trackName;
  final String imageName;
  final String metaTitle;
  final String metaArtist;
  final String metaAlbum;

  MusicTile({
    Key? key,
    required this.trackName,
    required this.imageName,
    required this.metaTitle,
    required this.metaArtist,
    required this.metaAlbum,
  }) : super(key: key);

  @override
  _MusicTileState createState() => _MusicTileState();
}

class _MusicTileState extends State<MusicTile> {
  bool isPlaying = false;
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    audioPlayer.open(
        Audio(widget.trackName,
            metas: Metas(
              title: widget.metaTitle,
              artist: widget.metaArtist,
              album: widget.metaAlbum,
              image: MetasImage.asset(
                  widget.imageName), //can be MetasImage.network
            )),
        autoStart: false,
        showNotification: true);
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
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black, width: 0)),
          ),
          Positioned(
            top: 8,
            right: 0,
            child: ElevatedButton(
              child: PlayerBuilder.isPlaying(
                player: audioPlayer,
                builder: (context, isPlaying) {
                  return Icon(isPlaying ? Icons.pause : Icons.play_arrow);
                },
              ),
              onPressed: () => {
                playTrack(),
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black54,
                shape: CircleBorder(),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 0,
            child: ElevatedButton(
              child: Icon(Icons.delete_forever_outlined),
              onPressed: () => {dispose()},
              style: ElevatedButton.styleFrom(
                primary: Colors.black54,
                shape: CircleBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void playTrack() {
    setState(() {});
    setState(() {
      isPlaying = !isPlaying;
      if (isPlaying) {
        audioPlayer.play();
      } else {
        audioPlayer.pause();
      }
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}