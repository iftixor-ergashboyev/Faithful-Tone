import 'package:flutter/foundation.dart';
import 'package:player/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
   final List<Song> _playlist = [

      Song(
          songName: "Without effects recitation",
          artistName: "Jabir Al-Qitan",
          albumArtImagePath: 'assets/images/1.jpg',
          audioPath: 'assets/audio/1.mp3'
      ),

      Song(
          songName: "Verses from the Holy Qur’an without effects",
          artistName: "Hussein Al-Azzam",
          albumArtImagePath: 'assets/images/2.jpg',
          audioPath: 'assets/audio/2.mp3'
      ),

      Song(
          songName: "Surah Al-Insan",
          artistName: "Mahmoud Al-Sayyid Abdel-Barr",
          albumArtImagePath: 'assets/images/3.jpg',
          audioPath: 'assets/audio/3.mp3'
      ),

      Song(
          songName: "Qur’an without effects",
          artistName: "Ahmed Al-Nafis",
          albumArtImagePath: 'assets/images/4.jpg',
          audioPath: 'assets/audio/4.mp3'
      ),

      Song(
          songName: "Surah Al-Hijr",
          artistName: "Hussein Al-Azzam",
          albumArtImagePath: 'assets/images/5.jpg',
          audioPath: 'assets/audio/5.mp3'
      ),

      Song(
          songName: "Readers' voices without effects",
          artistName: "-",
          albumArtImagePath: 'assets/images/6.jpg',
          audioPath: 'assets/audio/6.mp3'
      ),

      Song(
          songName: "Surat Al-Najm",
          artistName: "Yusuf Al-Hanbali",
          albumArtImagePath: 'assets/images/7.jpg',
          audioPath: 'assets/audio/7.mp3'
      ),

      Song(
          songName: "Surat Al-Hadid",
          artistName: "Nuh Shalaby",
          albumArtImagePath: 'assets/images/8.jpg',
          audioPath: 'assets/audio/8.mp3'
      ),

      Song(
          songName: "Qari Ibrahim Idris",
          artistName: "Surah Al Furqan",
          albumArtImagePath: 'assets/images/9.jpg',
          audioPath: 'assets/audio/9.mp3'
      ),

      Song(
          songName: "Surah Ar-Rahman",
          artistName: "Nuh Shalabi",
          albumArtImagePath: 'assets/images/10.jpg',
          audioPath: 'assets/audio/10.mp3'
      ),

   ];
   int? _currentSongIndex;

   List<Song> get playlist => _playlist;
   int? get currentSongIndex => _currentSongIndex;

   set currentSongIndex(int? newIndex) {
      _currentSongIndex = newIndex;

      notifyListeners();
   }

}