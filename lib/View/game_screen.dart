// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/Config/colors.dart';
import 'package:tictactoe/Controller/xo_notifire.dart';
import 'package:tictactoe/View/Utils/xo_container.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final taskState = ref.watch(taskProvider);
    final taskNotifier = ref.read(taskProvider.notifier);

    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text("Tic Tac Toe Game",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "HD",
                  fontSize: 30,
                )),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customContainer(
                    text: "Player X", color: CustomColors().redColor),
                customContainer(
                    text: "Player O", color: CustomColors().yellowColor),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                color: Colors.black,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () {
                        taskNotifier.tapped(index, context);
                      },
                      child: Container(
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            taskState.board[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "HD",
                              fontSize: 35,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            customAnimatedContainer(
              Winner: taskState.winner == "O" || taskState.winner == "X"
                  ? false
                  : taskNotifier.checkDraw() == false
                      ? false
                      : true,
              text: "Turn ${taskState.currentPlayer ? 'O' : 'X'}",
              color: taskState.currentPlayer
                  ? CustomColors().yellowColor
                  : CustomColors().redColor,
            ),
            SizedBox(height: 30),
            customVisibilty(
              visible: taskState.winner == "O" ||
                      taskState.winner == "X" ||
                      taskNotifier.checkDraw() == false
                  ? true
                  : false,
              color: taskState.currentPlayer
                  ? CustomColors().redColor
                  : CustomColors().yellowColor,
              text: taskState.winner == "O" || taskState.winner == "X"
                  ? "Winner is!   ${taskState.winner}"
                  : "Game is Draw :(",
            ),
            SizedBox(height: 30),
            Visibility(
              visible: taskState.winner == "O" ||
                      taskState.winner == "X" ||
                      taskNotifier.checkDraw() == false
                  ? true
                  : false,
              child: SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(CustomColors().blueColor),
                  ),
                  onPressed: () => taskNotifier.reset(context),
                  child: Text(
                    "Play Again",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "HD",
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
