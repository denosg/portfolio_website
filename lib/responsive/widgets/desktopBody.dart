import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/fading_text_animation.dart';
import '/widgets/info_widget.dart';

class DesktopBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // info column
                  InfoWidget(),
                  // Image with me
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'pozaCuMnLow.jpg',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              const FadingTextAnimation(
                  text: "Anything is easy if you do what has to be done."),
            ],
          ),
        ),
      ),
    );
  }
}
