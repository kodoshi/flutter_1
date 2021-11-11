import 'package:flutter_1/bloc/common/state.dart';
import 'package:flutter_1/bloc/tile/event.dart';
import 'package:flutter_1/model/playlist.dart';

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

class TileErrorState extends TileState implements ErrorState {
  final TileEvent event;
  final String message;

  const TileErrorState({required this.event, required this.message});
}
