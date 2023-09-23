import 'dart:developer';

import 'package:crypto_currencies/repositories/models/CryptoCoin.dart';
import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  CryptoCoin? coin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coin!.name),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    var args = ModalRoute.of(context)?.settings.arguments;
    //assert(args != null && args is String, 'OOOOOExc');
    if (args == null) {
      log('You must provide args');
      return;
    }
    if (args is! CryptoCoin) {
      log('You must provide CryptoCoin args');
      return;
    }
    coin = args;
    setState(() {});
    super.didChangeDependencies();
  }
}