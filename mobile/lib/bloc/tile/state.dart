import 'package:flutter_1/bloc/common/state.dart';
import 'package:flutter_1/bloc/tile/event.dart';
import 'package:flutter_1/model/playlist.dart';

/// custom state system, including errors
abstract class TileState {
  const TileState();
}

class TileInitState extends TileState {
  const TileInitState();
}

class TileLoadingState extends TileState {
  const TileLoadingState();
}

class TileLoadedState extends TileState {
  final List<Playlist> tiles;

  TileLoadedState({required this.tiles});
}

class TileAddedState extends TileState {
  const TileAddedState();
}

class TileDeletedState extends TileState {
  const TileDeletedState();
}

class TileErrorState extends TileState implements ErrorState {
  final TileEvent event;
  final String title;
  final String message;

  const TileErrorState({required this.event, required this.title, required this.message});
}
