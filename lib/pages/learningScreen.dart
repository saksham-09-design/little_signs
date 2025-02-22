import 'package:flutter/material.dart';
import 'package:little_signs/Components/ImageTestComponent.dart';
import 'package:little_signs/Components/imageComponent.dart';
import 'package:little_signs/Components/styledText.dart';
import 'package:little_signs/colors/appColors.dart';
import 'package:little_signs/pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> updateUserLevel(int level) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('userLevel', level);
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageTestWindow(
                          imageTitles: const ['M', 'B', 'Q', 'W', 'R'],
                          options: const [
                            ['N', 'P', 'M', 'S'],
                            ['R', 'P', 'B', 'L'],
                            ['O', 'Q', 'A', 'N'],
                            ['S', 'V', 'C', 'W'],
                            ['P', 'R', 'B', 'X']
                          ],
                          correctAnswers: const [2, 2, 1, 3, 1],
                          onPass: () {
                            updateUserLevel((level > 1) ? level : 1);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Homepage(),
                              ),
                              (route) => false,
                            );
                          },
                        ),
                      ),
                    );
                  },
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageTestWindow(
                          imageTitles: const ['3', '7', '8', '2', '10'],
                          options: const [
                            ['1', '4', '3', '2'],
                            ['7', '8', '6', '5'],
                            ['9', '6', '8', '10'],
                            ['4', '2', '1', '3'],
                            ['10', '4', '7', '2']
                          ],
                          correctAnswers: const [2, 0, 2, 1, 0],
                          onPass: () {
                            updateUserLevel((level > 2) ? level : 2);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Homepage(),
                              ),
                              (route) => false,
                            );
                          },
                        ),
                      ),
                    );
                  },
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
