import 'dart:io';

import 'package:dart_static_example/game_logic.dart';

void main() {
  final inputHandler = InputHandler();
  inputHandler.formatInput("Hello World!");
  inputHandler.formatInput("Hello World!");
  inputHandler.formatInput("Hello World!");
  inputHandler.formatInput("Hello World!");
  print(GameLogic.instance.results.length);

  GameLogic.instance.createNewGame();
  inputHandler.formatInput("This is a new game!");
  inputHandler.formatInput("This is a new game!");
  print(GameLogic.instance.results.length);
}

class InputHandler {
  void formatInput(String raw) {
    final formattedInput = raw.codeUnits;
    GameLogic.instance.addInput(formattedInput);
  }
}
