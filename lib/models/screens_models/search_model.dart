class SearchModel {
  final String id;
  final String name;
  final String symbol;
  var rank;
  final String imageUrl;

  SearchModel({required this.id,
    required this.name,
    required this.symbol,
    required this.rank,
    required this.imageUrl});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        rank: json["market_cap_rank"],
        imageUrl: json["large"]);
  }
}
