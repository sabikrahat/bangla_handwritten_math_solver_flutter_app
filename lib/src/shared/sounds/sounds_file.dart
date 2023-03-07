import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';

Future<void> playCongratulations() async {
  if (Platform.isWindows) return;
  await AssetsAudioPlayer.newPlayer().open(
    Audio("assets/audios/congratulations.mp3"),
    autoStart: true,
    showNotification: true,
  );
}

Future<void> playWrong() async {
  if (Platform.isWindows) return;
  await AssetsAudioPlayer.newPlayer().open(
    Audio("assets/audios/wrong.mp3"),
    autoStart: true,
    showNotification: true,
  );
}
