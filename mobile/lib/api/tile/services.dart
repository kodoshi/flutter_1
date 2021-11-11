import 'dart:convert';
import 'package:flutter_1/api/common/services.dart';
import 'package:flutter_1/model/playlist.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class TilesRepo {
  Future<List<Playlist>> getTileList();
  Future<List<Playlist>> addTile(String id);
  Future<List<Playlist>> removeTile(String id);
}

class TileServices implements TilesRepo {
  static const String _GET_TILES = '/user/tiles';
  static const String _POST_TILES = '/user/tiles';
  static const String _DELETE_TILES = '/user/tiles';

  @override
  Future<List<Playlist>> getTileList() async {
    Uri uri = Uri.https(ApiUrl.url, _GET_TILES);
    Response response = await http.get(uri);

    final Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));

    List<Playlist> playlists = playlistFromJson(json["active_tiles"]);

    return playlists;
  }

  @override
  Future<List<Playlist>> addTile(String id) async {
    Uri uri = Uri.https(ApiUrl.url, _POST_TILES + "/" + id);

    await http.post(uri);

    return this.getTileList();
  }

  @override
  Future<List<Playlist>> removeTile(String id) async {
    Uri uri = Uri.https(ApiUrl.url, _DELETE_TILES + "/" + id);

    await http.delete(uri);

    return this.getTileList();
  }
}
