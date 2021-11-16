import 'package:flutter_1/bloc/common/state.dart';
import 'package:flutter_1/model/stats_chart_data.dart';

import 'event.dart';

/// custom Stat state, plus errors
abstract class StatState {
  const StatState();
}

class StatInitState extends StatState {
  const StatInitState();
}

class StatLoadingState extends StatState {
  const StatLoadingState();
}

class StatLoadedState extends StatState {
  final List<StatsChartData> stats;

  StatLoadedState({required this.stats});
}

class StatAddedState extends StatState {
  const StatAddedState();
}

class StatErrorState extends StatState implements ErrorState {
  final StatEvent event;
  final String title;
  final String message;

  const StatErrorState({required this.event, required this.title, required this.message});
}
