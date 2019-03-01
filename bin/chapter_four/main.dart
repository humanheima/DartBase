import 'dart:core';

addressLetter({name, street, number, city, zip, country}) {}

void main(List<String> arguments) {
  /*addressLetter(
      name: "dmw",
      street: "shuiqinglu",
      number: 10,
      city: "shanghai",
      zip: 101,
      country: "shanghai");*/
  for (var i in naturalTo(20)) {
    print(i);
  }
}

class NaturalsIterable {
  var n;

  NaturalsIterable.to(this.n);

  get iterator => new NaturalIterator(n);
}

class NaturalIterator {
  var n;
  var current = -1;

  NaturalIterator(this.n);

  moveNext() {
    if (current < n) {
      current++;
      return true;
    }
    return false;
  }
}

/// naturalTo(n) => new NaturalsIterable.to(n);
/// 同步生成器
naturalTo(n) sync* {
  var k = 0;
  while (k < n) yield k++;
}
