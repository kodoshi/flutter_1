import 'package:flutter_1/api/common/services.dart';
import 'package:flutter_1/model/playlist.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class PlaylistRepo {
  Future<List<Playlist>> getPlaylists();
}

class PlaylistServices implements PlaylistRepo {
  static const String _GET_PLAYLISTS = '/playlists';

  @override
  Future<List<Playlist>> getPlaylists() async {
    Uri uri = Uri.parse(ApiUrl.url + _GET_PLAYLISTS);
    Response response = await http.get(uri);

    List<Playlist> playlists = playlistFromJson(response.body);

    return playlists;
  }
}