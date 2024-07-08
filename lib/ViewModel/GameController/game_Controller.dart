import 'package:get/get.dart';
import '../../Model/PlayersData/player_data.dart';

class GameController extends GetxController {
  bool ohTurn = true;
  int filledBoxes = 0;
  Rx<String> winnerName = ''.obs;
  Rx<bool> isStart = true.obs;
  RxList<String> displayXO = Player.displayXO.obs;
  Rx<int> playerOScore = Player.playerOScore.obs;
  Rx<int> playerXScore = Player.playerXScore.obs;

  void startGame() {
    isStart.value = true;
  }

  void stopGame() {
    isStart.value = false;
  }

  void updateWinner(String newWinner) {
    winnerName.value = newWinner;
  }

  void tapped(int index) {
    if (displayXO[index] == '') {
      if (ohTurn) {
        displayXO[index] = 'o';
      } else {
        displayXO[index] = 'x';
      }
      ohTurn = !ohTurn;
      filledBoxes++;
      checkWinner();
    }
  }

  void checkWinner() {
    // 1st Row
    if (displayXO[0] == displayXO[1] &&
        displayXO[1] == displayXO[2] &&
        displayXO[0] != '') {
      updateWinner(displayXO[0]);
      updateScore();
    }

    // 2nd Row
    else if (displayXO[3] == displayXO[4] &&
        displayXO[4] == displayXO[5] &&
        displayXO[3] != '') {
      updateWinner(displayXO[3]);
      updateScore();
    }

    // 3rd Row
    else if (displayXO[6] == displayXO[7] &&
        displayXO[7] == displayXO[8] &&
        displayXO[6] != '') {
      updateWinner(displayXO[6]);
      updateScore();
    }

    // 1st Column
    else if (displayXO[0] == displayXO[3] &&
        displayXO[3] == displayXO[6] &&
        displayXO[0] != '') {
      updateWinner(displayXO[0]);
      updateScore();
    }

    // 2nd Column
    else if (displayXO[1] == displayXO[4] &&
        displayXO[4] == displayXO[7] &&
        displayXO[1] != '') {
      updateWinner(displayXO[1]);
      updateScore();
    }

    // 3rd Column
    else if (displayXO[2] == displayXO[5] &&
        displayXO[5] == displayXO[8] &&
        displayXO[2] != '') {
      updateWinner(displayXO[2]);
      updateScore();
    }

    // 1st Diagonal
    else if (displayXO[0] == displayXO[4] &&
        displayXO[4] == displayXO[8] &&
        displayXO[0] != '') {
      updateWinner(displayXO[0]);
      updateScore();
    }

    // 2nd Diagonal
    else if (displayXO[2] == displayXO[4] &&
        displayXO[4] == displayXO[6] &&
        displayXO[2] != '') {
      updateWinner(displayXO[2]);
      updateScore();
    } else if (filledBoxes == 9) {
      updateWinner('draw');
      ohTurn = true;
      stopGame();
    }
  }

  void updateScore() {
    stopGame();
    if (winnerName == 'o') {
      playerOScore.value++;
    } else if (winnerName == 'x') {
      playerXScore.value++;
    }
  }

  void clearBoard() {
    filledBoxes = 0;
    for (int i = 0; i < 9; i++) {
      displayXO[i] = '';
    }
  }
}
