// To parse this JSON data, do
//
//     final currency = currencyFromJson(jsonString);

import 'dart:convert';

Currency currencyFromJson(String str) => Currency.fromJson(json.decode(str));

String currencyToJson(Currency data) => json.encode(data.toJson());

class Currency {
  Currency({
    this.status,
    this.data,
  });

  Status status;
  List<Coin> data;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    status: Status.fromJson(json["status"]),
    data: List<Coin>.from(json["data"].map((x) => Coin.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Coin {
  Coin({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.numMarketPairs,
    this.dateAdded,
    this.tags,
    this.maxSupply,
    this.circulatingSupply,
    this.totalSupply,
    this.platform,
    this.cmcRank,
    this.lastUpdated,
    this.quote,
  });

  int id;
  String name;
  String symbol;
  String slug;
  int numMarketPairs;
  DateTime dateAdded;
  List<String> tags;
  int maxSupply;
  double circulatingSupply;
  double totalSupply;
  Platform platform;
  int cmcRank;
  DateTime lastUpdated;
  Quote quote;

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
    id: json["id"],
    name: json["name"],
    symbol: json["symbol"],
    slug: json["slug"],
    numMarketPairs: json["num_market_pairs"],
    dateAdded: DateTime.parse(json["date_added"]),
    tags: List<String>.from(json["tags"].map((x) => x)),
    maxSupply: json["max_supply"] == null ? null : json["max_supply"],
    circulatingSupply: json["circulating_supply"].toDouble(),
    totalSupply: json["total_supply"].toDouble(),
    platform: json["platform"] == null ? null : Platform.fromJson(json["platform"]),
    cmcRank: json["cmc_rank"],
    lastUpdated: DateTime.parse(json["last_updated"]),
    quote: Quote.fromJson(json["quote"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "symbol": symbol,
    "slug": slug,
    "num_market_pairs": numMarketPairs,
    "date_added": dateAdded.toIso8601String(),
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "max_supply": maxSupply == null ? null : maxSupply,
    "circulating_supply": circulatingSupply,
    "total_supply": totalSupply,
    "platform": platform == null ? null : platform.toJson(),
    "cmc_rank": cmcRank,
    "last_updated": lastUpdated.toIso8601String(),
    "quote": quote.toJson(),
  };
}

class Platform {
  Platform({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.tokenAddress,
  });

  int id;
  String name;
  String symbol;
  String slug;
  String tokenAddress;

  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
    id: json["id"],
    name: json["name"],
    symbol: json["symbol"],
    slug: json["slug"],
    tokenAddress: json["token_address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "symbol": symbol,
    "slug": slug,
    "token_address": tokenAddress,
  };
}

class Quote {
  Quote({
    this.usd,
  });

  Usd usd;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    usd: Usd.fromJson(json["USD"]),
  );

  Map<String, dynamic> toJson() => {
    "USD": usd.toJson(),
  };
}

class Usd {
  Usd({
    this.price,
    this.volume24H,
    this.percentChange1H,
    this.percentChange24H,
    this.percentChange7D,
    this.marketCap,
    this.lastUpdated,
  });

  double price;
  double volume24H;
  double percentChange1H;
  double percentChange24H;
  double percentChange7D;
  double marketCap;
  DateTime lastUpdated;

  factory Usd.fromJson(Map<String, dynamic> json) => Usd(
    price: json["price"].toDouble(),
    volume24H: json["volume_24h"].toDouble(),
    percentChange1H: json["percent_change_1h"].toDouble(),
    percentChange24H: json["percent_change_24h"].toDouble(),
    percentChange7D: json["percent_change_7d"].toDouble(),
    marketCap: json["market_cap"].toDouble(),
    lastUpdated: DateTime.parse(json["last_updated"]),
  );

  Map<String, dynamic> toJson() => {
    "price": price,
    "volume_24h": volume24H,
    "percent_change_1h": percentChange1H,
    "percent_change_24h": percentChange24H,
    "percent_change_7d": percentChange7D,
    "market_cap": marketCap,
    "last_updated": lastUpdated.toIso8601String(),
  };
}

class Status {
  Status({
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
    this.notice,
    this.totalCount,
  });

  DateTime timestamp;
  int errorCode;
  dynamic errorMessage;
  int elapsed;
  int creditCount;
  String notice;
  int totalCount;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    timestamp: DateTime.parse(json["timestamp"]),
    errorCode: json["error_code"],
    errorMessage: json["error_message"],
    elapsed: json["elapsed"],
    creditCount: json["credit_count"],
    notice: json["notice"],
    totalCount: json["total_count"],
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp.toIso8601String(),
    "error_code": errorCode,
    "error_message": errorMessage,
    "elapsed": elapsed,
    "credit_count": creditCount,
    "notice": notice,
    "total_count": totalCount,
  };
}
