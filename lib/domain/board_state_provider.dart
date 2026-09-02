import 'dart:developer' as developer;

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

  void applyPlayerMove(int index) {
    developer.log('Player move at index $index', name: 'BoardStateProvider');
  }
}
