import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  final String name;
  final double priceInUSD;
  final String imgURL;
  final double high24Hour;
  final double low24Hour;

  CryptoCoin(
      {required this.high24Hour,
      required this.low24Hour,
      required this.name,
      required this.priceInUSD,
      required this.imgURL});

  @override
  List<Object?> get props => [name, priceInUSD, imgURL, high24Hour, low24Hour];
}
