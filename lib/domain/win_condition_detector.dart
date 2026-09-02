/// The 8 index triples that form a winning line on a 3x3 board: 3 rows,
/// 3 columns, and 2 diagonals.
const List<List<int>> _winningLines = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
];

/// Returns the mark (`'X'` or `'O'`) that fills a full row, column, or
/// diagonal of [boardData], or `null` if there is no winner yet.
String? detectWinCondition(String boardData) {
  for (final line in _winningLines) {
    final a = boardData[line[0]];
    final b = boardData[line[1]];
    final c = boardData[line[2]];
    if (a != ' ' && a == b && b == c) {
      return a;
    }
  }
  return null;
}
