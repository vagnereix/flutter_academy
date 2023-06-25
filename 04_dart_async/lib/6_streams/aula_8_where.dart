import 'dart:async';

Future<void> main() async {
  final interval = Duration(seconds: 1);

  var stream = Stream<int>.periodic(interval, (int value) {
    return value++ * 2;
  });
  stream = stream.where((numero) => numero % 3 == 0).take(5);

  stream.listen((numero) {
    print(numero);
  });
}
