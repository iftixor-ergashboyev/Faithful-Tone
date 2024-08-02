import 'package:flutter/material.dart';
import 'package:player/page/access.dart';
import 'package:player/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => ThemeProvider(),
    child: const Player(),
    )
  );
}
class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Access(),
      theme: Provider.of<ThemeProvider>(context).themeData
    );
  }
}
