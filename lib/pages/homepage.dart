import 'dart:math';

import 'package:flutter/material.dart';
import 'package:little_signs/Components/VideoTestComponent.dart';
import 'package:little_signs/Components/gridLetter.dart';
import 'package:little_signs/Components/styledText.dart';
import 'package:little_signs/Components/wavingHand.dart';
import 'package:little_signs/colors/appColors.dart';
import 'package:little_signs/pages/aboutpage.dart';
import 'package:little_signs/pages/learningScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  _Homepage();
  String name = "Guest";
  int level = 0;
  double? _deviceHeight;
  double? _deviceWidth;
  bool _isLoading = true;

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('userName') ?? 'Guest';
      level = prefs.getInt('userLevel') ?? 0;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: _isLoading
              ? Container()
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome Back!",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          StyledText(
                              text: name,
                              borderColor: Colors.white,
                              primaryColor: textPurple,
                              fsize: 40),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      child: WavingIcon(wColor: Colors.white, wSize: 75),
                    ),
                  ],
                ),
          toolbarHeight: _deviceHeight! * 0.2,
          backgroundColor: textPurple,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => AboutScreen()),
            );
          },
          backgroundColor: textPurple,
          shape: const CircleBorder(),
          child: const Icon(Icons.info, color: Colors.white),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: textPurple,
                ),
              )
            : Center(
                child: Container(
                  height: _deviceHeight! * 0.8,
                  width: _deviceWidth! * 0.9,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Level",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: textPurple),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            level.toString(),
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: textPurple),
                          )
                        ],
                      ),
                      progressBar(),
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: _deviceHeight! * 0.53,
                        width: _deviceWidth! * 0.85,
                        margin: const EdgeInsets.only(top: 20, bottom: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _buildGrid(),
                            ],
                          ),
                        ),
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
                          if (level == 15) {
                            var random = Random();
                            List<String> vtitle = <String>[];
                            List<List<String>> voptions = <List<String>>[];
                            List<int> vcorrect = <int>[];
                            List<String> allTitles = const [
                              'answer',
                              'april',
                              'bad',
                              'bandage',
                              'bank',
                              'beautiful',
                              'birthday',
                              'bulb',
                              'bye',
                              'calendar',
                              'cat',
                              'chair',
                              'cheap',
                              'chocolate',
                              'class',
                              'computer',
                              'cycle',
                              'december',
                              'dentist',
                              'dinner',
                              'dog',
                              'dress',
                              'elephant',
                              'fast',
                              'fire',
                              'fish',
                              'forgive',
                              'goodnight',
                              'holiday',
                              'india',
                              'january',
                              'june',
                              'market',
                              'monday',
                              'never',
                              'no',
                              'november',
                              'nurse',
                              'opinion',
                              'pain',
                              'pen',
                              'pencil',
                              'police',
                              'polite',
                              'rat',
                              'rest',
                              'rupee',
                              'safe',
                              'school',
                              'sunday',
                              'tea',
                              'teacher',
                              'thankyou',
                              'thirsty',
                              'today',
                              'tomorrow',
                              'toothbrush',
                              'uncomfortable',
                              'vomiting',
                              'wallet',
                              'washroom',
                              'water',
                              'what',
                              'which',
                              'yes'
                            ];
                            vtitle = List.of(allTitles)..shuffle();
                            vtitle = vtitle.sublist(0, 5);
                            for (String title in vtitle) {
                              List<String> tempOptions = List.of(allTitles)
                                ..shuffle();
                              tempOptions.remove(title);
                              List<String> chosenOptions =
                                  tempOptions.sublist(0, 3);
                              int correctIndex = random.nextInt(4);
                              chosenOptions.insert(correctIndex, title);
                              voptions.add(chosenOptions);
                              vcorrect.add(correctIndex);
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoTestWindow(
                                  videoTitles: vtitle,
                                  options: voptions,
                                  correctAnswers: vcorrect,
                                  onPass: () {
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
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: textPurple,
                                content: const Text(
                                  'Unlock all levels to unlock Random test!',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }
                        
                        },
                        child: const Text(
                          'Random Test',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
  Widget _buildGrid() {
    List<String> categories = [
      "Alphabet",
      "Numbers",
      "Behaviour",
      "Objects",
      "Essentials",
      "Food",
      "Health",
      "Days",
      "Months",
      "Animal",
      "Question",
      "School",
      "Social",
      "Emergency",
      "Finance",
    ];

    return Column(
      children: List.generate(
        (categories.length / 2).ceil(),
        (row) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            2,
            (col) {
              int index = row * 2 + col;
              if (index >= categories.length) return Container();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: GestureDetector(
                  onTap: () {
                    int _unlock = index;
                    int _complete = index + 1;
                    if (_unlock == level || _complete <= level) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LearningScreen(
                            category: categories[index],
                            level: level,
                            deviceHeight: _deviceHeight!,
                            deviceWidth: _deviceWidth!,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: textPurple,
                          content: const Text(
                            'Please clear the Previous level first!',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }
                  },
                  child: Gridletter(
                    letter: categories[index],
                    level: level,
                    unlock: index,
                    complete: index + 1,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget progressBar() {
    double progress = level / 15;
    return Stack(
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
          width: progress * _deviceWidth! * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                skyBlue,
                textPurple,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
