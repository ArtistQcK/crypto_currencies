import 'package:flutter/material.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class CryptoCoinsListApp extends StatelessWidget {
  const CryptoCoinsListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: routes,
        theme: darkTheme
    );
  }}