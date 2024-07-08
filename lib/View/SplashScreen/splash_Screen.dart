import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tictactoe/Resources/Colors/app_Colors.dart';
import 'package:tictactoe/Resources/Routes/routes_names.dart';
import 'package:tictactoe/Resources/TextStyle/text_Styles.dart';
import 'package:tictactoe/ViewModel/GameController/game_Controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  GameController gameController = Get.put(GameController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            children: [
              Text(
                'TIC TAC TOE',
                style: AppTextStyles.whiteFontStyle(height * 0.03),
              ),
              Expanded(
                flex: 2,
                child: AvatarGlow(
                  duration: const Duration(seconds: 2),
                  startDelay: const Duration(seconds: 1),
                  glowColor: Colors.white,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.transparent,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('assets/images/TicTacToeIcon.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                '@CREATEDBYKUSHAL',
                style: AppTextStyles.whiteFontStyle(height * 0.019),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RoutesName.homeScreen);
                  gameController.startGame();
                },
                child: Container(
                  height: 70,
                  margin: const EdgeInsets.only(top: 80),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      'PLAY GAME',
                      style: AppTextStyles.blackFontStyle(13),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
