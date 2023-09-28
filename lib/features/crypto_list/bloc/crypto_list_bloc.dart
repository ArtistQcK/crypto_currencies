import 'dart:async';

import 'package:crypto_currencies/repositories/crypto_coins/abstractt_coins_repository.dart';
import 'package:crypto_currencies/repositories/crypto_coins/models/CryptoCoin.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        if (state is! CryptoListLoaded) {
          emit(CryptoListLoading());
        }
        final coinsList = await coinsRepository.getCoinsList();
        emit(CryptoListLoaded(coinsList: coinsList));
      } catch (e, st) {
        emit(CryptoListLoadingFailure(exception: e));
        GetIt.instance<Talker>().handle(e, st, 'ERR000');
      } finally {
        event.completer?.complete();
      }
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.instance<Talker>().handle(error, stackTrace);
  }

  final AbstractCoinsRepository coinsRepository;
}
