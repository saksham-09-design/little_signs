import 'package:flutter/material.dart';
import 'package:little_signs/Components/explanation.dart';
import 'package:little_signs/Components/styledText.dart';
import 'package:little_signs/colors/appColors.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerComponent extends StatefulWidget {
  final List<String> titles; // List containing video titles

  const VideoPlayerComponent({
    Key? key,
    required this.titles,
  }) : super(key: key);

  @override
  State<VideoPlayerComponent> createState() => _VideoPlayerComponentState();
}

class _VideoPlayerComponentState extends State<VideoPlayerComponent> {
  late VideoPlayerController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    String videoPath = "assets/videos/${widget.titles[_currentIndex]}.mp4";
    _controller = VideoPlayerController.asset(videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
        _controller.setVolume(0);
      });
  }

  void _playNext() {
    if (_currentIndex < widget.titles.length - 1) {
      _currentIndex++;
    } else {
      _currentIndex = 0;
    }
    _controller.dispose();
    _initializeVideo();
  }

  void _playPrevious() {
    if (_currentIndex > 0) {
      _currentIndex--;
    } else {
      _currentIndex = widget.titles.length - 1;
    }
    _controller.dispose();
    _initializeVideo();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_currentIndex + 1) / widget.titles.length;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          StyledText(
            text: widget.titles[_currentIndex],
            borderColor: Colors.red,
            primaryColor: Colors.white,
            fsize: 45,
          ),
          const SizedBox(height: 5),
          if (_controller.value.isInitialized)
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.red, width: 5),
              ),
              child: AspectRatio(
                aspectRatio: 16.0 / 9.0,
                child: VideoPlayer(_controller),
              ),
            )
          else
            const Center(child: Text('Error loading video')),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  side: WidgetStatePropertyAll(
                    BorderSide(color: Colors.red, width: 2),
                  ),
                ),
                onPressed: _playPrevious,
                child: const Text(
                  'Previous',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  side: WidgetStatePropertyAll(
                    BorderSide(color: Colors.red, width: 2),
                  ),
                ),
                onPressed: _playNext,
                child: const Text(
                  '  Next  ',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                // Background Bar
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[300],
                  ),
                ),
                // Foreground (Progress)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: 30,
                  width: progress * MediaQuery.of(context).size.width * 0.68,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [skyBlue, textPurple],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Description Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Explanation:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textPurple,
                  ),
                ),
                Text(
                  textAlign: TextAlign.justify,
                  wordExplanations[widget.titles[_currentIndex]] ??
                      'No explanation available.',
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
