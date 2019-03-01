import 'dart:core';

class Fruit {
  var color;

  Fruit(this.color);
}

class Apple extends Fruit {
  Apple() : super("Red");
}

class Orange extends Fruit {
  Orange() : super("Orange");
}

printColors(List<Fruit> fruits) {
  for (Fruit f in fruits) {
    print(f.color);
  }
}

void main(List<String> arguments) {
  List<Apple> apples = <Apple>[];

  apples.add(new Apple());

  List<Orange> oranges = new List<Orange>();

  oranges
    ..add(new Orange())
    ..add(new Orange());

  printColors(apples);
  printColors(oranges);
}
