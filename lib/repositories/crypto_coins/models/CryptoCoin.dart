import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable{
  final String name;
  final double priceInUSD;
  final String imgURL;

  CryptoCoin({required this.name, required this.priceInUSD, required this.imgURL});

  @override
  List<Object?> get props => [name,priceInUSD,imgURL];
}