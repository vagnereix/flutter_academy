import 'package:freezed_annotation/freezed_annotation.dart';

part 'pattern_matching.freezed.dart';

@freezed
abstract class PatternMatching with _$PatternMatching {
  factory PatternMatching(int value) = _PatternMatching;
  factory PatternMatching.loading() = _PatternLoading;
  factory PatternMatching.error(String message) = _PatternError;
}

void main() {
  final patternMatching = PatternMatching(10);
  final patternLoading = PatternMatching.loading();
  final patternError = PatternMatching.error('Error message');

  patternMatching.when(
    (value) => print('Value: $value'),
    loading: () => print('Loading'),
    error: (message) => print('Error: $message'),
  );

  patternError.maybeWhen(
    (value) => print('Value: $value'),
    error: (message) => print('Error: $message'),
    orElse: () => print('Or else, not a default pattern'),
  );

  patternLoading.map(
    (_PatternMatching patternClass) => print(patternClass.runtimeType),
    loading: (_PatternLoading patternClass) => print(patternClass.runtimeType),
    error: (_PatternError patternClass) => print(patternClass.runtimeType),
  );

  patternError.maybeMap(
    (_PatternMatching patternClass) => print(patternClass.runtimeType),
    loading: (_PatternLoading patternClass) => print(patternClass.runtimeType),
    orElse: () => print('Or else, not loading pattern class'),
  );
}
