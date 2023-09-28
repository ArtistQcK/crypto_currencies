import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'cypto_coins_list_app.dart';
import 'repositories/crypto_coins/crypto_coins.dart';

void main() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);

  final dio = Dio();
  dio.interceptors.add(TalkerDioLogger(talker: talker,
      settings: TalkerDioLoggerSettings(printResponseData: false)));

  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
          () => CryptoCoinsRepository(dio: dio));

  Bloc.observer = TalkerBlocObserver(talker: talker,settings:TalkerBlocLoggerSettings(printEventFullData: false,printStateFullData: false) );



  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  runZonedGuarded(() => runApp(const CryptoCoinsListApp()), (error, stack) {
    return GetIt.I<Talker>().handle(error, stack);
  });
}
