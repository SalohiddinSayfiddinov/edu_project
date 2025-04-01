import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';


class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl;

  const AudioPlayerWidget({Key? key, required this.audioUrl}) : super(key: key);

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final AudioPlayer _player = AudioPlayer();
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _player.setUrl(widget.audioUrl).then((_) {
      setState(() {
        _duration = _player.duration ?? Duration.zero;
      });
    });

    _player.durationStream.listen((duration) {
      if (duration != null) {
        setState(() {
          _duration = duration;
        });
      }
    });

    _player.positionStream.listen((position) {
      setState(() {
        _position = position;
      });
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _seekForward() {
    _player.seek(_position + Duration(seconds: 10));
  }

  void _seekBackward() {
    _player.seek(_position - Duration(seconds: 10));
  }

  void _seekTo(Duration position) {
    _player.seek(position);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 33, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, size: 24, color: Colors.green),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.replay_10, size: 24, color: Colors.green),
                onPressed: _seekBackward,
              ),
              StreamBuilder<PlayerState>(
                stream: _player.playerStateStream,
                builder: (context, snapshot) {
                  final playerState = snapshot.data;
                  final playing = playerState?.playing ?? false;

                  return IconButton(
                    icon: Icon(playing ? Icons.pause : Icons.play_arrow, size: 24, color: Colors.green),
                    onPressed: playing ? _player.pause : _player.play,
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.forward_10, size: 24, color: Colors.green),
                onPressed: _seekForward,
              ),
              IconButton(
                icon: Icon(Icons.close, size: 24, color: Colors.green),
                onPressed: () {},
              ),
            ],
          ),  ProgressBar(
            progress: _position,
            total: _duration,
            onSeek: _seekTo,
            baseBarColor: Colors.grey.shade300,
            progressBarColor: Colors.green,
            thumbColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
