class HomeModel {
  final String id;
  final int rank;
  final String name;
  final String symbol;
  final String imageUrl;
   var currentPrice;
  final double priceChange24h;
  final double priceChangePercentage24h;


  HomeModel(
      {required this.id, required this.rank, required this.name, required this.symbol, required this.imageUrl,
        required this.currentPrice, required this.priceChange24h, required this.priceChangePercentage24h});

  factory HomeModel.fromJson(Map<String, dynamic>json){

    return HomeModel(id: json["id"],
        rank: json["market_cap_rank"],
        name:json["name"],
        symbol: json["symbol"],
        imageUrl: json["image"],
        currentPrice: json["current_price"],
        priceChange24h: json["price_change_24h"],
        priceChangePercentage24h: json["price_change_percentage_24h"]);
}


}