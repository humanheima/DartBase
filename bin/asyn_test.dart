import 'dart:async';
/**
 * 测试异步
 */

void main(List<String> arguments) {
  //useWait();
  //futureThen();
  //featureCatchError();
  //futureWait();
  useStream();
}

void futureThen() {
  Future.delayed(new Duration(seconds: 2), () {
    return "hello world";
  }).then((data) {
    print(data);
  }, onError: (e) {
    print(e);
  });
}

futureCatchError() {
  Future.delayed(new Duration(seconds: 2), () {
    throw new AssertionError("Error");
  }).then((data) {
    print(data);
  }).catchError((e) {
    print(e);
  }).whenComplete(() {
    print("complere");
  });
}

futureWait() {
  Future.wait([
    Future.delayed(new Duration(seconds: 2), () {
      return "hello";
    }),
    Future.delayed(new Duration(seconds: 2), () {
      return " world";
    })
  ]).then((results) {
    print(results[0] + results[1]);
  }).catchError((e) {
    print(e);
  });
}

useWait() async {
  try {
    final String value = await getValueFromNetwork();
    print(value);
  } catch (e) {
    print(e);
  }
}

/**
 * 模拟从网络加载数据
 */
String getValueFromNetwork() {
  int result = 0;
  for (int i = 0; i < 10000; i++) {
    result += i;
  }
  print('return value');
  return result.toString();
}

useStream() {
  Stream.fromFutures([
    Future.delayed(new Duration(seconds: 1), () {
      return "hello 1";
    }),
    Future.delayed(new Duration(seconds: 1), () {
      throw AssertionError("error");
    }),
    Future.delayed(new Duration(seconds: 1), () {
      return "hello 3";
    })
  ]).listen((data) {
    print(data);
  }, onError: (e) {
    print(e);
  }, onDone: () {
    print("done");
  });
}
