import 'dart:async';

import 'package:crypto_currencies/repositories/crypto_coins/abstractt_coins_repository.dart';
import 'package:crypto_currencies/repositories/crypto_coins/models/CryptoCoin.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_list_event.dart';

part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepositoy) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        if(state is! CryptoListLoaded){
          emit(CryptoListLoading());
        }
        final coinsList = await coinsRepositoy.getCoinsList();
        print('Crypto LIST LOADING');
        emit(CryptoListLoaded(coinsList: coinsList));
      } catch (e) {
        emit(CryptoListLoadingFailure(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }

  final AbstractCoinsRepository coinsRepositoy;
}
