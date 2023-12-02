import 'package:flutter/material.dart';
import 'package:footy_shorts/utils/globals.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

class VideoSelector extends StatefulWidget {
  const VideoSelector({super.key});

  @override
  State<VideoSelector> createState() => _VideoSelectorState();
}

class _VideoSelectorState extends State<VideoSelector> {
  VideoPlayerController? _videoPlayerController;

  Future<void> _selectVideos() async {
    List<Media> imagesPaths = await ImagePickers.pickerPaths(
      galleryMode: GalleryMode.video,
      selectCount: 1,
      showGif: false,
      showCamera: false,
      compressSize: 500,
      uiConfig: UIConfig(uiThemeColor: teal),
      cropConfig: CropConfig(enableCrop: false, width: 2, height: 1),
    );
    debugPrint(imagesPaths.toString());
  }

  @override
  Widget build(BuildContext context) {
    return (_videoPlayerController == null)
        ? InkWell(
            highlightColor: transparent,
            focusColor: transparent,
            splashColor: transparent,
            onTap: () async {
              await selectVideos();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LottieBuilder.asset("assets/lotties/add.json", width: 60, height: 60),
                const Text("Import Video", style: TextStyle(color: teal, fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
          )
        : VideoPlayer(_videoPlayerController!);
  }
}
