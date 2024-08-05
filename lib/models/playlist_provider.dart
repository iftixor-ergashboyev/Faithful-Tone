import 'package:audioplayers/audioplayers.dart';
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
          songName: "Holy Qur’an without effects",
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
          songName: "Readers' voices",
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

   final AudioPlayer _audioPlayer =AudioPlayer();

   Duration _currentDuration =Duration.zero;
   Duration _totalDuration =Duration.zero;

   PlaylistProvider() {
      listenToDuration();
   }

   bool _isPlaying = false;

   void play() async {
      final String  path = _playlist[_currentSongIndex!].audioPath;
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(path));
      _isPlaying = true;
      notifyListeners();
   }

   void pause() async {
      await _audioPlayer.pause();
      _isPlaying = false;
      notifyListeners();
   }

   void resume() async {
      await _audioPlayer.resume();
      _isPlaying = true;
      notifyListeners();
   }

   void pauseOrResume() async {
      if (_isPlaying) {
         pause();
      } else {
         resume();
      }
      notifyListeners();
   }

   void seek(Duration position) async {
      await _audioPlayer.seek(position);
   }

   void playNextSong() {
      if (_currentSongIndex != null) {
         if (_currentSongIndex! < _playlist.length -1) {
            currentSongIndex = _currentSongIndex! + 1;
         } else {
            currentSongIndex = 0;
         }
      }
   }

   void  playPreviousSong() async {
      if (_currentDuration.inSeconds > 2) {
         seek(Duration.zero);
      }
      else {
         if (_currentSongIndex! > 0) {
            currentSongIndex = _currentSongIndex! -1;
         } else {
            currentSongIndex = _playlist.length -1;
         }
      }
   }


   void listenToDuration() {
      _audioPlayer.onDurationChanged.listen((newDuration) {
         _totalDuration = newDuration;
         notifyListeners();
      });

      _audioPlayer.onPositionChanged.listen((newPosition) {
         _currentDuration = newPosition;
         notifyListeners();
      });
      _audioPlayer.onPlayerComplete.listen((event) {playNextSong();});
   }

   List<Song> get playlist => _playlist;
   int? get currentSongIndex => _currentSongIndex;
   bool  get isPlaying => _isPlaying;
   Duration get currentDuration => _currentDuration;
   Duration get totalDuration => _totalDuration;

   set currentSongIndex(int? newIndex) {
      _currentSongIndex = newIndex;

      if (newIndex != null) {
         play();
      }

      notifyListeners();
   }

}