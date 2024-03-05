class GameLogic {
  // Declare a static variable of type GameLogic called instance. This will act as our
  // active instance of the GameLogic class. Since we made the field static, we can access
  // it during the entire runtime.
  static GameLogic _instance = GameLogic._();

  // Declare an instance variable called results, this variable is part of an instance of
  // the class GameLogic. This variable will store all our inputs that have been submitted
  // trough the addInput function
  List<List<int>> results = [];

  // Declare a private constructor. This ensures that the only scope that can create a new
  // instance of teh class GameLogic is the GameLogic scope itself.
  GameLogic._();

  // Create a static getter for our private static variable instance. We want to create a getter
  // for this instead of allowing anything outside of our class scope to access the variable directly.
  // This prevents other scopes to use the variable in ways we do not intent. 
  static GameLogic get instance => _instance;

  // Create a method to add input to our results
  void addInput(List<int> inputs) {
    results.add(inputs);
  }

  // Create a static function to allow the creation of a new game!
  static void createNewGame() {
    _instance = GameLogic._();
    print("A new game is created!");
  }
}
