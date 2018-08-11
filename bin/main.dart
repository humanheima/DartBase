import 'package:DartBase/DartBase.dart' as DartBase; //引用别名，可以
import 'Point.dart';

main(List<String> arguments) {
  print('Hello world: ${DartBase.calculate()}!');

  var str1 = "OK?";
  String str2 = "It's ok";
  var str3 = """Dart Lang
  Hello,word!
  """;
  var name = "dumingwei";
  assert(name == "dumingwei");
  print("name=$name");
  //声明原始字符串，直接在字符串前加字符“r”
  print(r"换行符：\n");

  const i0 = 10;
  final i1 = 10;

  const int i2 = 100;
  final int i3 = 100;

  const list0 = const [1, 2, 3];

  print(sayHello("dumingwei"));
  print(sayHello1("dumingwei"));
  assert(sayHello is Function);

  var x = makeSubtract(5);
  print(x(2));
  //Dart中函数也是对象
  var callbacks = [];
  for (var i = 0; i < 3; i++) {
    // 在列表 callbacks 中添加一个函数对象，这个函数会记住 for 循环中当前 i 的值。
    callbacks.add(() => print('Save $i'));
  }
  callbacks.forEach((c) => c()); // 分别输出 0 1 2

  funX(1, b: 2, e: 6);
  funY(1, 2, 6);

  /**
   * 取整操作
   */
  int a = 3;
  int b = 2;
  print(a ~/ b); //输出1

  /**
   * 级联操作
   */
  Person person = new Person();
  person
    ..name = "dumingwei"
    ..country = "China";
  print(person);

  try {
    throw 'This a Exception!';
  } catch (e) {
    //可以试试删除catch语句，只用try...finally是什么效果
    print('Catch Exception: $e');
  } finally {
    print('Close');
  }

  Point point = new Point(1, 2, 3);
  point.x = 3;
  print(point);
  Rectangle rec = new Rectangle(0, 0, 100, 200);
  print(rec.right);

  var logger = new Logger('UI');
  logger.log('Button clicked');
}

class Person {
  String name;
  String country;

  void setCountry(String country) {
    this.country = country;
  }

  String toString() => 'Name:$name\nCountry:$country';
}

/**
 * 命名可选参数
 */
void funX(int a, {int b, int c: 3, d: 4, int e: 5}) {
  print('$a $b $c $d $e');
}

/**
 * 位置可选参数
 */
void funY(int a, [int b, int c = 3, d = 4, int e = 5]) {
  print('$a $b $c $d $e');
}

/**
 * 函数闭包
 */
Function makeSubtract(num n) {
  return (num i) => n - i;
}

/**
 *建议明确函数的输入类型和返回类型，方便修改，也方便阅读
 */
String sayHello(String name) {
  return "Hello $name";
}

/**
 * 如果函数只是简单的返回一个表达式的值，可以使用箭头语法 =>expr;它等价于{return expr;}
 */

String sayHello1(String name) => "Hello $name";
