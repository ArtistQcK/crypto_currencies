import 'package:crypto_currencies/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:flutter/material.dart';
import '../../../repositories/models/CryptoCoin.dart';
import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Currencies List'),
      ),
      body: (_cryptoCoinsList == null)? Center(child: CircularProgressIndicator()) : ListView.separated(
        itemCount: _cryptoCoinsList!.length,
        itemBuilder: (context, i) {
          final coin = _cryptoCoinsList![i];
          return CryptoConTile(coin: coin);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }

  Future<void> loadCryptoCoin() async {
    _cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
    setState(() {

    });
  }

  @override
  void initState() {
    loadCryptoCoin();
    super.initState();
  }
}

