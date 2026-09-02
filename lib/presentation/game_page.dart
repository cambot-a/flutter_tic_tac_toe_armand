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

    return Scaffold(
      // []
    );
  }
}
