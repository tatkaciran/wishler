import 'package:flutter/material.dart';
import 'package:wishler/wishler_scaffold.dart';

class Wishler extends StatelessWidget {
  const Wishler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const WishlerScaffold(),
    );
  }
}
