import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/ViewModel/GameController/game_Controller.dart';
import 'package:tictactoe/ViewModel/GameController/timer_Controller.dart';
import '../Colors/app_Colors.dart';
import '../TextStyle/text_Styles.dart';

class CustomTimer extends StatefulWidget {
  const CustomTimer({super.key});
  @override
  State<CustomTimer> createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timerController.startTimer();
  }

  GameController gameController = Get.put(GameController());
  TimerController timerController = Get.put(TimerController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => gameController.isStart.value
          ? SizedBox(
              height: 100,
              width: 100,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: 1 -
                        timerController.seconds / timerController.maxSeconds,
                    valueColor: const AlwaysStoppedAnimation(Colors.red),
                    strokeWidth: 8,
                    backgroundColor: AppColors.primaryColor,
                  ),
                  Center(
                    child: Text(
                      '${timerController.seconds}',
                      style: AppTextStyles.whiteFontStyle(30),
                    ),
                  )
                ],
              ),
            )
          : GestureDetector(
              onTap: () {
                timerController.startTimer();
                gameController.startGame();
                gameController.clearBoard();
              },
              child: Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Play Again',
                    style: AppTextStyles.blackFontStyle(13),
                  ),
                ),
              ),
            ),
    );
  }
}
