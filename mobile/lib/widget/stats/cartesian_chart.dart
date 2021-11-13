import 'package:flutter/material.dart';
import 'package:flutter_1/api/stat/services.dart';
import 'package:flutter_1/bloc/stat/bloc.dart';
import 'package:flutter_1/bloc/stat/event.dart';
import 'package:flutter_1/bloc/stat/state.dart';
import 'package:flutter_1/model/stats_chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_1/utils/globalVars.dart';

/// class used by the UserStatistics page, holds the graph data and does the graph rendering
class CartesianChartWidget extends StatefulWidget {
  @override
  _CartesianChartWidgetState createState() => _CartesianChartWidgetState();
}

class _CartesianChartWidgetState extends State<CartesianChartWidget> {
  final _statBloc = StatsBloc(repository: StatServices());

  @override
  void initState() {
    super.initState();

    _statBloc.statEventSink.add(StatGetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _statBloc.stats,
      initialData: StatInitState(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data is StatLoadedState) {
          StatLoadedState data = snapshot.data as StatLoadedState;

          return SfCartesianChart(
            plotAreaBorderWidth: 0,
            enableSideBySideSeriesPlacement: false,
            title: ChartTitle(
                text: getText('listeningTime').toString()),
            primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0),
            ),
            primaryYAxis: NumericAxis(
              interval: 1,
              majorTickLines: const MajorTickLines(size: 0),
              majorGridLines: const MajorGridLines(width: 0),
            ),
            legend: Legend(
              isVisible: true,
              overflowMode: LegendItemOverflowMode.wrap,
              position: LegendPosition.bottom,
              toggleSeriesVisibility: false,
            ),
            series: <ColumnSeries<StatsChartData, String>>[
              ColumnSeries<StatsChartData, String>(
                dataSource: data.stats,
                xValueMapper: (StatsChartData time, _) => time.day.substring(0, 3),
                yValueMapper: (StatsChartData time, _) => time.pop,
                color: Color.fromRGBO(10, 61, 98, 1),
                name: getText("pop").toString(),
                animationDuration: 3000,
              ),
              ColumnSeries<StatsChartData, String>(
                dataSource: data.stats,
                xValueMapper: (StatsChartData time, _) => time.day.substring(0, 3),
                yValueMapper: (StatsChartData time, _) => time.instrumental,
                color: Color.fromRGBO(30, 55, 153, 1),
                name: getText("instrumental").toString(),
                animationDuration: 3000,
              ),
              ColumnSeries<StatsChartData, String>(
                dataSource: data.stats,
                xValueMapper: (StatsChartData time, _) => time.day.substring(0, 3),
                yValueMapper: (StatsChartData time, _) => time.nature,
                color: Color.fromRGBO(96, 163, 188, 1),
                name: getText("nature").toString(),
                animationDuration: 3000,
              ),
            ],
          );
        } else if (snapshot.data is StatErrorState) {
          StatErrorState error = snapshot.data as StatErrorState;
          return AlertDialog(
            title: Text("API Error"),
            content: Text(error.message),
            actions: [
              TextButton(
                  onPressed: () {
                    _statBloc.statEventSink.add(error.event);
                  },
                  child: Text("Refresh"))
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _statBloc.dispose();
  }
}
