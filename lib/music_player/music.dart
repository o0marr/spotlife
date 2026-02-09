import 'package:audioplayers/audioplayers.dart';

final AudioPlayer player = AudioPlayer();

void playSong(String path) async {
  await player.stop();
  await player.play(AssetSource(path));
}
