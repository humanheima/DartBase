void main(List<String> arguments) {
  //useStringBuffer();
  //useList();
  //useSet();
  useMap();
}

/**
 * StringBuffer
 */

void useStringBuffer() {
  StringBuffer sb = new StringBuffer();
  sb.write("use s string buffer");
  sb.writeAll(["a,b,c"]);
  sb..write('if you are')..write('build lots of strings.');
  print(sb.toString());
  sb.clear();
}

/**
 * list
 */
void useList() {
  // 使用List的构造函数，也可以添加int参数，表示List固定长度
  var vegetables = new List<String>();
// 或者简单的用List来赋值
  var fruits = ['apple', 'pear'];
  fruits.add('banana');
  fruits.addAll(['oragne', 'grapes']);
  print(fruits.length);
  print(fruits[0]);
  //对list进行排序
  //fruits.sort((a, b) => a.length.compareTo(b.length));
  fruits.sort((a, b) {
    print('sort fruits');
    return a.length.compareTo(b.length);
  });
  print(fruits);
}

/**
 * set
 */

void useSet() {
  var ingredients = new Set();
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);

// 添加已存在的元素无效
  ingredients.add('gold');
  assert(ingredients.length == 3);

// 删除元素
  ingredients.remove('gold');
  assert(ingredients.length == 2);

// 检查在Set中是否包含某个元素
  assert(ingredients.contains('titanium'));

// 检查在Set中是否包含多个元素
  assert(ingredients.containsAll(['titanium', 'xenon']));
  ingredients.addAll(['gold', 'titanium', 'xenon']);

// 获取两个集合的交集
  var nobleGases = new Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));

// 检查一个Set是否是另一个Set的子集
  var allElements = [
    'hydrogen',
    'helium',
    'lithium',
    'beryllium',
    'gold',
    'titanium',
    'xenon'
  ];
  //这个方法好像不存在 (dart 1.2.4)
  //assert(ingredients.isSubsetOf(allElements));
}

/**
 * Map
 */
void useMap() {
  // Map的声明
  var hawaiianBeaches = {
    'oahu': ['waikiki', 'kailua', 'waimanalo'],
    'big island': ['wailea bay', 'pololu beach'],
    'kauai': ['hanalei', 'poipu']
  };
  print(hawaiianBeaches.runtimeType);
  var searchTerms = new Map();

// 指定键值对的参数类型
  var nobleGases = new Map<int, String>();

// Map的赋值，中括号中是Key，这里可不是数组
  nobleGases[54] = 'dart';

//Map中的键值对是唯一的
//同Set不同，第二次输入的Key如果存在，Value会覆盖之前的数据
  nobleGases[54] = 'xenon';
  assert(nobleGases[54] == 'xenon');

// 检索Map是否含有某Key
  assert(nobleGases.containsKey(54));

//删除某个键值对
  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));

  var keys = hawaiianBeaches.keys;
  assert(keys.length == 3);
  assert(new Set.from(keys).contains('oahu'));

  var values = hawaiianBeaches.values;
  assert(values.length == 3);

//迭代器中有一个有意思的函数any，用来检测迭代器中的数据
//当其中一个元素运行函数时return true，那么any的返回值就为true，否则为false
//与之相对的是函数every，要所有函数运行函数return true，那么every返回true
  assert(values.any((v) => v.indexOf('waikiki') != -1));

// 你可以用foreach来遍历数据，但记住它是无序的
  hawaiianBeaches.forEach((k,v) {
    print('I want to visit $k and swim at $v');
  });

//检索是否包含某个Key或Value
  assert(hawaiianBeaches.containsKey('oahu'));
  assert(!hawaiianBeaches.containsValue('florida'));

//V putIfAbsent(K key, Function V ifAbsent())函数，通过Key来查找Value
//当某个Key不存在的时候，会执行第二参数的Function来添加Value
  var teamAssignments = {};
  teamAssignments.putIfAbsent('Catcher', () => 'Catcher'.length);
  assert(teamAssignments['Catcher'] != null);
}
