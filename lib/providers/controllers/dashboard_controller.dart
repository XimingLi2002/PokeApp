import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardController extends StateNotifier<int> {
  DashboardController(super.state);

  void setPosition(int value) {
    state = value;
  }

  void resetPosition(){
    state = 0;
  }
}
