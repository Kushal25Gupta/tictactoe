import 'dart:async';
import 'package:get/get.dart';
import 'package:tictactoe/ViewModel/GameController/game_Controller.dart';

class TimerController extends GetxController {
  RxInt seconds = 30.obs; // Make seconds observable
  Timer? timer;
  int maxSeconds = 30;
  GameController gameController = Get.put(GameController());

  // Your existing startTimer, stopTimer and resetTimer functions
  void startTimer() {
    stopTimer();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => updateTimer(),
    );
  }

  void updateTimer() {
    if (seconds.value > 0) {
      seconds.value--;
    } else {
      stopTimer();
      resetTimer();
      gameController.stopGame();
    }
  }

  void stopTimer() {
    timer?.cancel();
    resetTimer();
  }

  void resetTimer() {
    seconds.value = maxSeconds;
  }
}
