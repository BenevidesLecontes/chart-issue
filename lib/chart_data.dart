class ChartData {
  final double lastTrade;
  final DateTime updateAt;
  final bool showMarker;

  ChartData({
    this.lastTrade,
    this.updateAt,
    this.showMarker = false,
  });

  ChartData.fromJsonMap(Map<String, dynamic> map)
      : lastTrade = map["lastTrade"]?.toDouble(),
        showMarker = false,
        updateAt = DateTime.parse(map["updateAt"]);
}
