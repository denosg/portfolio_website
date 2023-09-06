import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/widgets/roulette.dart';

import '../../tic_tac_toe/providers/screen_game_provider.dart';

class GamesScreen extends ConsumerWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = MediaQuery.of(context).size;

    final ticTacToeScreen = ref.watch(screenGameNotifierProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const RouletteScreen(fontSize: 25),
        AnimatedSwitcher(
          duration: const Duration(
              milliseconds: 500), // Adjust the duration as needed
          child: SizedBox(
            key: ValueKey<int>(
                ticTacToeScreen.hashCode), // Use a ValueKey to identify changes
            height: deviceSize.height * 0.6,
            width: deviceSize.width * 0.25,
            child: ticTacToeScreen,
          ),
        ),
      ],
    );
  }
}
