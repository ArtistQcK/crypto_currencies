
import 'dart:async';

import 'package:crypto_currencies/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_currencies/repositories/crypto_coins/abstractt_coins_repository.dart';
import 'package:crypto_currencies/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Crypto Currencies List'),
        ),
        body: RefreshIndicator(
          onRefresh: () async{
            final completer = Completer();
            _cryptoListBloc.add(LoadCryptoList(completer: completer));
            return completer.future;},
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
              bloc: _cryptoListBloc,
              builder: (context, state) {
                if (state is CryptoListLoaded) {
                  return ListView.separated(
                    itemCount: state.coinsList.length,
                    itemBuilder: (context, i) {
                      final coin = state.coinsList[i];
                      return CryptoConTile(coin: coin);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                  );
                }
                if (state is CryptoListLoadingFailure) {
                  return Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Something went wrong',style: darkTheme.textTheme.headlineMedium,),
                      Text('Please try again later',style: darkTheme.textTheme.headlineMedium),
                      SizedBox(width: double.infinity,height: 30,),
                      TextButton(onPressed: (){
                        _cryptoListBloc.add(LoadCryptoList(completer: null));
                      }
                          , child: Text('Try again'))
                    ],
                  );
                }
                return Center(child: CircularProgressIndicator());
              }),
        ));
    // (_cryptoCoinsList == null)?
  }

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList(completer: null));
    super.initState();
  }
}
