class TaskState {
  final String winner;
  final List<String> board;
  final bool currentPlayer;

  TaskState({
    required this.winner,
    required this.board,
    required this.currentPlayer,
  });

  factory TaskState.Initial() => TaskState(
        winner: '',
        board: ['', '', '', '', '', '', '', '', ''],
        currentPlayer: false,
      );

  TaskState copyWith({
    String? winner,
    List<String>? board,
    bool? currentPlayer,
  }) {
    return TaskState(
      winner: winner ?? this.winner,
      board: board ?? this.board,
      currentPlayer: currentPlayer ?? this.currentPlayer,
    );
  }
}
