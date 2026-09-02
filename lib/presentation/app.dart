import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './game_page.dart';

/// The root widget of the application.
///
/// Wraps [MaterialApp] and hosts [GamePage] as the home screen.
class MyApp extends ConsumerWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const GamePage(),
    );
  }
}
