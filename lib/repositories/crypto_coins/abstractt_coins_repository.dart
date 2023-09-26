import 'models/CryptoCoin.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
}