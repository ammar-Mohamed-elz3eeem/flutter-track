class Player {
  static int counter = 1;
  int id;
  String name;
  String imagePath;
  double score;

  Player(this.name, this.imagePath, this.score) : id = counter++;
}
