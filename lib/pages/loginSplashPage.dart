import 'package:flutter/material.dart';
import 'package:little_signs/Components/styledText.dart';
import 'package:little_signs/Components/wavingHand.dart';
import 'package:little_signs/colors/appColors.dart';
import 'package:little_signs/pages/homepage.dart';
import 'package:little_signs/pages/tutorialScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginsplashpage extends StatefulWidget {

  @override
  _Loginsplashpage createState() => _Loginsplashpage();
}

class _Loginsplashpage extends State<Loginsplashpage> {
  _Loginsplashpage();

  late double _deviceWidth;
  late double _deviceHeight;
  String name = 'Guest';

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('userName') ?? 'Guest';
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await _loadUserData();
    if (name == 'Guest') {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => Tutorialscreen()),
        );
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: softWhite,
      body: SafeArea(
          child: Center(
              child: SizedBox(
                  width: _deviceWidth * 0.9,
                  height: _deviceHeight * 0.9,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        child: Row(
                          children: [
                            Text("Welcome To",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'SourGummy',
                                  fontSize: 50,
                                  color: textPurple,
                                  fontWeight: FontWeight.bold,
                                )),
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: WavingIcon(
                                wColor: textPurple,
                                wSize: 55,
                              ),
                            ),
                          ],
                        ),
                      ),
                      StyledText(
                        text: "Little Signs",
                        borderColor: Colors.red,
                        primaryColor: softWhite,
                        fsize: 65,
                      ),
                      Container(
                        height: _deviceHeight * .5,
                        width: _deviceWidth * .9,
                        margin: const EdgeInsets.only(top: 30, bottom: 10),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/splashScreen.png"),
                          ),
                        ),
                      ),
                      const Text(
                        "A New Way to Grasp Sign Language",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  )))),
    );
  }
}