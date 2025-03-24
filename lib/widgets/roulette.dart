import 'dart:math';
import 'package:flutter/material.dart';
import 'package:roulette/roulette.dart';
import 'package:url_launcher/url_launcher.dart' as url;

import './arrow_roulette.dart';

class MyRoulette extends StatelessWidget {
  final double fontSize;
  final RouletteController controller;

  const MyRoulette({
    super.key,
    required this.controller,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final group = RouletteGroup.uniform(
      2,
      textBuilder: (index) => index == 0 ? "Yes" : "No",
      colorBuilder: (index) => index == 0 ? Colors.blue : Colors.orange,
    );
    return Column(
      children: [
        Text(
          "Should we collaborate with Denis?",
          style: TextStyle(fontSize: fontSize),
        ),
        const SizedBox(height: 10),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              width: 260,
              height: 260,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Roulette(
                  group: group,
                  controller: controller,
                  style: const RouletteStyle(
                    dividerThickness: 4,
                    textLayoutBias: .8,
                    centerStickerColor: Colors.white,
                  ),
                ),
              ),
            ),
            const ArrowItem(),
          ],
        ),
      ],
    );
  }
}

class RouletteScreen extends StatefulWidget {
  final double fontSize;

  const RouletteScreen({super.key, required this.fontSize});

  @override
  State<RouletteScreen> createState() => _RouletteScreenState();
}

class _RouletteScreenState extends State<RouletteScreen> {
  static final _random = Random();
  late RouletteController _controller;

  @override
  void initState() {
    super.initState();
    _controller = RouletteController();
  }

  void openLink(String stringUrl) async {
    final openUrl = Uri.parse(stringUrl);

    if (await url.canLaunchUrl(openUrl)) {
      await url.launchUrl(openUrl);
    } else {
      throw 'Could not launch $openUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          MyRoulette(
            controller: _controller,
            fontSize: widget.fontSize,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await _controller.rollTo(0, offset: _random.nextDouble());
              await Future.delayed(const Duration(milliseconds: 700));
              openLink(
                "https://github.com/denosg/resume-host/blob/main/cv_costelas_denis.pdf",
              );
            },
            child: const Text("SPIN THE WHEEL!"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
