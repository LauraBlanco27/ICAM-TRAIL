import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'InfoSendero1.dart';

class VideoScreen extends StatefulWidget {
  final String videoAssetPath;

  const VideoScreen({Key? key, required this.videoAssetPath}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _showControls = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAssetPath)
      ..initialize().then((_) {
        setState(() {
          _isPlaying = true;
          _controller.play(); // Autoplay
        });
      });
    _controller.addListener(() {
      setState(() {
        _isPlaying = _controller.value.isPlaying;
        if (_isPlaying) {
          Future.delayed(const Duration(seconds: 3), () {
            if (_isPlaying) {
              setState(() => _showControls = false);
            }
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffd9d9d9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) =>Sendero1()),
            );
          },
        ),
        title: const Text(
          '',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _showControls = true;
          });
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
            _showControls ? _buildPlayPauseOverlay() : Container(),
            _buildCustomProgressIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayPauseOverlay() {
    return AnimatedOpacity(
      opacity: _isPlaying ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Container(
          color: Colors.black38,
          child: Center(
            child: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              size: 80.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomProgressIndicator() {
    return VideoProgressIndicator(
      _controller,
      allowScrubbing: true,
      padding: const EdgeInsets.all(10.0),
      colors: VideoProgressColors(
        playedColor: Theme.of(context).colorScheme.secondary,
        backgroundColor: Colors.grey.shade800,
        bufferedColor: Colors.grey.shade500,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}