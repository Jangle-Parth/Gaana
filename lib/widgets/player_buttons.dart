import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    super.key,
    required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // StreamBuilder(stream: stream, builder: builder),
        StreamBuilder(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final playerState = snapshot.data;
              final processingState =
                  (playerState! as PlayerState).processingState;
              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return Container(
                  width: 64,
                  height: 64,
                  margin: EdgeInsets.all(10),
                  child: CircularProgressIndicator(),
                );
              } else if (!audioPlayer.playing) {
                return IconButton(
                    onPressed: audioPlayer.play,
                    iconSize: 75,
                    icon: Icon(Icons.play_circle));
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                    onPressed: audioPlayer.pause,
                    iconSize: 75,
                    icon: Icon(Icons.pause));
              } else {
                return IconButton(
                    onPressed: () => audioPlayer.seek(Duration.zero,
                        index: audioPlayer.effectiveIndices!.first),
                    iconSize: 75,
                    icon: Icon(Icons.replay));
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}
