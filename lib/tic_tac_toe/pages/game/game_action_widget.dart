import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/tic_tac_toe/pages/home/home_page.dart';
import 'package:portfolio_website/tic_tac_toe/providers/screen_game_provider.dart';

import '../../controller/game_controller.dart';
import 'package:flutter/material.dart';

class GameActionWidget extends ConsumerWidget {
  final GameController controller;
  const GameActionWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _GameActionButton(
          icon: Icons.refresh,
          onPressed: () {
            controller.reinitialize();
          },
        ),
        _GameActionButton(
          icon: Icons.home,
          onPressed: () async {
            final screenChange = ref.read(screenGameNotifierProvider.notifier);
            screenChange.setGameScreenWidget(const HomePage());
          },
        )
      ],
    );
  }
}

class _GameActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const _GameActionButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
        backgroundColor: Colors.blueGrey.withOpacity(0.8),
        elevation: 0.0,
      ),
      child: Icon(
        icon,
        size: 42.0,
      ),
    );
  }
}
