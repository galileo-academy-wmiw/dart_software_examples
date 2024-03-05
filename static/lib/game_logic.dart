class GameLogic {
  static GameLogic _instance = GameLogic._();

  List<List<int>> results = [];

  GameLogic._();

  static GameLogic get instance => _instance;

  void addInput(List<int> inputs) {
    results.add(inputs);
  }

  void createNewGame() {
    _instance = GameLogic._();
    print("A new game is created!");
  }
}
