import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/widgets/roulette.dart';

import '../../tic_tac_toe/providers/screen_game_provider.dart';

class GamesScreenMob extends ConsumerStatefulWidget {
  const GamesScreenMob({super.key});

  @override
  ConsumerState<GamesScreenMob> createState() => _GamesScreenMobState();
}

class _GamesScreenMobState extends ConsumerState<GamesScreenMob> {
  final controller = CarouselSliderController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    final ticTacToeScreen = ref.watch(screenGameNotifierProvider);

    return Column(
      children: [
        // games
        SizedBox(
          height: 370,
          width: double.infinity,
          child: CarouselSlider(
            items: [
              const RouletteScreen(fontSize: 18),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  key: ValueKey<int>(ticTacToeScreen.hashCode),
                  height: deviceSize.height * 0.6,
                  child: ticTacToeScreen,
                ),
              ),
            ],
            carouselController: controller,
            options: CarouselOptions(
              viewportFraction: 1,
              aspectRatio: 0.5,
              enlargeCenterPage: true,
            ),
          ),
        ),
        // show to slide drq
        IconButton(
          icon: const Icon(
            Icons.compare_arrows_rounded,
            size: 30,
          ),
          onPressed: () {
            if (currentPageIndex == 0) {
              controller.nextPage();
              setState(() {
                currentPageIndex = 1;
              });
            }
            controller.previousPage();
            setState(() {
              currentPageIndex = 0;
            });
          },
        )
      ],
    );
  }
}
