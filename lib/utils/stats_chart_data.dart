class StatsChartData {
  StatsChartData(
      dynamic dayName,
      num? totalMinutes,
      num? percentageLofi,
      num? percentageHiphop,
      num? percentageNatural,
      num? percentagePop) {
    this.dayName = dayName;

    if (totalMinutes != null) {
      totalMinutes = totalMinutes / 3600;
      this.lofi = totalMinutes * percentageLofi! / 100;
      this.hiphop = totalMinutes * percentageHiphop! / 100 + this.lofi!;
      this.nature = totalMinutes * percentageNatural! / 100 + this.hiphop!;
      this.pop = totalMinutes * percentagePop! / 100 + this.nature!;
    }
  }

  late dynamic dayName;
  late num? lofi;
  late num? hiphop;
  late num? nature;
  late num? pop;
}
