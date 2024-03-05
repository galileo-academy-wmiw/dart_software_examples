import 'package:dart_static_example/game_logic.dart';

// The entrypoint of the application.
void main() {

  // Create a new instance of the input handler.
  // Note that since our formatInput function is not static, we need to create an
  // instance of the class to access the function.
  final inputHandler = InputHandler();

  // Add some input to our input handler, we need to access the formatInput function
  // on the input handler from the instance of the InputHandler class. If we made the
  // formatInput function static, we would not need to access the function trough an instance.
  // Then we could just simply call InputHandler.formatInput(<input-value>). The removes the
  // need for creating an instance of the class. This does however come with a couple of drawbacks.
  // Of of for example is modulatiry. If we were to create a function where the developer could specify
  // their own implementation of an InputHandler, we could allow the developer to pass this instance
  // as an parameter of the function. By delaring the function static, we could not use polymorphism
  // to allow the user to create their own implementation by extending the InputHandler class
  inputHandler.formatInput("Hello World!");
  inputHandler.formatInput("Hello World!");
  inputHandler.formatInput("Hello World!");
  inputHandler.formatInput("Hello World!");

  // Since we created a static variable called instance, containing an instance of the GameLogic
  // class, we can access our GameLogic instance by calling GameLogic.instance.
  // This patern is very similar to a singleton, where there can only be 1 active instance of a class
  // at any given time during the runtime. A benefit of this comes with all the benefit of creating
  // instances, but also the fact that the variable is accessible during the entire runtime and
  // from all classes that want to access it.
  print(GameLogic.instance.results.length);

  // One of the benefits of storing the GameLogic as an instance is shown here. Our GameLogic instance
  // contains all the inputs. By calling the static function createNewGame(), we can replace our current
  // instance of the GameLogic class by a new class. Thus removing the need to manualy reset al of our variables
  // for the GameLogic instance.
  GameLogic.createNewGame();

  // To demonstrate that our game logic is reset, we add 2 new inputs to our game logic and print the amount
  // of results to the console. Before this same line would have printed 4, now, it prints 2! 
  inputHandler.formatInput("This is a new game!");
  inputHandler.formatInput("This is a new game!");
  print(GameLogic.instance.results.length);
}

// Define a class to handle our input. This class will function as the interface between
// our input as a string and the input the GameLogic class epects (List<int>).
class InputHandler {
  void formatInput(String raw) {
    final formattedInput = raw.codeUnits;
    GameLogic.instance.addInput(formattedInput);
  }
}
