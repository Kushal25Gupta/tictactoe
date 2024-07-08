import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/Resources/Colors/app_Colors.dart';
import 'package:tictactoe/Resources/Components/timer.dart';
import 'package:tictactoe/Resources/TextStyle/text_Styles.dart';
import 'package:tictactoe/ViewModel/GameController/game_Controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GameController gameController = Get.put(GameController());

  Widget playerCard(String name, int score) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: AppTextStyles.whiteFontTextStyle,
        ),
        const SizedBox(height: 15),
        Text(
          '$score',
          style: AppTextStyles.whiteFontTextStyle,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  playerCard('Player X', gameController.playerXScore.value),
                  playerCard('Player O', gameController.playerOScore.value),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [Colors.grey.shade800, Colors.black],
                    radius: 0.85,
                    focal: Alignment.center,
                  ),
                ),
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        if (gameController.isStart.value) {
                          gameController.tapped(index);
                        }
                      },
                      child: Container(
                        color: AppColors.secondaryColor,
                        child: Center(
                          child: Obx(
                            () => Text(
                              gameController.displayXO[index],
                              style: const TextStyle(
                                fontSize: 40,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              buildWinnerText(),
              CustomTimer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWinnerText() {
    return Obx(
      () => gameController.isStart.value
          ? Text(
              'TIC TAC TOE',
              style: AppTextStyles.whiteFontTextStyle,
            )
          : gameController.winnerName.isNotEmpty
              ? _showWinner()
              : Text(
                  'TIC TAC TOE',
                  style: AppTextStyles.whiteFontTextStyle,
                ),
    );
  }

  Widget _showWinner() {
    return Obx(
      () => gameController.winnerName.value == 'draw'
          ? Text(
              'Draw',
              style: AppTextStyles.whiteFontTextStyle,
            )
          : Text(
              'Player ${gameController.winnerName.value.toUpperCase()} wins!',
              style: AppTextStyles.whiteFontTextStyle,
            ),
    );
  }
}
