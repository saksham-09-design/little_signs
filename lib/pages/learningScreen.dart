import 'package:flutter/material.dart';
import 'package:little_signs/Components/ImageTestComponent.dart';
import 'package:little_signs/Components/VideoTestComponent.dart';
import 'package:little_signs/Components/imageComponent.dart';
import 'package:little_signs/Components/styledText.dart';
import 'package:little_signs/Components/videoPlayer.dart';
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
      case "Behaviour":
        final title1 = [
          'Angry',
          'Bad',
          'Beautiful',
          'Best',
          'Big',
          'Calm',
          'Cute',
          'Dark',
          'Discipline',
          'Disrespect',
          'Favourite',
          'Fear',
          'Happy',
          'Jealous',
          'Like',
          'Love',
          'Nice',
          'Pain',
          'Please',
          'Polite',
          'Request',
          'Rude',
          'Sad',
          'ThankYou',
          'Trust',
          'Weak'
        ];
        return _learningScreenMain(pTitle: title1, context: context);
      case "Objects":
        final title2 = [
          'Bulb',
          'Calander',
          'Candle',
          'Car',
          'Chair',
          'Clock',
          'Cycle',
          'Fire',
          'Knife',
          'Lock',
          'Taxi',
          'Tie',
          'Umbrella'
        ];
        return _learningScreenMain(pTitle: title2, context: context);
      case "Essentials":
        final title3 = [
          'Bag',
          'Bathroom',
          'Call',
          'Change',
          'Cold',
          'Colour',
          'Computer',
          'Dress',
          'Easy',
          'Electricity',
          'Find',
          'Finish',
          'Games',
          'Gift',
          'Give',
          'Go',
          'God',
          'India',
          'Life',
          'Light',
          'Market',
          'Name',
          'Open',
          'Rest',
          'Salwar',
          'Shirt',
          'Sleep',
          'Stop',
          'Village',
          'Wait',
          'WakeUp',
          'Walk',
          'Wedding',
          'Wet',
          'Window',
          'Work',
          'Wound'
        ];
        return _learningScreenMain(pTitle: title3, context: context);
      case "Food":
        final title = [
          'Apple',
          'Butter',
          'Capsicum',
          'Carrot',
          'Chocolate',
          'Coconut',
          'Curd',
          'Dinner',
          'Egg',
          'IceCream',
          'Kitchen',
          'Lunch',
          'Mango',
          'Pizza',
          'Plate',
          'Rasgula',
          'Rice',
          'Salt',
          'Samosa',
          'Sandwich',
          'Spoon',
          'Tea',
          'Thristy',
          'Vegetables',
          'Water'
        ];
        return _learningScreenMain(pTitle: title, context: context);
      case "Health":
        final title4 = [
          'Bandage',
          'Dentist',
          'SanitaryPad',
          'Toothbrush',
          'Vomiting',
          'Washroom'
        ];
        return _learningScreenMain(pTitle: title4, context: context);
      case "Days":
        final title5 = [
          'Friday',
          'Holiday',
          'Monday',
          'Saturday',
          'Sunday',
          'Thursday',
          'Today',
          'Tomorrow',
          'Tuesday',
          'Wednesday',
          'Yesterday'
        ];
        return _learningScreenMain(pTitle: title5, context: context);
      case "Months":
        final title6 = [
          'April',
          'August',
          'December',
          'February',
          'January',
          'July',
          'June',
          'March',
          'May',
          'November',
          'October'
        ];
        return _learningScreenMain(pTitle: title6, context: context);
      case "Animal":
        final title7 = [
          'Camel',
          'Cat',
          'Cow',
          'Dog',
          'Donkey',
          'Eagle',
          'Elephant',
          'Fish',
          'Rat'
        ];
        return _learningScreenMain(pTitle: title7, context: context);
      case "Question":
        final title8 = [
          'Answer',
          'Correct',
          'Doubt',
          'Mistake',
          'No',
          'Question',
          'Reason',
          'What',
          'Where',
          'Which',
          'Wrong',
          'Yes'
        ];
        return _learningScreenMain(pTitle: title8, context: context);
      case "Social":
        final title9 = [
          'Birthday',
          'Bye',
          'Dance',
          'Daughter',
          'Evening',
          'Family',
          'Father',
          'Female',
          'Forget',
          'Forgive',
          'Friend',
          'Girl',
          'GoodMorning',
          'GoodNight',
          'Government',
          'Granddaughter',
          'Grandfather',
          'Grandmother',
          'Grandson',
          'He',
          'Know',
          'Man',
          'Mother',
          'My',
          'Myself',
          'Namaste',
          'Neighbour',
          'Okay',
          'Parents',
          'People',
          'Private',
          'Self',
          'Son',
          'Uncle',
          'Uncomfortable',
          'We',
          'Wife',
          'Woman',
          'YoungerBrother',
          'YoungerSister'
        ];
        return _learningScreenMain(pTitle: title9, context: context);
      case "Emergency":
        final title10 = [
          'BodyPain',
          'Emergency',
          'Fast',
          'Never',
          'Nurse',
          'Police',
          'Safe'
        ];
        return _learningScreenMain(pTitle: title10, context: context);
      case "Finance":
        final title11 = [
          'Bank',
          'Calculator',
          'Cheap',
          'Cost',
          'Demand',
          'Money',
          'Opinion',
          'Wallet'
        ];
        return _learningScreenMain(pTitle: title11, context: context);
      case "School":
        final title12 = [
          'Class',
          'Paper',
          'Pen',
          'Pencil',
          'Play',
          'Principal',
          'Qualification',
          'School',
          'Student',
          'Teacher',
          'Team',
          'Write'
        ];
        return _learningScreenMain(pTitle: title12, context: context);
      case "Sentences":
        final title13 = [
          'Class',
          'Paper',
          'Pen',
          'Pencil',
          'Play',
          'Principal',
          'Qualification',
          'School',
          'Student',
          'Teacher',
          'Team',
          'Write'
        ];
        return _learningScreenMain(pTitle: title13, context: context);
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

  Widget _learningScreenMain({required pTitle, required context}) {
    final titles = pTitle;
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
                  child: VideoPlayerComponent(titles: titles),
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
                    List<String> vtitle = <String>[];
                    List<List<String>> voptions = <List<String>>[];
                    List<int> vcorrect = <int>[];
                    int levelu = 0;
                    if (category == 'Animal') {
                      vtitle = const ['cat', 'dog', 'rat', 'elephant', 'fish'];
                      voptions = const [
                        ['Dog', 'Elephant', 'Mouse', 'Cat'],
                        ['Cow', 'Zebra', 'Dog', 'Camel'],
                        ['Rat', 'Elephant', 'Fish', 'Cow'],
                        ['Elephant', 'Monkey', 'Cat', 'Dog'],
                        ['Rat', 'Fish', 'Dog', 'Monkey']
                      ];
                      vcorrect = const [3, 2, 0, 0, 1];
                      levelu = 10;
                    } else if (category == 'Behaviour') {
                      vtitle = const [
                        'bad',
                        'beautiful',
                        'pain',
                        'polite',
                        'thankyou'
                      ];
                      voptions = const [
                        ['Good', 'Bad', 'Worst', 'Happy'],
                        ['Beautiful', 'Cute', 'Feel', 'Ugly'],
                        ['Ego', 'Pain', 'Sad', 'Bad'],
                        ['Polite', 'Silent', 'Rough', 'Anger'],
                        ['Sorry', 'Sad', 'Thank You', 'Welcome']
                      ];
                      vcorrect = const [1, 0, 1, 0, 2];
                      levelu = 3;
                    } else if (category == 'Days') {
                      vtitle = const [
                        'holiday',
                        'monday',
                        'sunday',
                        'today',
                        'tomorrow'
                      ];
                      voptions = const [
                        ['Today', 'Tomorrow', 'Holiday', 'Sunday'],
                        ['Monday', 'Tuesday', 'Wednesday', 'Thursday'],
                        ['Monday', 'Sunday', 'Wednesday', 'Holiday'],
                        ['Tomorrow', 'Today', 'Saturday', 'Holiday'],
                        ['Yesterday', 'Tomorrow', 'Monday', 'Saturday']
                      ];
                      vcorrect = const [2, 0, 1, 1, 1];
                      levelu = 8;
                    } else if (category == 'Finance') {
                      vtitle = const [
                        'bank',
                        'cheap',
                        'opinion',
                        'rupee',
                        'wallet'
                      ];
                      voptions = const [
                        ['Wallet', 'Rupee', 'Bank', 'Calculator'],
                        ['Cheap', 'Money', 'Economy', 'Opinion'],
                        ['Opinion', 'Rupee', 'Demand', 'Credit'],
                        ['Money', 'Rupee', 'Cash', 'Bank'],
                        ['Wallet', 'Calculator', 'Supply', 'Economy']
                      ];
                      vcorrect = const [2, 0, 0, 1, 0];
                      levelu = 15;
                    } else if (category == 'Essentials') {
                      vtitle = const [
                        'computer',
                        'dress',
                        'india',
                        'market',
                        'rest'
                      ];
                      voptions = const [
                        ['Calculator', 'Question', 'Computer', 'Remote'],
                        ['Clothes', 'Dress', 'Shoe', 'Happy'],
                        ['India', 'Country', 'City', 'Computer'],
                        ['Market', 'Pen', 'Shop', 'World'],
                        ['Pain', 'Rest', 'Yes', 'Tired']
                      ];
                      vcorrect = const [2, 1, 0, 0, 1];
                      levelu = 5;
                    } else if (category == 'Food') {
                      vtitle = const [
                        'chocolate',
                        'dinner',
                        'tea',
                        'thirsty',
                        'water'
                      ];
                      voptions = const [
                        ['Rasogulla', 'Candy', 'Chocolate', 'Chapati'],
                        ['Dinner', 'Lunch', 'Food', 'Break Fast'],
                        ['Coffee', 'Tea', 'Juice', 'Mango'],
                        ['Thirsty', 'Water', 'Juice', 'Orange'],
                        ['Water', 'Lemon', 'Mango', 'Apple']
                      ];
                      vcorrect = const [2, 0, 1, 0, 0];
                      levelu = 6;
                    } else if (category == 'Health') {
                      vtitle = const [
                        'bandage',
                        'dentist',
                        'toothbrush',
                        'vomiting',
                        'washroom'
                      ];
                      voptions = const [
                        ['Doctor', 'Bandage', 'Injection', 'Wound'],
                        ['Doctor', 'Dentist', 'Nurse', 'Hospital'],
                        ['Toothbrush', 'Toothpaste', 'Washroom', 'Bath'],
                        ['Anxiety', 'Vomitting', 'Cold', 'Cough'],
                        ['Bath', 'Room', 'Toothbrush', 'Washroom']
                      ];
                      vcorrect = const [1, 1, 0, 1, 3];
                      levelu = 7;
                    } else if (category == 'Months') {
                      vtitle = const [
                        'april',
                        'december',
                        'january',
                        'june',
                        'november'
                      ];
                      voptions = const [
                        ['January', 'May', 'March', 'April'],
                        ['November', 'March', 'July', 'December'],
                        ['January', 'February', 'March', 'May'],
                        ['July', 'June', 'April', 'May'],
                        ['December', 'October', 'November', 'August']
                      ];
                      vcorrect = const [3, 3, 0, 1, 2];
                      levelu = 9;
                    } else if (category == 'Objects') {
                      vtitle = const [
                        'bulb',
                        'calendar',
                        'chair',
                        'cycle',
                        'fire'
                      ];
                      voptions = const [
                        ['Light', 'Bulb', 'Torch', 'Heat'],
                        ['Day', 'Calendar', 'Date', 'Month'],
                        ['Table', 'Wood', 'Chair', 'Couch'],
                        ['Motorcycle', 'Bus', 'Train', 'Cycle'],
                        ['Cold', 'Forest', 'Heat', 'Fire']
                      ];
                      vcorrect = const [1, 1, 2, 3, 3];
                      levelu = 4;
                    } else if (category == 'Question') {
                      vtitle = const ['answer', 'no', 'what', 'which', 'yes'];
                      voptions = const [
                        ['Question', 'Answer', 'What', 'When'],
                        ['Yes', 'Where', 'No', 'Ok'],
                        ['When', 'Where', 'What', 'Who'],
                        ['When', 'Which', 'No', 'Whose'],
                        ['Yes', 'No', 'Ok', 'Where']
                      ];
                      vcorrect = const [1, 2, 2, 1, 0];
                      levelu = 11;
                    } else if (category == 'School') {
                      vtitle = const [
                        'class',
                        'pen',
                        'pencil',
                        'school',
                        'teacher'
                      ];
                      voptions = const [
                        ['School', 'Class', 'Student', 'Teacher'],
                        ['Pen', 'Pencil', 'Note book', 'Eraser'],
                        ['Scale', 'Geometry', 'Pencil', 'School'],
                        ['School', 'College', 'University', 'Building'],
                        ['Teacher', 'Student', 'Class', 'Study']
                      ];
                      vcorrect = const [1, 0, 2, 0, 0];
                      levelu = 12;
                    } else if (category == 'Social') {
                      vtitle = const [
                        'birthday',
                        'bye',
                        'forgive',
                        'goodnight',
                        'uncomfortable'
                      ];
                      voptions = const [
                        ['Friends', 'Birthday', 'Play', 'Enjoy'],
                        ['Hello', 'Hi', 'Bye', 'Nice'],
                        ['Polite', 'Forgive', 'Mistake', 'Good'],
                        [
                          'Good Morning',
                          'Good Afternoon',
                          'Good Night',
                          'Good Evening'
                        ],
                        ['Comfortable', 'Uncomfortable', 'Bad', 'Ignore']
                      ];
                      vcorrect = const [1, 2, 1, 2, 1];
                      levelu = 13;
                    } else if (category == 'Emergency') {
                      vtitle = const [
                        'fast',
                        'never',
                        'nurse',
                        'police',
                        'safe'
                      ];
                      voptions = const [
                        ['Fast', 'Slow', 'Hurry Up!', 'Go'],
                        ['No', 'Never', 'Nothing', 'Nobody'],
                        ['Doctor', 'Dentist', 'Nurse', 'Associate'],
                        ['Army', 'Police', 'Guard', 'Secure'],
                        ['Secure', 'Help', 'Safe', 'Danger']
                      ];
                      vcorrect = const [0, 1, 2, 1, 3];
                      levelu = 14;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoTestWindow(
                          videoTitles: vtitle,
                          options: voptions,
                          correctAnswers: vcorrect,
                          onPass: () {
                            updateUserLevel((level >= levelu) ? level : levelu);
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
