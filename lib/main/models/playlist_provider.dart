import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotlife/main/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    //song 1
    Song(
      songName: "Ana Asef O3zoreny",
      artistName: "Essam Sasa",
      albumArtImagePath: "assets/img/essam.jpg",
      audioPath: "audio/anaasef.mp3",
    ),
    //song 2
    Song(
      songName: "Ana Mesh Dealer",
      artistName: "Eslam Kabonga",
      albumArtImagePath: "assets/img/eslam.jpg",
      audioPath: "audio/anameshdelar.mp3",
    ),
    //song 3
    Song(
      songName: "ElMo4a8been",
      artistName: "Houda Bondok",
      albumArtImagePath: "assets/img/houda.jpg",
      audioPath: "audio/elmoshab.mp3",
    ),
    //song 4
    Song(
      songName: "Tag",
      artistName: "Abyusif",
      albumArtImagePath: "assets/img/abyusif.jpg",
      audioPath: "audio/Tag.mp3",
    ),
    //song 5
    Song(
      songName: "Rag3",
      artistName: "Amr Diab",
      albumArtImagePath: "assets/img/amr.jpg",
      audioPath: "audio/rag3.mp3",
    ),
    //song 6
    Song(
      songName: "mrzmn",
      artistName: "Shehab",
      albumArtImagePath: "assets/img/shehab.jpg",
      audioPath: "audio/shehab.mp3",
    ),
    //song 7
    Song(
      songName: "kkkk",
      artistName: "Shehab",
      albumArtImagePath: "assets/img/shehab3.jpg",
      audioPath: "audio/kkkk.mp3",
    ),
    //song 8
    Song(
      songName: "satamoni",
      artistName: "Shehab",
      albumArtImagePath: "assets/img/shehab4.jpg",
      audioPath: "audio/satamoni.mp3",
    ),
    //song 9
    Song(
      songName: "Shehab El Ha2y2y",
      artistName: "Shehab",
      albumArtImagePath: "assets/img/shehab5.jpg",
      audioPath: "audio/shehabElHa2y2y.mp3",
    ),
    //song10
    Song(
      songName: "3al 3mom",
      artistName: "Shehab",
      albumArtImagePath: "assets/img/shehab2.jpg",
      audioPath: "audio/3al3mom.mp3",
    ),
  ];
  int? _currentSongIndex;

  final AudioPlayer _audioPlayer = AudioPlayer();



  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;


  PlaylistProvider(){
    listenToDuration();
  }

  bool _isPlaying = false;

  void play() async{
    final  String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  void pause() async{
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void resume() async{
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  void pauseOrResume() async{
    if (_isPlaying){
      pause();
    }else{
      resume();
    }
    notifyListeners();
  }

  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  void playNextSong (){
    if (_currentSongIndex !=null ){
      if (_currentSongIndex! <_playlist.length-1){
        currentSongIndex  = _currentSongIndex!+1;
      }else{
        currentSongIndex = 0;
      }
    }
  }

  void  playPreviousSong ()async{
    if (_currentDuration.inSeconds>2){
      seek(Duration.zero);
    }

    else {
      if (_currentSongIndex! > 0){
        currentSongIndex = _currentSongIndex! -1;
      }else{
        currentSongIndex = _playlist.length -1;
      }
    }
  }

  void listenToDuration(){
    _audioPlayer.onDurationChanged.listen((newDuration){
      _totalDuration = newDuration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((newPosition){
      _currentDuration = newPosition;
      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((event){
      playNextSong();

    });

  }




  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;


  set currentSongIndex (int? newIndex ){
    _currentSongIndex = newIndex;

    if ( newIndex!=null ){
      play();
    }

    notifyListeners();
  }


}
