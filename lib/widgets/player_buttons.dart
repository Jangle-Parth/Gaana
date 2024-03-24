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
        StreamBuilder<SequenceState?>(
          stream: audioPlayer.sequenceStateStream,
          builder: (context, index) {
            return IconButton(
              onPressed: audioPlayer.hasPrevious
                  ? () => audioPlayer.seekToPrevious()
                  : null,
              icon: Icon(
                Icons.skip_previous,
                color: Colors.white,
              ),
              iconSize: 50,
            );
          },
        ),
        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final playerState = snapshot.data;
              final processingState = playerState!.processingState;
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
                    iconSize: 50,
                    icon: Icon(
                      Icons.play_circle_fill_outlined,
                      color: Colors.white,
                    ));
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                    onPressed: audioPlayer.pause,
                    iconSize: 50,
                    icon: Icon(
                      Icons.pause,
                      color: Colors.white,
                    ));
              } else {
                return IconButton(
                  onPressed: () => audioPlayer.seek(Duration.zero,
                      index: audioPlayer.effectiveIndices!.first),
                  icon: Icon(
                    Icons.replay,
                    color: Colors.grey,
                  ),
                  iconSize: 50,
                );
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: audioPlayer.sequenceStateStream,
          builder: (context, index) {
            return IconButton(
              onPressed:
                  audioPlayer.hasNext ? () => audioPlayer.seekToNext() : null,
              icon: Icon(
                Icons.skip_next,
                color: Colors.white,
              ),
              iconSize: 50,
            );
          },
        ),
      ],
    );
  }
}
