library shape;

import 'dart:math';

class Point {
  num x;
  num y;
  num z;

  Point(this.x, this.y, z) {
    this.z = z;
  }

  Point.fromList(var list)
      : x = list[0],
        y = list[1],
        z = list[2] {
    print('i am from list');
  }

  operator +(p) => new Point(x + p.x, y + p.y, z + p.z);

  @override
  String toString() {
    return 'Point{x: $x, y: $y, z: $z}';
  }

  static distance(p1, p2) {
    var dx = p1.x - p2.x;
    var dy = p1.y - p2.y;
    return sqrt(dx * dx + dy * dy);
  }
}

class Rectangle extends Shape {
  /**
   * 每个字段都对应一个隐式的Getter和Setter
   * 如果字段为final或者const的话，那么它只有一个getter方法 感觉和kotlin一样
   */
  num left;
  num top;
  num width;
  num height;

  Rectangle(this.left, this.top, this.width, this.height);

  num get right {
    return left + width;
  }

  set right(num value) {
    left = value - width;
  }

  num get bottom => top + height;

  set bottom(num value) => top = value - height;

  @override
  num perimeter() {
    return width * 2 + height * 2;
  }
}

abstract class Shape {
  /**
   * 计算周长
   */
  num perimeter();
}

class Logger {
  final String name;
  bool mute = false;

  // 变量前加下划线表示私有属性
  static final Map<String, Logger> _cache = <String, Logger>{};

  //工厂构造函数
  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }
}

abstract class Person {
  //此时abstract关键字可加可不加，如果加上的话Person不能被实例化
  String greet(who); //函数可以没有实现语句，名曰隐式接口，前面不用加 abstract 关键字
}

class Student implements Person {
  @override
  String greet(who) => "I am a android developer";
}
