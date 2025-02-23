import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:little_signs/Components/styledText.dart';
import 'package:little_signs/colors/appColors.dart';

class VideoTestWindow extends StatefulWidget {
  final List<String> videoTitles;
  final List<List<String>> options;
  final List<int> correctAnswers;
  final Function onPass;

  const VideoTestWindow({
    Key? key,
    required this.videoTitles,
    required this.options,
    required this.correctAnswers,
    required this.onPass,
  }) : super(key: key);

  @override
  State<VideoTestWindow> createState() => _VideoTestWindowState();
}

class _VideoTestWindowState extends State<VideoTestWindow> {
  late VideoPlayerController _controller;
  int _currentIndex = 0;
  List<int?> _selectedAnswers = [];
  double? deviceHeight;
  double? deviceWidth;

  @override
  void initState() {
    super.initState();
    _selectedAnswers = List<int?>.filled(widget.videoTitles.length, null);
    _initializeVideo();
  }

  void _initializeVideo() {
    final videoPath =
        'assets/TestVideos/${widget.videoTitles[_currentIndex]}.mp4';
    _controller = VideoPlayerController.asset(videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
        _controller.setVolume(0);
      });
  }

  void _playNext() {
    if (_currentIndex < widget.videoTitles.length - 1) {
      setState(() {
        _currentIndex++;
        _controller.dispose();
        _initializeVideo();
      });
    }
  }

  void _playPrevious() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _controller.dispose();
        _initializeVideo();
      });
    }
  }

  void _submitTest() {
    int score = 0;
    for (int i = 0; i < widget.correctAnswers.length; i++) {
      if (_selectedAnswers[i] == widget.correctAnswers[i]) {
        score++;
      }
    }
    showDialog(
      context: context,
      builder: (context) {
        bool isPassed = score > 3;
        return AlertDialog(
          title: Text(isPassed ? "Nailed It!" : "Keep Working Hard!"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isPassed
                    ? "Congratulations! You've passed and are good to go ahead!"
                    : "You missed a bit. Try again from the beginning.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Image.asset(
                isPassed
                    ? "assets/images/success.png"
                    : "assets/images/failure.png",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (isPassed) {
                  widget.onPass();
                } else {
                  setState(() {
                    _currentIndex = 0;
                    _selectedAnswers.fillRange(
                        0, _selectedAnswers.length, null);
                  });
                }
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: topAppBar("assets/images/categories/Sentences.png"),
        toolbarHeight: deviceHeight! * 0.2,
        backgroundColor: textPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Watch and Answer',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 5),
            _controller.value.isInitialized
                ? Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: textPurple, width: 5),
                    ),
                    child: Container(
                      height: deviceHeight! * 0.3,
                      width: deviceHeight! * 0.3,
                      child: VideoPlayer(_controller),
                    ),
                  )
                : const CircularProgressIndicator(),
            const SizedBox(height: 10),
            ...widget.options[_currentIndex].asMap().entries.map((entry) {
              final index = entry.key;
              final option = entry.value;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedAnswers[_currentIndex] = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _selectedAnswers[_currentIndex] == index
                          ? textPurple
                          : Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    color: _selectedAnswers[_currentIndex] == index
                        ? textPurple.withOpacity(0.1)
                        : Colors.white,
                  ),
                  child: Row(
                    children: [
                      Radio<int>(
                        value: index,
                        groupValue: _selectedAnswers[_currentIndex],
                        onChanged: (value) {
                          setState(() {
                            _selectedAnswers[_currentIndex] = value;
                          });
                        },
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          option,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: textPurple, width: 2),
                  ),
                  onPressed: _currentIndex > 0 ? _playPrevious : null,
                  child: Text(
                    'Previous',
                    style: TextStyle(color: textPurple),
                  ),
                ),
                _currentIndex < widget.videoTitles.length - 1
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: textPurple, width: 2),
                        ),
                        onPressed: _playNext,
                        child: Text(
                          'Next',
                          style: TextStyle(color: textPurple),
                        ),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                        ),
                        onPressed: _submitTest,
                        child: const Text('Submit'),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget topAppBar(String image) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: deviceHeight! * 0.01,
              ),
              const Text(
                "Let's Test",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              StyledText(
                text: 'Your\nLearning',
                borderColor: Colors.white,
                primaryColor: textPurple,
                fsize: 30,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(right: 15),
            height: deviceWidth! * 0.30,
            width: deviceWidth! * 0.30,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image)),
            ),
          ),
        ),
      ],
    );
  }
}
