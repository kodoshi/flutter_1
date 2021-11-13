import 'dart:convert';
import 'package:flutter_1/api/common/services.dart';
import 'package:flutter_1/model/playlist.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class TileRepo {
  Future<List<Playlist>> getTileList();
  Future<int> addTile(String id);
  Future<int> removeTile(String id);
}

class TileServices implements TileRepo {
  static const String _GET_TILES = '/user/tiles';
  static const String _POST_TILES = '/user/tiles';
  static const String _DELETE_TILES = '/user/tiles';

  @override
  Future<List<Playlist>> getTileList() async {
    Uri uri = Uri.parse(ApiUrl.url + _GET_TILES);
    Response response = await http.get(uri);

    final Map<String, dynamic> json = jsonDecode(response.body);

    List<Playlist> playlists = playlistFromJson(jsonEncode(json["active_tiles"]));

    return playlists;
  }

  @override
  Future<int> addTile(String id) async {
    Uri uri = Uri.parse(ApiUrl.url + _POST_TILES + "/" + id);

    Response response = await http.post(uri);

    return response.statusCode;
  }

  @override
  Future<int> removeTile(String id) async {
    Uri uri = Uri.parse(ApiUrl.url + _DELETE_TILES + "/" + id);

    Response response = await http.delete(uri);

    return response.statusCode;
  }
}
