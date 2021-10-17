import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/widget/stats/cartesian_chart.dart';
import 'package:flutter_1/widget/footer.dart';

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
            title: Text('Statistics'),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: SafeArea(
            child: CartesianChartWidget(),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          bottomNavigationBar: new Footer(page: "statistics")),
    );
  }
}
