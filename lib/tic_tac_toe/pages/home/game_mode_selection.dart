import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/tic_tac_toe/providers/screen_game_provider.dart';

import '../game/game_page.dart';

class GameModeSelectionWidget extends ConsumerWidget {
  const GameModeSelectionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Beat Denis at Tic Tac Toe !",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        GameButtonWidget(
          label: "Let's play !",
          onPressed: () {
            final screenChange = ref.read(screenGameNotifierProvider.notifier);
            screenChange.setGameScreenWidget(const GamePage());
          },
        ),
      ],
    );
  }
}

class GameButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const GameButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromWidth(240.0),
        shape: const StadiumBorder(),
        elevation: 0.0,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),
      child: Text(label),
    );
  }
}
