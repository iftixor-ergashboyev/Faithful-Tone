import 'package:flutter/material.dart';
import 'package:player/page/home_page.dart';

void main() {
  runApp(const Player());
}
class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
