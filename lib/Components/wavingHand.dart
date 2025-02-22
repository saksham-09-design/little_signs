import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WavingIcon extends StatefulWidget {
  Color? waveColor;
  double? waveSize;

  WavingIcon({super.key, Color? wColor, double? wSize}) {
    waveColor = wColor;
    waveSize = wSize;
  }

  @override
  // ignore: no_logic_in_create_state
  State<WavingIcon> createState() =>
      _WavingIconState(color: waveColor!, size: waveSize!);
}

class _WavingIconState extends State<WavingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Color? waveColor;
  double? waveSize;

  _WavingIconState({required Color color, required double size}) {
    waveColor = color;
    waveSize = size;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animation.value * -0.3,
          child: Icon(
            const IconData(0xf03b5, fontFamily: 'MaterialIcons'),
            color: waveColor,
            size: waveSize,
          ),
        );
      },
    );
  }
}
