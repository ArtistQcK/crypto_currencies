// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
  print('lalala');
  print('lalala');
  print('lalala');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[900],
          primarySwatch: Colors.yellow,
          dividerColor: Colors.white12,
          listTileTheme: ListTileThemeData(iconColor: Colors.white54),
          appBarTheme: AppBarTheme(backgroundColor:  Colors.grey[900],titleTextStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700)),
          textTheme: TextTheme(
              bodyMedium: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
              bodySmall: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 14,
                  fontWeight: FontWeight.w700))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Currencies List'),
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, i) => ListTile(
          leading: SvgPicture.asset('assets/svg/bitcoin-svgrepo-com.svg'),
          title: Text('Btcoin', style: theme.textTheme.bodyMedium),
          subtitle: Text('20 000\$', style: theme.textTheme.bodySmall),
          trailing: Icon(
            Icons.arrow_forward_ios_sharp,
                      ),
        ),
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
