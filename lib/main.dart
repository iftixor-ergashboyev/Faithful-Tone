import 'package:flutter/material.dart';
import 'package:player/models/playlist_provider.dart';
import 'package:player/page/access.dart';
import 'package:player/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => PlaylistProvider())
        ],
      child: Player(),
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
