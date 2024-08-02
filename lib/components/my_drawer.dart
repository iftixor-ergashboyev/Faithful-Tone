import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:player/page/settings_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
              child: Icon(CupertinoIcons.music_albums_fill, size: 40,
                color: Theme.of(context).colorScheme.inversePrimary,
              )
          ),
          Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
            child: ListTile(
              title: Text("Home", style: GoogleFonts.poppins()),
              leading: Icon(CupertinoIcons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, top: 0),
            child: ListTile(
              title: Text("Settings", style: GoogleFonts.poppins()),
              leading: Icon(CupertinoIcons.settings),
              onTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => SettingsPage())
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
