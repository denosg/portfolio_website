import 'package:flutter_riverpod/flutter_riverpod.dart';

class TasksDimNotif extends StateNotifier<double> {
  TasksDimNotif() : super(150);

  void setDim(double dimension) {
    state = dimension;
  }

  void reset() {
    state = 150;
  }
}

final tasksDimProv = StateNotifierProvider<TasksDimNotif, double>(
  (ref) => TasksDimNotif(),
);
