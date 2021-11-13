import 'dart:convert';

import 'package:flutter_1/api/common/services.dart';
import 'package:flutter_1/model/stats_chart_data.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class StatRepo {
  Future<List<StatsChartData>> getStats();

  Future<int> addStat(String day, String category, int playtime);
}

class StatServices implements StatRepo {
  static const String _GET_STATS = '/user/stats';
  static const String _PUT_STATS = '/user/stats';

  @override
  Future<List<StatsChartData>> getStats() async {
    Uri uri = Uri.parse(ApiUrl.url + _GET_STATS);
    Response response = await http.get(uri);

    final Map<String, dynamic> json = jsonDecode(response.body);

    List<StatsChartData> stats = statsFromJson(jsonEncode(json["stats"]));

    return stats;
  }

  @override
  Future<int> addStat(String day, String category, int playtime) async {
    Uri uri = Uri.parse(ApiUrl.url + _PUT_STATS);

    Response response = await http.put(uri, headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }, body: {
      'day': day,
      'category': category,
      'playtime': playtime.toString()
    });

    return response.statusCode;
  }
}
