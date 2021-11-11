import 'package:flutter_1/api/tile/services.dart';
import 'package:flutter_1/bloc/tile/event.dart';
import 'package:flutter_1/bloc/tile/state.dart';
import 'package:flutter_1/model/playlist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TilesBloc extends Bloc<TileEvent, TileState> {
  final TilesRepo repository;

  TilesBloc({required this.repository}) : super(TileInitState());

  @override
  Stream<TileState> mapEventToState(TileEvent event) async* {
    yield TileLoadingState();

    if (event is TileGetEvent) {
      yield* _get(event);
    } else if (event is TileAddEvent) {
      yield* _add(event);
    } else if (event is TileDeleteEvent) {
      yield* _delete(event);
    }
  }

  Stream<TileState> _get(TileGetEvent event) async* {
    try {
      final List<Playlist> list = await repository.getTileList();

      yield TileLoadedState(tiles: list);
    } on Exception catch (e) {
      yield TileErrorState(
        event: event,
        message: e.toString()
      );
    }
  }

  Stream<TileState> _add(TileAddEvent event) async* {
    try {
      final List<Playlist> list = await repository.addTile(event.id);

      yield TileLoadedState(tiles: list);
    } on Exception catch (e) {
      yield TileErrorState(
          event: event,
          message: e.toString()
      );
    }
  }

  Stream<TileState> _delete(TileDeleteEvent event) async* {
    try {
      final List<Playlist> list = await repository.removeTile(event.id);

      yield TileLoadedState(tiles: list);
    } on Exception catch (e) {
      yield TileErrorState(
          event: event,
          message: e.toString()
      );
    }
  }
}
