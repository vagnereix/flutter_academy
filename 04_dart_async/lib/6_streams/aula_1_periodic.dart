import 'dart:async';

Future<void> main() async {
  final interval = Duration(seconds: 2);

  final stream = Stream<int>.periodic(interval, (int value) {
    return value++ * 2;
  });

  await for (var i in stream) {
    print(i);
  }
}
