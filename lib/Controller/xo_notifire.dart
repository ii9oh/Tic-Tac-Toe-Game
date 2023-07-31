import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/Controller/xo_state.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  return TaskNotifier();
});

class TaskNotifier extends StateNotifier<TaskState> {
  TaskNotifier() : super(TaskState.Initial());

  void startGame() {
    firstPlayer();
  }

  void firstPlayer() {
    int start = Random().nextInt(2);
    if (start == 0) {
      state = state.copyWith(currentPlayer: true);
    } else {
      state = state.copyWith(currentPlayer: false);
    }
  }

  bool checkWin() {
    if (state.board[0] == state.board[1] &&
        state.board[0] == state.board[2] &&
        state.board[0] != '') {
      state = state.copyWith(winner: state.board[0]);
      return true;
    } else if (state.board[3] == state.board[4] &&
        state.board[3] == state.board[5] &&
        state.board[3] != '') {
      state = state.copyWith(winner: state.board[3]);
      return true;
    } else if (state.board[6] == state.board[7] &&
        state.board[6] == state.board[8] &&
        state.board[6] != '') {
      state = state.copyWith(winner: state.board[6]);
      return true;
    } else if (state.board[0] == state.board[3] &&
        state.board[0] == state.board[6] &&
        state.board[0] != '') {
      state = state.copyWith(winner: state.board[0]);
      return true;
    } else if (state.board[1] == state.board[4] &&
        state.board[1] == state.board[7] &&
        state.board[1] != '') {
      state = state.copyWith(winner: state.board[1]);
      return true;
    } else if (state.board[2] == state.board[5] &&
        state.board[2] == state.board[8] &&
        state.board[2] != '') {
      state = state.copyWith(winner: state.board[2]);
      return true;
    } else if (state.board[0] == state.board[4] &&
        state.board[0] == state.board[8] &&
        state.board[0] != '') {
      state = state.copyWith(winner: state.board[0]);
      return true;
    } else if (state.board[2] == state.board[4] &&
        state.board[2] == state.board[6] &&
        state.board[2] != '') {
      state = state.copyWith(winner: state.board[2]);
      return true;
    }
    return false;
  }

  void tapped(int index, BuildContext context) {
    if (state.currentPlayer && state.board[index] == '') {
      state.board[index] = 'O';
    } else {
      state.board[index] = 'X';
    }
    checkWin();
    checkDraw();

    state = state.copyWith(currentPlayer: (!state.currentPlayer));
  }

  bool checkDraw() {
    bool A = false;
    for (var element in state.board) {
      if (element.isEmpty) {
        A = true;
      }
    }
    return A;
  }

  void reset(BuildContext context) {
    state = TaskState.Initial();
    firstPlayer();
  }
}
