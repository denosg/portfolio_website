import 'game_util.dart';

class GameAI {
  static const winScore = 100;
  static const loseScore = -100;
  static const drawScrore = 0;

  int play(List<int> board, int currentPlayer) {
    return _getAIMove(board, currentPlayer).move;
  }

  Move _getAIMove(List<int> board, int currentPlayer) {
    List<int> newBoard;
    Move bestMove = Move(score: -10000, move: -1);

    for (int currentMove = 0; currentMove < board.length; currentMove++) {
      if (!GameUtil.isValidMove(board, currentMove)) continue;
      newBoard = List.from(board);
      newBoard[currentMove] = currentPlayer;
      int newScore = -_getBestScore(
        newBoard,
        GameUtil.togglePlayer(currentPlayer),
      );
      if (newScore > bestMove.score) {
        bestMove.score = newScore;
        bestMove.move = currentMove;
      }
    }

    return bestMove;
  }

  int _getBestScore(List<int> board, int currentPlayer) {
    final winner = GameUtil.checkIfWinnerFound(board);
    if (winner == currentPlayer) {
      return winScore;
    } else if (winner == GameUtil.togglePlayer(currentPlayer)) {
      return loseScore;
    } else if (winner == GameUtil.drawUtil) {
      return drawScrore;
    }
    return _getAIMove(board, currentPlayer).score;
  }
}

class Move {
  int score;
  int move;

  Move({
    required this.score,
    required this.move,
  });
}
