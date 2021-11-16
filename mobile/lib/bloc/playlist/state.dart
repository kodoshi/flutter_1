import 'package:flutter_1/bloc/common/state.dart';
import 'package:flutter_1/model/playlist.dart';

import 'event.dart';

/// custom event management system
abstract class PlaylistState {
  const PlaylistState();
}

class PlaylistInitState extends PlaylistState {
  const PlaylistInitState();
}

class PlaylistLoadingState extends PlaylistState {
  const PlaylistLoadingState();
}

class PlaylistLoadedState extends PlaylistState {
  final List<Playlist> playlists;

  PlaylistLoadedState({required this.playlists});
}

class PlaylistErrorState extends PlaylistState implements ErrorState {
  final PlaylistEvent event;
  final String title;
  final String message;

  const PlaylistErrorState({required this.event, required this.title, required this.message});
}
