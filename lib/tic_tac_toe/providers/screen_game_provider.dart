import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/tic_tac_toe/pages/home/home_page.dart';

class ScreenGameNotifier extends StateNotifier<Widget> {
  ScreenGameNotifier() : super(const HomePage());

  void setGameScreenWidget(Widget widget) {
    state = widget;
  }

  Widget getGameScreenWidget() {
    return state;
  }
}

final screenGameNotifierProvider =
    StateNotifierProvider<ScreenGameNotifier, Widget>((ref) {
  return ScreenGameNotifier();
});
