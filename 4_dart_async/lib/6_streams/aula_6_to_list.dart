import 'dart:async';

Future<void> main() async {
  final interval = Duration(seconds: 1);

  var stream = Stream<int>.periodic(interval, (int value) {
    return value++ * 2;
  });
  stream = stream.take(5);

  final data = await stream.toList();

  print(data);
}
