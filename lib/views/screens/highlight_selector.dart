import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

class VideoSelector extends StatefulWidget {
  const VideoSelector({super.key});

  @override
  State<VideoSelector> createState() => _VideoSelectorState();
}

class _VideoSelectorState extends State<VideoSelector> {
  VideoPlayerController? _videoPlayerController;
  @override
  Widget build(BuildContext context) {
    return (_videoPlayerController == null)
        ? Center(
            child: Column(
              children: <Widget>[LottieBuilder.asset("assets/lotties/add.json", width: 60, height: 60), Text("Import Video")],
            ),
          )
        : Column(
            children: <Widget>[
              VideoPlayer(_videoPlayerController!),
            ],
          );
  }
}