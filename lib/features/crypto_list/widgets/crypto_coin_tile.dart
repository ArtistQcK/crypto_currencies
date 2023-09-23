import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoConTile extends StatelessWidget {
  const CryptoConTile({
    super.key,
    required this.coinName,
  });

  final String coinName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: SvgPicture.asset('assets/svg/bitcoin-svgrepo-com.svg'),
      title: Text(coinName, style: theme.textTheme.bodyMedium),
      subtitle: Text('20 000\$', style: theme.textTheme.bodySmall),
      trailing: Icon(
        Icons.arrow_forward_ios_sharp,
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/coin',arguments: coinName);
      },
    );
  }
}