class GameUtil {
  static const playerOne = 1;
  static const playerTwo = -1;

  static const drawUtil = 2;
  static const noWinnerYetUtil = 0;
  static const emptyUtil = 0;

  static const winConditionsList = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  static int togglePlayer(int currentPlayer) {
    return -1 * currentPlayer;
  }

  static bool isValidMove(List<int> board, int idx) => board[idx] == emptyUtil;

  static int checkIfWinnerFound(List<int> board) {
    for (var list in winConditionsList) {
      if (board[list[0]] != emptyUtil &&
          board[list[0]] == board[list[1]] &&
          board[list[0]] == board[list[2]]) {
        return board[list[0]];
      }
    }
    if (isBoardFull(board)) {
      return drawUtil;
    }
    return noWinnerYetUtil;
  }

  static bool isBoardFull(List<int> board) {
    for (var value in board) {
      if (value == emptyUtil) return false;
    }
    return true;
  }
}
