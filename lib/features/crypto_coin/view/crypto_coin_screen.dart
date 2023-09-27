// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'package:crypto_currencies/theme/theme.dart';
import 'package:flutter/material.dart';
import '../../../repositories/crypto_coins/models/CryptoCoin.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Image.network(
                coin!.imgURL,
                width: 150,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Text(coin!.priceInUSD.toString()),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Hight 24 Hour',style: darkTheme.textTheme.bodySmall,),
                          Text('${coin!.high24Hour}',style: darkTheme.textTheme.bodySmall,),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Low 24 Hour',style: darkTheme.textTheme.bodySmall,),
                          Text('${coin!.low24Hour}',style: darkTheme.textTheme.bodySmall,),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
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
