import 'dart:async';

import 'package:flutter_1/api/tile/services.dart';
import 'package:flutter_1/bloc/tile/event.dart';
import 'package:flutter_1/bloc/tile/state.dart';
import 'package:flutter_1/model/playlist.dart';


class TilesBloc {
  final TilesRepo repository;

  final _tileStateController = StreamController<TileState>();
  StreamSink<TileState> get _inTiles => _tileStateController.sink;

  Stream<TileState> get tiles => _tileStateController.stream;

  final _tileEventController = StreamController<TileEvent>();

  Sink<TileEvent> get tileEventSink => _tileEventController.sink;

  TilesBloc({required this.repository}) {
    _tileEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(TileEvent event) async {
    _inTiles.add(TileLoadingState());

    if (event is TileGetEvent) {
      _inTiles.add(await _get(event));
    } else if (event is TileAddEvent) {
      _inTiles.add(await _add(event));
    } else if (event is TileDeleteEvent) {
      _inTiles.add(await _delete(event));
    }
  }

  Future<TileState> _get(TileGetEvent event) async {
    try {
      final List<Playlist> list = await repository.getTileList();

      return TileLoadedState(tiles: list);
    } on Exception catch (e) {
      return TileErrorState(
        event: event,
        message: e.toString()
      );
    }
  }

  Future<TileState> _add(TileAddEvent event) async {
    try {
      int code = await repository.addTile(event.id);

      if (code != 200) {
        throw Exception("Received " + code.toString() + " status code");
      }

      tileEventSink.add(TileGetEvent());
      return TileAddedState();
    } on Exception catch (e) {
      return TileErrorState(
          event: event,
          message: e.toString()
      );
    }
  }

  Future<TileState> _delete(TileDeleteEvent event) async {
    try {
      int code = await repository.removeTile(event.id);

      if (code != 200) {
        throw Exception("Received " + code.toString() + " status code");
      }

      tileEventSink.add(TileGetEvent());
      return TileDeletedState();
    } on Exception catch (e) {
      return TileErrorState(
          event: event,
          message: e.toString()
      );
    }
  }

  void dispose() {
    _tileStateController.close();
    _tileEventController.close();
  }
}
