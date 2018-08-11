import 'dart:async';
/**
 * 测试异步
 */

void main(List<String> arguments) {
  useWait();
}

useFuture() {}

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
