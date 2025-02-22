import 'package:flutter/material.dart';
import 'package:little_signs/Components/styledText.dart';
import 'package:little_signs/colors/appColors.dart';
import 'package:little_signs/pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<LoginScreen> {
  late double _deviceWidth;
  late double _deviceHeight;


  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
            child: Center(
                child: SizedBox(
                    width: _deviceWidth * 0.9,
                    height: _deviceHeight * 0.9,
                    child: Column(
                      children: [
                        StyledText(
                          text: "Little Signs",
                          borderColor: Colors.red,
                          primaryColor: softWhite,
                          fsize: 65,
                        ),
                        const Text(
                          "Enter Your Name To Start Your Journey.",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30, bottom: 10),
                          child: LoginCard(),
                        ),
                      ],
                    ))))
    );
  }
}
  class LoginCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginCard();
  }
}

class _LoginCard extends State<LoginCard> {
  double? _deviceHeight;
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: _deviceHeight! * 0.29,
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 15),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Welcome',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[700],
            ),
          ),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              prefixIcon: const Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Divider(thickness: 1.2, height: 30),
          //Continue Button
          OutlinedButton(
            onPressed: () {
              String nameTemp = _nameController.text;
              if (nameTemp == "" || nameTemp == " ") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please Enter a Valid Name"),
                  ),
                );
              } else {
                saveUserData(_nameController.text, 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              }
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blueGrey[700],
              side: BorderSide(color: Colors.blueGrey[700]!),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Start Learning!'),
          ),
        ],
      ),
    );
  }

  Future<void> saveUserData(String name, int level) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    await prefs.setInt('userLevel', level);
  }
}
