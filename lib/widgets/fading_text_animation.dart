import 'package:flutter/material.dart';

class FadingTextAnimation extends StatefulWidget {
  final String text;

  const FadingTextAnimation({required this.text});

  @override
  _FadingTextAnimationState createState() => _FadingTextAnimationState();
}

class _FadingTextAnimationState extends State<FadingTextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Create an AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true); // Repeat the animation in reverse

    // Create a CurvedAnimation to add a fading effect
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
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: Text(
            widget.text,
            style: const TextStyle(fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}

// Usage:
// Place FadingTextAnimation widget wherever you want to show the animated text
