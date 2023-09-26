import 'package:flutter/material.dart';

import '../../../repositories/crypto_coins/models/CryptoCoin.dart';

class CryptoConTile extends StatelessWidget {
  const CryptoConTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(coin.imgURL),
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text('${coin.priceInUSD}\$', style: theme.textTheme.bodySmall),
      trailing: Icon(
        Icons.arrow_forward_ios_sharp,
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/coin',arguments: coin);
      },
    );
  }
}