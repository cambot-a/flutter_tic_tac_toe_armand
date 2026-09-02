import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/board_state_provider.dart';

/// The main page of the game.
///
/// Listens to changes from [BoardStateProvider].
class GamePage extends ConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boardState = ref.watch(boardStateProvider);
    final boardStateNotifier = ref.read(boardStateProvider.notifier);

    final String statusMessage;
    if (boardState.winner != null) {
      statusMessage = '${boardState.winner} wins!';
    } else if (boardState.isStale) {
      statusMessage = "It's a draw!";
    } else {
      statusMessage = "${boardState.currentPlayer ? 'X' : 'O'}'s turn";
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              statusMessage,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400, maxHeight: 400),
              child: AspectRatio(
                aspectRatio: 1,
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: boardState.boardData.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    final cell = boardState.boardData[index];
                    return GestureDetector(
                      onTap: () => boardStateNotifier.applyPlayerMove(index),
                      child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        alignment: Alignment.center,
                        child: Text(cell, style: const TextStyle(fontSize: 32)),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: boardStateNotifier.reset,
      ),
    );
  }
}
