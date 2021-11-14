import 'package:flutter/widgets.dart';
import 'package:flutter_1/utils/profile_chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

///unused custom circular graph which wraps around the profile picture of the user
class ProfilePictureWidget extends StatelessWidget {
  ProfilePictureWidget() : super();

  final List<ProfileChartData> chartData = [
    ProfileChartData('Lofi', 25, Color.fromRGBO(10, 61, 98, 1)),
    ProfileChartData('Hiphop', 38, Color.fromRGBO(30, 55, 153, 1)),
    ProfileChartData('Pop', 34, Color.fromRGBO(183, 21, 64, 1)),
    ProfileChartData('Nature', 52, Color.fromRGBO(96, 163, 188, 1))
  ];

  @override
  Widget build(BuildContext context) {
    return (Container(
        alignment: Alignment.topCenter,
        child: Container(
            height: 300,
            width: 300,
            child: SfCircularChart(
              annotations: <CircularChartAnnotation>[
                CircularChartAnnotation(
                  angle: 0,
                  radius: '0%',
                  height: '100%',
                  width: '100%',
                  widget: Container(
                      width: 190.0,
                      height: 190.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill, image: AssetImage('assets/images/street-japan-night.jpg')))),
                ),
              ],
              series: <CircularSeries>[
                DoughnutSeries<ProfileChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ProfileChartData data, _) => data.x,
                  yValueMapper: (ProfileChartData data, _) => data.y,
                  pointColorMapper: (ProfileChartData data, _) => data.color,
                  radius: '75%',
                  innerRadius: '80%',
                ),
              ],
              legend: Legend(
                isVisible: true,
                overflowMode: LegendItemOverflowMode.wrap,
                position: LegendPosition.bottom,
                textStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                toggleSeriesVisibility: false,
              ),
            ))));
  }
}
