import 'dart:convert';
import 'dart:io';

import 'package:flutter_1/api/common/services.dart';
import 'package:flutter_1/api/exceptions.dart';
import 'package:flutter_1/model/playlist.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

/// covers API call to the backend, for user tiles and music
abstract class TileRepo {
  Future<List<Playlist>> getTileList();

  Future<void> addTile(String id);

  Future<void> removeTile(String id);
}

class TileServices implements TileRepo {
  static const String _GET_TILES = '/user/tiles';
  static const String _POST_TILES = '/user/tiles';
  static const String _DELETE_TILES = '/user/tiles';

  @override
  Future<List<Playlist>> getTileList() async {
    Uri uri = Uri.parse(ApiUrl.url + _GET_TILES);
    Response response;

    try {
      response = await http.get(uri);
    } on SocketException catch (e) {
      if (e.osError!.message == "Network is unreachable")
        throw NetworkException();
      else if (e.osError!.message == "Connection refused")
        throw ApiException();
      else
        throw e;
    }

    if (response.statusCode != 200) throw DataException();

    List<Playlist> playlists;

    try {
      final Map<String, dynamic> json = jsonDecode(response.body);

      playlists = playlistFromJson(jsonEncode(json["active_tiles"]));
    } on Exception {
      throw DataException();
    }

    return playlists;
  }

  @override
  Future<bool> addTile(String id) async {
    Uri uri = Uri.parse(ApiUrl.url + _POST_TILES + "/" + id);

    Response response;
    try {
      response = await http.post(uri);
    } on SocketException catch (e) {
      if (e.osError!.message == "Network is unreachable")
        throw NetworkException();
      else if (e.osError!.message == "Connection refused")
        throw ApiException();
      else
        throw e;
    }

    if (response.statusCode != 200) throw DataException();

    return true;
  }

  @override
  Future<bool> removeTile(String id) async {
    Uri uri = Uri.parse(ApiUrl.url + _DELETE_TILES + "/" + id);

    Response response;
    try {
      response = await http.delete(uri);
    } on SocketException catch (e) {
      if (e.osError!.message == "Network is unreachable")
        throw NetworkException();
      else if (e.osError!.message == "Connection refused")
        throw ApiException();
      else
        throw e;
    }

    if (response.statusCode != 200) throw DataException();

    return true; //CHANGED
  }
}
