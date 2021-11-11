import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_1/model/song.dart';

List<Playlist> playlistFromJson(String str) =>
    List<Playlist>.from(json.decode(str).map((x) => Playlist.fromJson(x)));

String playlistToJson(List<Playlist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Playlist {
  Playlist(
      {required this.id,
      required this.description,
      required this.image,
      required this.songs});

  int id;
  String description;
  ByteData image;
  List<Song> songs;

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
    id: json["id"],
    description: json["description"],
    image: json["image"],
    songs: songFromJson(json["songs"])
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "image": image,
    "songs": songToJson(songs)
  };
}
