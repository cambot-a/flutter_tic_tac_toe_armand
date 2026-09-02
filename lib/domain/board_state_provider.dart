import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/game_state.dart';

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
  /// Does nothing if [index] is out of range or already occupied.
  void applyPlayerMove(int index) {
    if (index < 0 || index >= state.boardData.length) return;
    if (state.boardData[index] != ' ') return;

    final cells = state.boardData.split('');
    cells[index] = state.currentPlayer ? 'X' : 'O';

    state = state.copyWith(
      boardData: cells.join(),
      currentPlayer: !state.currentPlayer,
    );
  }
}
