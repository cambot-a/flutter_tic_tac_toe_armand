/// All the tic-tac-toe board data.
class GameState {
  /// Creates a game state from explicit board data.
  const GameState({
    required this.boardData,
    required this.currentPlayer,
    required this.isStale,
  });

  /// The starting state: an empty board with player X to move first.
  factory GameState.initial() => const GameState(
        boardData: '         ', // 9 blank cells
        currentPlayer: true, // true = X's turn, false = O's turn
        isStale: false,
      );

  /// The 9 cells of the board, encoded as a string (e.g. `'X O   X  '`).
  final String boardData;

  /// Whether it is X's turn to move. `false` means it's O's turn.
  final bool currentPlayer;

  /// Whether the board is full with no winner (a draw).
  final bool isStale;

  /// Returns a copy of this state with the given fields replaced.
  GameState copyWith({String? boardData, bool? currentPlayer, bool? isStale}) {
    return GameState(
      boardData: boardData ?? this.boardData,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      isStale: isStale ?? this.isStale,
    );
  }
}
