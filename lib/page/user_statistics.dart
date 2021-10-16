import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/widget/stats/cartesian_chart.dart';

class UserStatisticsPage extends StatefulWidget {
  @override
  _UserStatisticsPageState createState() => _UserStatisticsPageState();
}

class _UserStatisticsPageState extends State<UserStatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          title: Text('VaporWare Profile'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: SafeArea(
          child: CartesianChartWidget(),
        ),
        backgroundColor: Color.fromRGBO(20, 25, 39, 1),
      ),
    );
  }
}
