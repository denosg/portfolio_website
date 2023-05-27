import 'dart:math';

import 'package:flutter/material.dart';
import 'package:roulette/roulette.dart';

import './arrow_roulette.dart';

class MyRoulette extends StatelessWidget {
  const MyRoulette({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final RouletteController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Sa colaboram cu Denis ?",
          style: TextStyle(fontSize: 25),
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
            ArrowItem(),
          ],
        ),
      ],
    );
  }
}

class RouletteScreen extends StatefulWidget {
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
        "da",
        color: Color.fromRGBO(96, 125, 139, 1),
        weight: 0.5,
      ),
      const RouletteUnit.text(
        "nu",
        color: Colors.orange,
        weight: 0.5,
      ),
    ]);
    _controller = RouletteController(vsync: this, group: group);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          MyRoulette(controller: _controller),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                await _controller.rollTo(0, offset: _random.nextDouble());
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