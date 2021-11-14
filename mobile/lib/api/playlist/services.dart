import 'dart:io';

import 'package:flutter_1/api/common/services.dart';
import 'package:flutter_1/model/playlist.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../exceptions.dart';

abstract class PlaylistRepo {
  Future<List<Playlist>> getPlaylists();
}

class PlaylistServices implements PlaylistRepo {
  static const String _GET_PLAYLISTS = '/playlists';

  @override
  Future<List<Playlist>> getPlaylists() async {
    Uri uri = Uri.parse(ApiUrl.url + _GET_PLAYLISTS);
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
      playlists = playlistFromJson(response.body);
    } on Exception {
      throw DataException();
    }

    return playlists;
  }
}
