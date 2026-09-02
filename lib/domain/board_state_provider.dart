import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/game_state.dart';
import 'win_condition_detector.dart';

/// The provider that exposes [BoardStateProvider] as the board's source of
/// truth.
final boardStateProvider =
    NotifierProvider<BoardStateProvider, GameState>(BoardStateProvider.new);

/// A Riverpod notifier that tracks the turns played on the board.
class BoardStateProvider extends Notifier<GameState>
{
  @override
  GameState build() => GameState.initial();

  /// Places the current player's mark at [index], then passes the turn to
  /// the other player.
  ///
  /// Does nothing if [index] is out of range, already occupied, or the game
  /// is already over (there is a winner or the board is stale).
  void applyPlayerMove(int index) {
    if (state.winner != null || state.isStale) return;
    if (index < 0 || index >= state.boardData.length) return;
    if (state.boardData[index] != ' ') return;

    final cells = state.boardData.split('');
    cells[index] = state.currentPlayer ? 'X' : 'O';
    final boardData = cells.join();
    final winner = detectWinCondition(boardData);

    state = state.copyWith(
      boardData: boardData,
      currentPlayer: !state.currentPlayer,
      winner: winner,
      isStale: winner == null && !boardData.contains(' '),
    );
  }

  void reset() => state = GameState.initial();
}
