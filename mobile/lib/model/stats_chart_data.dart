import 'dart:convert';

/// a Stat Chart model responsible for holding API returns
List<StatsChartData> statsFromJson(String str) =>
    List<StatsChartData>.from(json.decode(str).map((x) => StatsChartData.fromJson(x)));

/// class used in UserStatistics page
class StatsChartData {
  StatsChartData({required String day, required num nature, required num instrumental, required num pop}) {
    this.day = day;
    this.nature = nature / 60;
    this.instrumental = instrumental / 60 + this.nature;
    this.pop = pop / 60 + this.instrumental;
  }

  late String day;
  late num nature;
  late num instrumental;
  late num pop;

  factory StatsChartData.fromJson(Map<String, dynamic> json) => StatsChartData(
      day: json["day"],
      nature: json["nature"]["playtime"],
      instrumental: json["instrumental"]["playtime"],
      pop: json["pop"]["playtime"]);
}
