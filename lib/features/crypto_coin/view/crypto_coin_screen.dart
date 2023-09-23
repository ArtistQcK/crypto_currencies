import 'dart:developer';

import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName ?? '...'),
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
    if (args is! String) {
      log('You must provide String args');
      return;
    }
    coinName = args;
    setState(() {});
    super.didChangeDependencies();
  }
}