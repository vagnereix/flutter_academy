import 'dart:async';

Future<void> main() async {
  final interval = Duration(seconds: 1);

  var stream = Stream<int>.periodic(interval, (int value) {
    return value++ * 2;
  });
  stream = stream.take(5).skip(2);

  await for (var i in stream) {
    print(i);
  }
}
