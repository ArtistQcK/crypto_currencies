
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'cypto_coins_list_app.dart';
import 'repositories/crypto_coins/crypto_coins.dart';
import 'package:talker/talker.dart';
void main() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.instance<Talker>().debug('talker started...');

  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(() => CryptoCoinsRepository(dio: Dio()));
  runApp(const CryptoCoinsListApp());
}







