import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:player/components/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Good morning", style: GoogleFonts.poppins()),
      ),
      drawer: MyDrawer(),
    );
  }
}
