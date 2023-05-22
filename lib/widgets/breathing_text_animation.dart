import 'package:flutter/material.dart';

class BreathingTextAnimation extends StatefulWidget {
  final String text;

  const BreathingTextAnimation({required this.text});

  @override
  _BreathingTextAnimationState createState() => _BreathingTextAnimationState();
}

class _BreathingTextAnimationState extends State<BreathingTextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Create an AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true); // Repeat the animation in reverse

    // Create a CurvedAnimation to add a pulsating effect
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      style: const TextStyle(fontSize: 24.0), // Customize the text style here
      duration: const Duration(milliseconds: 500),
      textAlign: TextAlign.center,
      curve: Curves.easeInOut,
      // Apply scale transformation to the text size
      // based on the animation value
      child: ScaleTransition(
        scale: Tween<double>(begin: 1.0, end: 1.1).animate(_animation),
        child: Text(widget.text),
      ),
    );
  }
}

// Usage:
// Place BreathingTextAnimation widget wherever you want to show the animated text
