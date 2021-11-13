import 'package:flutter_1/bloc/common/event.dart';

abstract class StatEvent extends Event {
  const StatEvent();
}

class StatGetEvent extends StatEvent {
  const StatGetEvent();
}

class StatAddEvent extends StatEvent {
  final String day;
  final String category;
  final int playtime;

  const StatAddEvent(
      {required this.day, required this.category, required this.playtime});
}
