# Freezed package

## Métodos `pattern matching`

- `when` obriga o dev a tratar cada construtor de cada classe gerada pelo `Freezed`;
  ```dart
  patternMatching.when(
    (value) => print('Value: $value'),
    loading: () => print('Loading'),
    error: (message) => print('Error: $message'),
  );
  ```
- `maybeWhen` possibilita implementar somente um construtor de uma classe;
  - recebe um método `orElse` que é executado quando os casos implementado não são chamados.
  ```dart
  patternError.maybeWhen(
    (value) => print('Value: $value'),
    error: (message) => print('Error: $message'),
    orElse: () => print('Or else, not a default pattern'),
  );
  ```
- `map` retorna a classe para cada caso;
  - enquanto o `when` desconstrói a classe e retorna os seus atributos, o `map` retorna a classe diretamente.
  ```dart
  patternLoading.map(
    (_PatternMatching patternClass) => print(patternClass.runtimeType),
    loading: (_PatternLoading patternClass) => print(patternClass.runtimeType),
    error: (_PatternError patternClass) => print(patternClass.runtimeType),
  );
  ```
- `maybeMap` é similar ao `maybeWhen` mas com a mesma característica do `map`, retornando para cada caso a classe diretamente.
  ```dart
  patternError.maybeMap(
    (_PatternMatching patternClass) => print(patternClass.runtimeType),
    loading: (_PatternLoading patternClass) => print(patternClass.runtimeType),
    orElse: () => print('Or else, not loading pattern class'),
  );
  ```
