import 'dart:core';

class S {
  var v;

  final f = 0;

  get g => 42;

  set s(x) => v = 2;

  m(a, b) => 91;
}

class C extends S {
  @override
  noSuchMethod(Invocation invocation) {
    // TODO: implement noSuchMethod

    return super.noSuchMethod(invocation);
  }
}

/**
 * 定义一个抽象类
 */
abstract class Pair {
  get first;

  get second;
}

abstract class Collection {
  forEach(f);//用函数f对集合中饿每个元素进行调用

  where(f);

  map(f);
}
