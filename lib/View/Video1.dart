import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final String videoAssetPath;

  VideoScreen({Key? key, required this.videoAssetPath}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAssetPath)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    // Construir tu widget aquí, por ejemplo, un VideoPlayer widget
    return Scaffold(
      // ...
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}