import 'dart:convert';
import 'dart:io';

import 'package:flutter_1/api/common/services.dart';
import 'package:flutter_1/model/stats_chart_data.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../exceptions.dart';

abstract class StatRepo {
  Future<List<StatsChartData>> getStats();

  void addStat(String day, String category, int playtime);
}

class StatServices implements StatRepo {
  static const String _GET_STATS = '/user/stats';
  static const String _PUT_STATS = '/user/stats';

  @override
  Future<List<StatsChartData>> getStats() async {
    Uri uri = Uri.parse(ApiUrl.url + _GET_STATS);
    Response response;

    try {
      response = await http.get(uri);
    } on SocketException catch (e) {
      if (e.osError!.message == "Network is unreachable")
        throw NetworkException();
      else if (e.osError!.message == "Connection refused")
        throw ApiException();
      else
        throw e;
    }

    if (response.statusCode != 200) throw DataException();

    List<StatsChartData> stats;
    try {
      final Map<String, dynamic> json = jsonDecode(response.body);

      stats = statsFromJson(jsonEncode(json["stats"]));
    } on Exception {
      throw DataException();
    }
    return stats;
  }

  @override
  void addStat(String day, String category, int playtime) async {
    Uri uri = Uri.parse(ApiUrl.url + _PUT_STATS);

    Response response;

    try {
      response = await http.put(uri, headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }, body: {
        'day': day,
        'category': category,
        'playtime': playtime.toString()
      });
    } on SocketException catch (e) {
      if (e.osError!.message == "Network is unreachable")
        throw NetworkException();
      else if (e.osError!.message == "Connection refused")
        throw ApiException();
      else
        throw e;
    }

    if (response.statusCode != 200) throw DataException();

    return;
  }
}
