import 'dart:convert';

/// a Playlist model responsible for holding API returns
List<Playlist> playlistFromJson(String str) =>
    List<Playlist>.from(json.decode(str).map((x) => Playlist.fromJson(x)));

String playlistToJson(List<Playlist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Playlist {
  Playlist(
      {required this.index,
      required this.description,
      required this.category,
      required this.image,
      required this.metaTitle,
      required this.metaArtist,
      required this.metaAlbum,
      required this.id,
      required this.songs});

  int index;
  String description;
  String category;
  String image;
  String metaTitle;
  String metaArtist;
  String metaAlbum;
  String id;
  List<String> songs;

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
      index: json["index"],
      description: json["description"],
      category: json["category"],
      image: "assets/images/" + json["image"],
      metaTitle: json["meta"]["title"],
      metaArtist: json["meta"]["artist"],
      metaAlbum: json["meta"]["album"],
      id: json["_id"],
      songs: List<String>.from(
          json["songs"].map((x) => "assets/sounds/" + x.toString())));

  Map<String, dynamic> toJson() => {
        "index": index,
        "description": description,
        "category": category,
        "image": image,
        "meta": {"title": metaTitle, "artist": metaArtist, "album": metaAlbum},
        "_id": id,
        "songs": jsonEncode(songs)
      };
}
