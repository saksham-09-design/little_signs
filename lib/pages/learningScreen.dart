import 'package:flutter/material.dart';
import 'package:little_signs/Components/imageComponent.dart';
import 'package:little_signs/Components/styledText.dart';
import 'package:little_signs/colors/appColors.dart';

class LearningScreen extends StatelessWidget {
  final String category;
  final double deviceWidth;
  final int level;
  final double deviceHeight;

  const LearningScreen(
      {super.key,
      required this.category,
      required this.level,
      required this.deviceHeight,
      required this.deviceWidth});

  @override
  Widget build(BuildContext context) {
    switch (category) {
      case "Alphabet":
        return _learningScreenAlpha(context);
      case "Numbers":
        return _learningScreenNum(context);
      default:
        return _learningScreenAlpha(context);
    }
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
                height: deviceHeight * 0.01,
              ),
              const Text(
                "Let's Learn:",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              StyledText(
                text: category,
                borderColor: Colors.white,
                primaryColor: textPurple,
                fsize: 34,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(right: 15),
            height: deviceWidth * 0.30,
            width: deviceWidth * 0.30,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _learningScreenAlpha(BuildContext context) {
    final titles = [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'U',
      'V',
      'W',
      'X',
      'Y',
      'Z'
    ];

    return Scaffold(
        appBar: AppBar(
          title: topAppBar("assets/images/categories/$category.png"),
          toolbarHeight: deviceHeight * 0.2,
          backgroundColor: textPurple,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: deviceWidth * 0.78,
                  height: deviceHeight * 0.65,
                  child: ImageViewerComponent(titles: titles),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: const WidgetStatePropertyAll(EdgeInsets.only(
                        left: 50, right: 50, top: 10, bottom: 10)),
                    elevation: const WidgetStatePropertyAll(5),
                    backgroundColor: WidgetStatePropertyAll(textPurple),
                    side: const WidgetStatePropertyAll(
                      BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Continue to Test',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _learningScreenNum(BuildContext context) {
    final titles = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
    return Scaffold(
        appBar: AppBar(
          title: topAppBar("assets/images/categories/$category.png"),
          toolbarHeight: deviceHeight * 0.2,
          backgroundColor: textPurple,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: deviceWidth * 0.78,
                  height: deviceHeight * 0.65,
                  child: ImageViewerComponent(titles: titles),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: const WidgetStatePropertyAll(EdgeInsets.only(
                        left: 50, right: 50, top: 10, bottom: 10)),
                    elevation: const WidgetStatePropertyAll(5),
                    backgroundColor: WidgetStatePropertyAll(textPurple),
                    side: const WidgetStatePropertyAll(
                      BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Continue to Test',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
