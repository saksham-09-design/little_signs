import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StyledText extends StatelessWidget {
  late Color _borderColor;
  late Color _primaryColor;
  late String _text;
  late double _fsize;

  StyledText(
      {required String text,
      required Color borderColor,
      required Color primaryColor,
      required double fsize}) {
    _borderColor = borderColor;
    _primaryColor = primaryColor;
    _text = text;
    _fsize = fsize;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          _text,
          style: TextStyle(
            fontSize: _fsize,
            fontWeight: FontWeight.bold,
            fontFamily: 'SourGummy',
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 10
              ..color = _borderColor,
          ),
        ),
        Text(
          _text,
          style: TextStyle(
            fontSize: _fsize,
            fontFamily: 'SourGummy',
            fontWeight: FontWeight.bold,
            color: _primaryColor,
          ),
        ),
      ],
    );
  }
}
