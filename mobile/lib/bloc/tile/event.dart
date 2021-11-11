import 'package:flutter_1/bloc/common/event.dart';

abstract class TileEvent extends Event {
  const TileEvent();
}

class TileGetEvent extends TileEvent {
  const TileGetEvent();
}

class TileAddEvent extends TileEvent {
  final String id;

  const TileAddEvent({required this.id});
}

class TileDeleteEvent extends TileEvent {
  final String id;

  const TileDeleteEvent({required this.id});
}