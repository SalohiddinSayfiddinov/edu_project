import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String url;

  const VideoPlayerWidget({Key? key, required this.url}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
      });

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
     
      looping: true,
      showControls: true,
      allowFullScreen: true,
      deviceOrientationsOnEnterFullScreen: [DeviceOrientation.landscapeRight], // Поворот на 90 градусов в полный экран
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp], // Возврат в портретный режим
      fullScreenByDefault: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.red,
        bufferedColor: Colors.white54,
        backgroundColor: Colors.grey,
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _isInitialized ? _videoPlayerController.value.aspectRatio : 16 / 9,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(color: Colors.black),
          if (!_isInitialized) CircularProgressIndicator(),
          if (_isInitialized) Chewie(controller: _chewieController),
        ],
      ),
    );
  }
}