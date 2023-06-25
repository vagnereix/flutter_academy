import 'dart:async';

void main() {
  print('Início do main.');

  Timer.run(() {
    scheduleMicrotask(() {
      print('Microtask 2.');
    });

    print('Event 1.');
  });

  scheduleMicrotask(() {
    print('Microtask 1.');
  });

  print('Final do main.');
}
