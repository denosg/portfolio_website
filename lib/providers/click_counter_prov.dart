import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClickCounterNotif extends StateNotifier<int> {
  ClickCounterNotif() : super(0);

  void addClick() {
    state = state++;
  }

  void reset() {
    state = 0;
  }
}

final clickCounterProv = StateNotifierProvider<ClickCounterNotif, int>(
  (ref) => ClickCounterNotif(),
);
