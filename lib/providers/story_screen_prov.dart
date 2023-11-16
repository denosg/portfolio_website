import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/homepage.dart';

class StoryScreenNotif extends StateNotifier<Widget> {
  StoryScreenNotif() : super(const HomePage());

  void changeScreen(Widget widget) {
    state = widget;
  }

  void reset() {
    state = const HomePage();
  }
}

final storyScreenProv = StateNotifierProvider<StoryScreenNotif, Widget>(
  (ref) => StoryScreenNotif(),
);
