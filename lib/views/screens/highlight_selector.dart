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

  Future<void> selectImages() async {
    List<Media> _listImagePaths = await ImagePickers.pickerPaths(
      galleryMode: GalleryMode.image,
      selectCount: 2,
      showGif: false,
      showCamera: true,
      compressSize: 500,
      uiConfig: UIConfig(uiThemeColor: teal),
      cropConfig: CropConfig(enableCrop: false, width: 2, height: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (_videoPlayerController == null)
        ? Center(
            child: InkWell(
              highlightColor: transparent,
              focusColor: transparent,
              splashColor: transparent,
              onTap: () async {},
              child: Column(
                children: <Widget>[
                  LottieBuilder.asset("assets/lotties/add.json", width: 60, height: 60),
                  const Text("Import Video", style: TextStyle(color: teal, fontSize: 16, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          )
        : VideoPlayer(_videoPlayerController!);
  }
}
