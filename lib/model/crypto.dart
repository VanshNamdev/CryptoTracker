class Crypto {
  final String id;
  final String name;
  final String symbol;
  final String image;
  final double currentPrice;
  final double priceChange24h;
  final double priceChangePercentage24h;
  final double marketCap;
  final int marketCapRank;
  final double totalVolume;
  final double high24h;
  final double low24h;
  final double circulatingSupply;
  final double? totalSupply;
  final double? maxSupply;
  final double ath;
  final String athDate;
  final double atl;
  final String atlDate;

  Crypto({
    required this.id,
    required this.name,
    required this.symbol,
    required this.image,
    required this.currentPrice,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
    required this.marketCap,
    required this.marketCapRank,
    required this.totalVolume,
    required this.high24h,
    required this.low24h,
    required this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    required this.ath,
    required this.athDate,
    required this.atl,
    required this.atlDate,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      image: json['image'],
      currentPrice: json['current_price'].toDouble(),
      priceChange24h: json['price_change_24h'].toDouble(),
      priceChangePercentage24h: json['price_change_percentage_24h'].toDouble(),
      marketCap: json['market_cap'].toDouble(),
      marketCapRank: json['market_cap_rank'],
      totalVolume: json['total_volume'].toDouble(),
      high24h: json['high_24h'].toDouble(),
      low24h: json['low_24h'].toDouble(),
      circulatingSupply: json['circulating_supply'].toDouble(),
      totalSupply: json['total_supply'] != null
          ? json['total_supply'].toDouble()
          : null,
      maxSupply:
          json['max_supply'] != null ? json['max_supply'].toDouble() : null,
      ath: json['ath'].toDouble(),
      athDate: json['ath_date'],
      atl: json['atl'].toDouble(),
      atlDate: json['atl_date'],
    );
  }
}
