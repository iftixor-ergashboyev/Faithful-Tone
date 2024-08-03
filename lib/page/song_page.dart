import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:player/components/my_box.dart';
import 'package:player/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {

        final playlist =value.playlist;

        final currentSong = playlist[value.currentSongIndex ?? 0];

        return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25, right: 25, left: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(CupertinoIcons.back)
                          ),
                          Text("Playlist", style: GoogleFonts.urbanist(fontSize: 22, fontWeight: FontWeight.bold)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.menu)
                          ),
                        ],
                      ),
                      MyBox(
                        child: Column(
                          children: [
                            ClipRRect(
                              child: Image.asset(currentSong.albumArtImagePath),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(currentSong.songName, style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold, fontSize: 18,
                                      )),
                                      Text(currentSong.artistName, style: GoogleFonts.poppins())
                                    ],
                                  ),
                                  Icon(CupertinoIcons.heart_fill, color: Colors.red,)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 25),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("0:00"),
                                Icon(CupertinoIcons.shuffle),
                                Text("0:00")
                              ],
                            ),
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                thumbShape:  const RoundSliderThumbShape(enabledThumbRadius: 0)
                            ),
                            child: Slider(
                                min: 0,
                                max: 100,
                                value: 50,
                                onChanged: (value) {}
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: MyBox(
                                  child: Icon(Icons.skip_previous_rounded),
                                ),
                              )
                          ),
                          SizedBox(width: 20),
                          Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: () {},
                                child: MyBox(
                                  child: Icon(Icons.play_arrow),
                                ),
                              )
                          ),
                          SizedBox(width: 20),
                          Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: MyBox(
                                  child: Icon(Icons.skip_next),
                                ),
                              )
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
        );
      }
    );
  }
}
