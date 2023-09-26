import 'package:dio/dio.dart';

import 'crypto_coins.dart';
import 'models/CryptoCoin.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  final Dio dio;

  CryptoCoinsRepository({required this.dio});
  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,eth,flm,ltc,xpr,usdt,shib,trx,sol,doge&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;

    final List<CryptoCoin> CryptoCoinsList = dataRaw.entries.map((e) {
      final usdData = (e.value as Map<String,dynamic>)['USD'] as Map<String,dynamic>;
      return CryptoCoin(
        name: e.key, priceInUSD: usdData['PRICE'].toDouble(),
        imgURL: 'https://www.cryptocompare.com${usdData['IMAGEURL']}',
      );
    }).toList();
    return CryptoCoinsList;
  }
}
