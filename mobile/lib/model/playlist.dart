import 'dart:convert';
import 'package:flutter_1/model/song.dart';

List<Playlist> playlistFromJson(String str) =>
    List<Playlist>.from(json.decode(str).map((x) => Playlist.fromJson(x)));

String playlistToJson(List<Playlist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Playlist {
  Playlist(
      {required this.index,
      required this.description,
      required this.category,
      required this.id,
      required this.songs});

  int index;
  String description;
  String category;
  String id;
  List<Song> songs;

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
      index: json["index"],
      description: json["description"],
      category: json["category"],
      id: json["_id"],
      songs: [] //songFromJson(jsonEncode(json["songs"]))
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "description": description,
        "category": category,
        "_id": id,
        "songs": songToJson(songs)
      };
}
