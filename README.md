# flutter_tic_tac_toe_armand

Simple tic-tac-toe made for beginners and experts alike!

## Getting Started

This project is a starting point for a Flutter application.

```sh
flutter pub get
flutter run
```

## Tech stack

- [Flutter](https://flutter.dev)
- [Riverpod](https://riverpod.dev) for state management

## Project files

### Standard architecture

- `lib/application/` — app-level data models, independent of any UI or state
  management framework. Currently holds `GameState`, the immutable snapshot
  of the board (cells and whose turn it is).
- `lib/domain/` — business logic, exposed as Riverpod providers/notifiers.
  Currently holds `BoardStateProvider`, the `Notifier<GameState>` that owns
  the board and will apply player moves to it.
- `lib/presentation/` — UI widgets that watch the domain providers and render
  them. Currently holds `MyApp` (the app root) and `GamePage` (the board
  screen).

I decided to leave out `lib/data/` for now due to time constraints, since
this version doesn't need it.
I would have added it if for example:
- if I had a Database for online scores storage,
- if i implemented a player login,
- or in-game cosmetics.

## Known gaps

- `test/widget_test.dart` still has the default Flutter counter-app
  boilerplate test and needs to be rewritten for the tic-tac-toe UI.
