import 'package:flutter/material.dart';
import 'package:little_signs/Components/styledText.dart';

class ImageViewerComponent extends StatefulWidget {
  final List<String> titles; // List containing only image titles

  const ImageViewerComponent({
    Key? key,
    required this.titles,
  }) : super(key: key);

  @override
  State<ImageViewerComponent> createState() => _ImageViewerComponentState();
}

class _ImageViewerComponentState extends State<ImageViewerComponent> {
  int _currentIndex = 0;

  void _showNext() {
    setState(() {
      if (_currentIndex < widget.titles.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
    });
  }

  void _showPrevious() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      } else {
        _currentIndex = widget.titles.length - 1; // Loop back to the last image
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String currentTitle = widget.titles[_currentIndex];
    String imagePath =
        'assets/images/signs/$currentTitle.png'; // Generate file path dynamically

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        StyledText(
          text: currentTitle,
          borderColor: Colors.blue,
          primaryColor: Colors.white,
          fsize: 50,
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blue, width: 5),
          ),
          child: AspectRatio(
            aspectRatio: 1, // Display the image in 1:1 aspect ratio
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.blue, width: 2),
              ),
              onPressed: _showPrevious,
              child: const Text(
                'Previous',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.blue, width: 2),
              ),
              onPressed: _showNext,
              child: const Text(
                '  Next  ',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
