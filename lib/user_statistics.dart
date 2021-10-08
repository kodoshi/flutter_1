import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/utils/stats_chart_data.dart';
import 'package:flutter_1/widget/profile/profile_picture.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

///Chart sample data
class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num? secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num? thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color? pointColor;

  /// Holds size of the datapoint
  final num? size;

  /// Holds datalabel/text value mapper of the datapoint
  final String? text;

  /// Holds open value of the datapoint
  final num? open;

  /// Holds close value of the datapoint
  final num? close;

  /// Holds low value of the datapoint
  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;
}

class UserStatisticsPage extends StatefulWidget {
  @override
  _UserStatisticsPageState createState() => _UserStatisticsPageState();
}

class _UserStatisticsPageState extends State<UserStatisticsPage> {

  final List<StatsChartData> chartData = <StatsChartData>[
    StatsChartData(
      "Monday",
      7839,
      45,
      20,
      15,
      20,
    ),
    StatsChartData(
      "Tuesday",
      9000,
      35,
      15,
      20,
      30,
    ),
    StatsChartData(
      "Wednesday",
      4500,
      15,
      25,
      20,
      40,
    ),
    StatsChartData(
      "Thursday",
      6452,
      05,
      45,
      15,
      35,
    ),
    StatsChartData(
      "Friday",
      4201,
      35,
      25,
      10,
      30,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Vaporware Profile'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          enableSideBySideSeriesPlacement: false,
          title: ChartTitle(
            textStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
              text: 'Listening time stats'),
          primaryXAxis: CategoryAxis(
            majorGridLines: const MajorGridLines(width: 0),
          ),
          primaryYAxis: NumericAxis(
              majorTickLines: const MajorTickLines(size: 0),
              majorGridLines: const MajorGridLines(width: 0)),
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
              xValueMapper: (StatsChartData time, _) => time.dayName as String,
              yValueMapper: (StatsChartData time, _) => time.lofi,
              color: Color.fromRGBO(10, 61, 98, 1),
              name: "lofi",
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(20, 25, 39, 1),
    );
  }
}
