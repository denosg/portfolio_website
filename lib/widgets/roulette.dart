import 'dart:math';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:roulette/roulette.dart';
import 'package:url_launcher/url_launcher.dart' as url;

import './arrow_roulette.dart';

class MyRoulette extends StatelessWidget {
  final double fontSize;

  const MyRoulette({
    Key? key,
    required this.controller,
    required this.fontSize,
  }) : super(key: key);

  final RouletteController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Should we collaborate with Denis ?",
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
                  // Provide controller to update its state
                  controller: controller,
                  // Configure roulette's appearance
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

class _RouletteScreenState extends State<RouletteScreen>
    with SingleTickerProviderStateMixin {
  static final _random = Random();

  late RouletteController _controller;

  @override
  void initState() {
    // Initialize the controller
    final group = RouletteGroup([
      const RouletteUnit.text(
        "yes",
        color: Colors.blue,
        weight: 0.5,
      ),
      const RouletteUnit.text(
        "no",
        color: Colors.orange,
        weight: 0.5,
      ),
    ]);
    _controller = RouletteController(vsync: this, group: group);
    super.initState();
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
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                await _controller.rollTo(0, offset: _random.nextDouble());
                await Future.delayed(const Duration(milliseconds: 700));
                openLink(
                    "https://github.com/denosg/resume-host/blob/main/CV%20Denis%20Costelas.pdf");
              },
              child: const Text("LET'S GET READY TO RUMBLEEE")),
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
