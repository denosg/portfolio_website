import 'package:get/get.dart';

import '../game_ai/game_ai.dart';
import '../game_ai/game_util.dart';

class GameController extends GetxController {
  var player1Win = 0.obs;
  var player2Win = 0.obs;
  var draw = 0.obs;

  final bool isMultiPlayer;
  RxList<int> board = List.generate(9, (index) => 0).obs;
  RxInt currentPlayer = GameUtil.playerOne.obs;
  RxInt gameResult = GameUtil.noWinnerYetUtil.obs;
  RxBool isAiPlaying = false.obs;
  GameAI ai = GameAI();

  GameController(this.isMultiPlayer);

  void reinitialize() {
    board.value = List.generate(9, (index) => 0);
    gameResult.value = GameUtil.noWinnerYetUtil;
    currentPlayer.value = GameUtil.playerOne;
  }

  Future<void> move(int idx) async {
    board[idx] = currentPlayer.value;
    checkGameWinner();
    togglePlayer();
    if (!isMultiPlayer && gameResult.value == GameUtil.noWinnerYetUtil) {
      isAiPlaying.value = true;
      await Future.delayed(const Duration(milliseconds: 1400));
      final aiMove = await Future(
        () => ai.play(
          board,
          currentPlayer.value,
        ),
      );
      board[aiMove] = currentPlayer.value;
      isAiPlaying.value = false;
      checkGameWinner();
      togglePlayer();
    }
  }

  bool isEnable(int idx) => board[idx] == GameUtil.emptyUtil;

  int getDataAt(int idx) => board[idx];

  void togglePlayer() {
    currentPlayer.value = GameUtil.togglePlayer(currentPlayer.value);
  }

  void checkGameWinner() {
    gameResult.value = GameUtil.checkIfWinnerFound(board);
    switch (gameResult.value) {
      case GameUtil.playerOne:
        player1Win++;
        break;
      case GameUtil.playerTwo:
        player2Win++;
        break;
      case GameUtil.drawUtil:
        draw++;
        break;
    }
  }

  String? get currentPlayerMove {
    if (currentPlayer.value == GameUtil.playerOne) {
      return "Your move";
    } else if (currentPlayer.value == GameUtil.playerTwo) {
      return "Denis's move";
    }
    return null;
  }

  String? get gameResultStatus {
    final findGameResult = gameResult.value;
    if (findGameResult != GameUtil.noWinnerYetUtil) {
      if (findGameResult == GameUtil.playerOne) {
        return "You won !";
      } else if (findGameResult == GameUtil.playerTwo) {
        return "Denis won !";
      } else if (findGameResult == GameUtil.drawUtil) {
        return "Draw";
      }
    }
    return null;
  }
}
