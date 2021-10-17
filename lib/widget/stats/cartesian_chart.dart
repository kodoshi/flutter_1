import 'package:flutter_1/utils/stats_chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_1/utils/globalVars.dart';

/// class used by the UserStatistics page, holds the graph data and does the graph rendering
class CartesianChartWidget extends StatefulWidget {
  @override
  _CartesianChartWidgetState createState() => _CartesianChartWidgetState();
}

class _CartesianChartWidgetState extends State<CartesianChartWidget> {
  List<StatsChartData> chartData = <StatsChartData>[];

  _CartesianChartWidgetState() {
    _loadChartData();
  }

  void _loadChartData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      chartData = <StatsChartData>[
        StatsChartData(
          getText('monday').toString(),
          prefs.getInt('monday_play_time') ?? 7839,
          45,
          20,
          15,
          20,
        ),
        StatsChartData(
          getText('tuesday').toString(),
          prefs.getInt('tuesday_play_time') ?? 9000,
          35,
          15,
          20,
          30,
        ),
        StatsChartData(
          getText('wednesday').toString(),
          prefs.getInt('wednesday_play_time') ?? 4500,
          15,
          25,
          20,
          40,
        ),
        StatsChartData(
          getText('thursday').toString(),
          prefs.getInt('thursday_play_time') ?? 6452,
          05,
          45,
          15,
          35,
        ),
        StatsChartData(
          getText('friday').toString(),
          prefs.getInt('friday_play_time') ?? 4201,
          35,
          25,
          10,
          30,
        )
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return (SfCartesianChart(
      plotAreaBorderWidth: 0,
      enableSideBySideSeriesPlacement: false,
      title: ChartTitle(
          //textStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
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
        //textStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
        toggleSeriesVisibility: false,
      ),
      series: <ColumnSeries<StatsChartData, String>>[
        ColumnSeries<StatsChartData, String>(
          dataSource: this.chartData,
          xValueMapper: (StatsChartData time, _) => time.dayName,
          yValueMapper: (StatsChartData time, _) => time.pop,
          color: Color.fromRGBO(96, 163, 188, 1),
          name: "pop",
        ),
        ColumnSeries<StatsChartData, String>(
          dataSource: this.chartData,
          xValueMapper: (StatsChartData time, _) => time.dayName,
          yValueMapper: (StatsChartData time, _) => time.nature,
          color: Color.fromRGBO(183, 21, 64, 1),
          name: "nature",
        ),
        ColumnSeries<StatsChartData, String>(
          dataSource: this.chartData,
          xValueMapper: (StatsChartData time, _) => time.dayName,
          yValueMapper: (StatsChartData time, _) => time.hiphop,
          color: Color.fromRGBO(30, 55, 153, 1),
          name: "hiphop",
        ),
        ColumnSeries<StatsChartData, String>(
          dataSource: this.chartData,
          xValueMapper: (StatsChartData time, _) =>
          time.dayName as String,
          yValueMapper: (StatsChartData time, _) => time.lofi,
          color: Color.fromRGBO(10, 61, 98, 1),
          name: "lofi",
        ),
      ],
    ));
  }
}