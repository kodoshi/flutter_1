import 'dart:async';

import 'package:flutter_1/api/exceptions.dart';
import 'package:flutter_1/api/playlist/services.dart';
import 'package:flutter_1/bloc/playlist/state.dart';
import 'package:flutter_1/model/playlist.dart';

import 'event.dart';

/// contains BLoC logic for playlist objects
class PlaylistsBloc {
  PlaylistRepo repository;

  final _playlistStateController = StreamController<PlaylistState>();

  StreamSink<PlaylistState> get _inPlaylists => _playlistStateController.sink;

  Stream<PlaylistState> get playlists => _playlistStateController.stream;

  final _playlistEventController = StreamController<PlaylistEvent>();

  Sink<PlaylistEvent> get playlistEventSink => _playlistEventController.sink;

  PlaylistsBloc({required this.repository}) {
    _playlistEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(PlaylistEvent event) async {
    _inPlaylists.add(PlaylistInitState());

    if (event is PlaylistGetEvent) {
      _inPlaylists.add(await _get(event));
    }
  }

  Future<PlaylistState> _get(PlaylistGetEvent event) async {
    try {
      final List<Playlist> list = await repository.getPlaylists();

      return PlaylistLoadedState(playlists: list);
    } on CustomException catch (e) {
      return PlaylistErrorState(event: event, title: e.title, message: e.message);
    } on Exception {
      var e = UnknownError();
      return PlaylistErrorState(event: event, title: e.title, message: e.message);
    }
  }

  void dispose() {
    _playlistStateController.close();
    _playlistEventController.close();
  }
}
