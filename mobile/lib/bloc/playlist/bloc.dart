import 'package:flutter_1/api/playlist/services.dart';
import 'package:flutter_1/bloc/playlist/state.dart';
import 'package:flutter_1/model/playlist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';


class PlaylistsBloc extends Bloc<PlaylistEvent, PlaylistState> {
  final PlaylistsRepo repository;

  PlaylistsBloc({required this.repository}) : super(PlaylistInitState());

  @override
  Stream<PlaylistState> mapEventToState(PlaylistEvent event) async* {
    yield PlaylistLoadingState();

    if (event is PlaylistGetEvent) {
      yield* _get(event);
    }
  }

  Stream<PlaylistState> _get(PlaylistGetEvent event) async* {
    try {
      final List<Playlist> list = await repository.getPlaylists();

      yield PlaylistLoadedState(playlists: list);
    } on Exception catch (e) {
      yield PlaylistErrorState(
          event: event,
          message: e.toString()
      );
    }
  }
}
