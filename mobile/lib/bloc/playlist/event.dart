import 'package:flutter_1/bloc/common/event.dart';

abstract class PlaylistEvent extends Event {
  const PlaylistEvent();
}

class PlaylistGetEvent extends PlaylistEvent {
  const PlaylistGetEvent();
}