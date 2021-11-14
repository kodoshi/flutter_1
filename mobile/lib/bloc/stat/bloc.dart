import 'dart:async';

import 'package:flutter_1/api/exceptions.dart';
import 'package:flutter_1/api/stat/services.dart';
import 'package:flutter_1/bloc/stat/state.dart';
import 'package:flutter_1/model/stats_chart_data.dart';

import 'event.dart';

class StatsBloc {
  StatRepo repository;

  final _statStateController = StreamController<StatState>();

  StreamSink<StatState> get _inStats => _statStateController.sink;

  Stream<StatState> get stats => _statStateController.stream;

  final _statEventController = StreamController<StatEvent>();

  Sink<StatEvent> get statEventSink => _statEventController.sink;

  StatsBloc({required this.repository}) {
    _statEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(StatEvent event) async {
    _inStats.add(StatLoadingState());

    if (event is StatGetEvent) {
      _inStats.add(await _get(event));
    } else if (event is StatAddEvent) {
      _inStats.add(await _add(event));
    }
  }

  Future<StatState> _get(StatGetEvent event) async {
    try {
      final List<StatsChartData> stats = await repository.getStats();

      return StatLoadedState(stats: stats);
    } on CustomException catch (e) {
      return StatErrorState(event: event, title: e.title, message: e.message);
    } on Exception {
      var e = UnknownError();
      return StatErrorState(event: event, title: e.title, message: e.message);
    }
  }

  Future<StatState> _add(StatAddEvent event) async {
    try {
      await repository.addStat(event.day, event.category, event.playtime);

      statEventSink.add(StatGetEvent());
      return StatAddedState();
    } on CustomException catch (e) {
      return StatErrorState(event: event, title: e.title, message: e.message);
    } on Exception {
      var e = UnknownError();
      return StatErrorState(event: event, title: e.title, message: e.message);
    }
  }

  void dispose() {
    _statStateController.close();
    _statEventController.close();
  }
}
