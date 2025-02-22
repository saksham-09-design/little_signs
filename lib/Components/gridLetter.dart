import 'package:flutter/material.dart';
import 'package:little_signs/Components/styledText.dart';
import 'package:little_signs/colors/appColors.dart';

// ignore: must_be_immutable
class Gridletter extends StatefulWidget {
  int? _level;
  String? _letter;
  int? _unlock;
  int? _complete;

  // ignore: use_key_in_widget_constructors
  Gridletter(
      {required level, required letter, required unlock, required complete}) {
    _level = level;
    _letter = letter;
    _unlock = unlock;
    _complete = complete;
  }

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _GridLetter(
        level: _level, letter: _letter, unlock: _unlock, complete: _complete);
  }
}

class _GridLetter extends State<Gridletter> {
  int _level = 1;
  String _letter = "A";
  int _unlock = 2;
  int _complete = 3;
  Color? _backgroundColor;
  IconData? _icon;

  _GridLetter(
      {required level, required letter, required unlock, required complete}) {
    _level = level;
    _letter = letter;
    _unlock = unlock;
    _complete = complete;
  }

  void _setLetterFormats() {
    if (_unlock == _level) {
      _backgroundColor = textPurple;
      _icon = Icons.circle;
    } else if (_complete <= _level) {
      _backgroundColor = bgGreen;
      _icon = Icons.check;
    } else {
      _backgroundColor = Colors.grey;
      _icon = Icons.lock;
    }
  }

  @override
  void initState() {
    super.initState();
    _setLetterFormats();
  }

  double? _deviceHeight;
  double? _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black, style: BorderStyle.solid, width: 2),
              color: _backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            height: _deviceHeight! * 0.1,
            width: _deviceWidth! * 0.35,
          ),
          Container(
            height: _deviceHeight! * 0.1,
            width: _deviceWidth! * 0.35,
            child: Center(
              child: StyledText(
                text: _letter,
                borderColor: Colors.white,
                primaryColor: Colors.black,
                fsize: 22,
              ),
            ),
          ),
          Positioned(
            top: 5.0, // Adjust for spacing
            right: 5.0, // Adjust for spacing
            child: Icon(
              _icon,
              color: Colors.white,
              size: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
