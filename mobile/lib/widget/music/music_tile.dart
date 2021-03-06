import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/bloc/stat/bloc.dart';
import 'package:flutter_1/bloc/stat/event.dart';
import 'package:flutter_1/bloc/tile/bloc.dart';
import 'package:flutter_1/bloc/tile/event.dart';
import 'package:flutter_1/utils/globalVars.dart';

/// the workhorse of the app, this class holds a new instance of an active playlist,
/// the details of which are required when this widget gets initialized,
/// the instance is responsible for the visual look of the Tile,
/// for managing its audio player, and for disposing itself if needed
class MusicTile extends StatefulWidget {
  final int index;
  final String id;
  final String trackName;
  final String imageName;
  final String metaTitle;
  final String metaArtist;
  final String metaAlbum;
  final String category;
  final TilesBloc tileBloc;
  final StatsBloc statBloc;

  MusicTile(
      {Key? key,
      required this.index,
      required this.id,
      required this.trackName,
      required this.imageName,
      required this.metaTitle,
      required this.metaArtist,
      required this.metaAlbum,
      required this.category,
      required this.tileBloc,
      required this.statBloc})
      : super(key: key);

  @override
  _MusicTileState createState() => _MusicTileState();
}

class _MusicTileState extends State<MusicTile> {
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
              image: MetasImage.asset(widget.imageName), //can be MetasImage.network
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
                borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.black, width: 0)),
          ),
          Positioned(
            top: 8,
            right: 0,
            child: PlayerBuilder.isPlaying(
                player: audioPlayer,
                builder: (context, isPlaying) {
                  return ElevatedButton(
                    child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () => {
                      _playTrack(isPlaying),
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black54,
                      shape: CircleBorder(),
                    ),);}),
          ),
          Positioned(
              bottom: 8,
              right: 0,
              child: ElevatedButton(
                child: Icon(Icons.delete_forever_outlined),
                onPressed: () => {widget.tileBloc.tileEventSink.add(TileDeleteEvent(id: widget.id))},
                style: ElevatedButton.styleFrom(
                  primary: Colors.black54,
                  shape: CircleBorder(),
                ),
              )),
          Positioned(
            bottom: 14,
            left: 20,
            child: Text(widget.metaTitle, style: TextStyle(fontSize: 15, color: Colors.white)),
          ),],),);
  }

  void _playTrack(bool isPlaying) {
    if (!isPlaying) {
      audioPlayer.play();
    } else {
      final dayMap = {
        1: "Monday",
        2: "Tuesday",
        3: "Wednesday",
        4: "Thursday",
        5: "Friday",
        6: "Saturday",
        7: "Sunday"
      };
      widget.statBloc.statEventSink.add(StatAddEvent(
          day: dayMap[DateTime.now().weekday] ?? "Monday",
          category: widget.category.toLowerCase(),
          playtime: audioPlayer.currentPosition.value.inSeconds));
      audioPlayer.stop();
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
    emitter.emit("updateTileList", "musicTile", null);
  }
}
