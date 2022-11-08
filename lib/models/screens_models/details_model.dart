class DetailsModel {

  final String id;
  final String name;
  final String symbol;
  final String description;
  final int rank;
  final String imageUrl;
  var currentPrice;

  //curve data
  final double percentageChange24h;
  final double percentageChange7d;
  final double percentageChange14d;
  final double percentageChange30d;
  final double percentageChange60d;
  final double percentageChange200d;
  final double percentageChange1y;

  DetailsModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.description,
    required this.rank,
    required this.imageUrl,
    required this.currentPrice,
    required this.percentageChange24h,
    required this.percentageChange7d,
    required this.percentageChange14d,
    required this.percentageChange30d,
    required this.percentageChange60d,
    required this.percentageChange200d,
    required this.percentageChange1y});


  factory DetailsModel.fromJson(Map<String, dynamic> json){
    return DetailsModel(id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        description: json['description']["en"],
        rank: json["market_cap_rank"],
        imageUrl: json["image"]["large"],
        currentPrice: json["market_data"]["current_price"]["usd"],
        percentageChange24h: json["market_data"]["price_change_percentage_24h"],
        percentageChange7d: json["market_data"]["price_change_percentage_7d"],
        percentageChange14d: json["market_data"]["price_change_percentage_14d"],
        percentageChange30d: json["market_data"]["price_change_percentage_30d"],
        percentageChange60d: json["market_data"]["price_change_percentage_60d"],
        percentageChange200d: json["market_data"]["price_change_percentage_200d"],
        percentageChange1y: json["market_data"]["price_change_percentage_1y"]);

  }
}