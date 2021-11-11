import 'dart:convert';

List<Song> songFromJson(String str) =>
    List<Song>.from(json.decode(str).map((x) => Song.fromJson(x)));

String songToJson(List<Song> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Song {
  Song({required this.id, required this.content});

  int id;
  String content;

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        id: json["id"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
      };
}
