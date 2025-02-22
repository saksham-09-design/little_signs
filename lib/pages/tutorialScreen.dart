import 'package:flutter/material.dart';
import 'package:little_signs/colors/appColors.dart';
import 'package:little_signs/pages/loginScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Tutorialscreen extends StatefulWidget {
  const Tutorialscreen({Key? key}) : super(key: key);

  @override
  _TutorialscreenState createState() => _TutorialscreenState();
}

class _TutorialscreenState extends State<Tutorialscreen> {
  _TutorialscreenState();

  double? _deviceheight;
  double? _devicewidth;
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _deviceheight = MediaQuery.of(context).size.height;
    _devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              _buildPage(
                imagePath: "assets/images/tutorial1.png",
                text: "An interactive way to Learn\nIndian Sign Language",
              ),
              _buildPage(
                imagePath: "assets/images/tutorial2.png",
                text:
                    "Track your progress as you move ahead in your\nLearning Journey",
                backgroundColor: softWhite,
              ),
              _buildPage(
                imagePath: "assets/images/tutorial3.png",
                text: "250+\nWords",
                backgroundColor: softYellow,
              ),
              _buildPage(
                imagePath: "assets/images/tutorial4.png",
                text: "15+ Tests",
                backgroundColor: softWhite,
              ),
              _buildLastPage(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 5,
                effect: const SwapEffect(activeDotColor: Colors.blue),
              ),
            ),
          ),
          Positioned(
            bottom: 32,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildRoundedButton(
                  icon: Icons.arrow_back,
                  onPressed: _currentPage == 0
                      ? null
                      : () {
                          _controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                  isEnabled: _currentPage != 0,
                ),
                _buildRoundedButton(
                  icon: Icons.arrow_forward,
                  onPressed: _currentPage == 4
                      ? null
                      : () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                  isEnabled: _currentPage != 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildPage(
      {required String imagePath,
      required String text,
      Color backgroundColor = Colors.white}) {
    return Container(
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: _deviceheight! * 0.2,
          ),
          Container(
            height: _deviceheight! * 0.3,
            width: _devicewidth! * 0.9,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(imagePath),
              ),
            ),
          ),
          SizedBox(
            height: _deviceheight! * 0.1,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              textAlign: TextAlign.center,
              text,
              style: TextStyle(
                color: textPurple,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: "SourGummy",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLastPage() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: _deviceheight! * 0.1,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              textAlign: TextAlign.center,
              "Let's Begin!",
              style: TextStyle(
                color: textPurple,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontFamily: "SourGummy",
              ),
            ),
          ),
          SizedBox(
            height: _deviceheight! * 0.05,
          ),
          Container(
            height: _deviceheight! * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage("assets/images/tutorial5.png"),
              ),
            ),
          ),
          SizedBox(
            height: _deviceheight! * 0.03,
          ),
          ElevatedButton(
            style: ButtonStyle(
              padding: const WidgetStatePropertyAll(
                  EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10)),
              elevation: const WidgetStatePropertyAll(5),
              backgroundColor: WidgetStatePropertyAll(textPurple),
              side: const WidgetStatePropertyAll(
                BorderSide(color: Colors.white, width: 2),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
                (route) => false,
              );
            },
            child: const Text(
              'Let\'s Begin',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoundedButton(
      {required IconData icon,
      required VoidCallback? onPressed,
      bool isEnabled = true}) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: onPressed,
      backgroundColor:
          isEnabled ? textPurple : Colors.grey, // Disable by changing color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
