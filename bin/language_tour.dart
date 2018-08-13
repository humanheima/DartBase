void foo() {} // A top-level function

class A {
  static void bar() {} // A static method
  void baz() {} // An instance method
}

void main(List<String> arguments) {
  //testAssignmentOperator();
  // useGeneric();
  //useAsynchronySupport();
  useCallableClasses();
}

/**
 * dart在运行时会保留泛型的类型信息
 */
useGeneric() {
  var names = List<String>();
  names.add("hello");
  names.add("world");
  print(names.runtimeType); //输出 List<String>

  var someBaseClassFoo = Foo<SomeBaseClass>();
  var extenderFoo = Foo<Extender>();
  var foo = new Foo();
  print(foo);
  print(first(names));
}

useCallableClasses() {
  var wf = new WannabeFunction();
  var out = wf("a", "b", "c");
  print('$out');
}

class WannabeFunction {
  call(String a, String b, String c) => '$a $b $c!';
}

useAsynchronySupport() async {
  String result = await lookUpVersion();
  print(result);
}

String lookUpVersion() {
  print("haha");
  return "1.0.0";
}

/**
 * 泛型方法
 */
T first<T>(List<T> ts) {
  // Do some initial work or error checking, then...
  T tmp = ts[0];
  // Do some additional checking or processing...
  return tmp;
}

/**
 * 泛型类
 */
useAnonymousFunction() {
  var list = ["apple", "orange", "bananas"];
  list.forEach((item) {
    print('${list.indexOf(item)}: $item');
  });
}

class SomeBaseClass {}

class Extender extends SomeBaseClass {}

class Foo<T extends SomeBaseClass> {
  @override
  String toString() {
    return 'Instance of "Foo<$T>"';
  }
}

void testAssignmentOperator() {
  var a = 10;
  var b = 2;
  //只有当b为null的时候才把a赋值给b
  b ??= a;
  print(b);
}
