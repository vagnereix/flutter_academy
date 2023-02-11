# Fundamentos do Dart - Academia do Flutter

## Nomeclaturas:

- `snake_case` para nomes de arquivos;
- `camelCase` para variáveis, atributos e métodos;
- `PascalCase` para classes, enum e interfaces;
- `SCREAMING_SNAKE_CASE` para constantes.

## Variáveis:

- `bool` indica se um valor é verdadeiro ou falso (`true` or `false`);
- `num` para números que podem ser ambos os tipos, int ou double;
- `int` para números inteiros;
- `double` para números decimais;
- `String` para textos;
- `var` idetifica automaticamente o tipo da variável de acordo com o valor inicial da mesma (se houver);
- `Object` pode ser qualquer coisa, pois todos os tipos são filhos dele;
- `dynamic` também pode ser qualquer coisa, semelhando o `any` do JavaScript (tentar ao máximo não utilizar).

## Nullsafety:

- Podemos forçar a existência de uma variável com o `!`:
  ```dart
  final String? nomeCompleto;
  print(nomeCompleto!.length); // ERROR
  ```
- Variáveis locais são nulas (`nullable`) por padrão, atribuindo-as um valor são promovidas a `null safety` or `non-null`;
- Variáveis de nível superior não podem ser inicializadas depois;
- Variáveis de nível superior NUNCA são promovidas a `null safety` or `non-null`.

## Modificadores:

- `final` torna a variável imutável, nos ajudando a não receber um comportamento inesperado. As mesmas são definidas em tempo de EXECUÇÃO (`runtime`), e é sempre bom tentar utilizá-las o máximo possível.
- `const` também torna a variável imutável, porém são definidas em tempo de COMPILAÇÃO (`build time`) e só podem receber valores de outras contantes.

## Condicionais:

- `if` é o caso positivo para alguma condição:

  ```dart
  if (true) {
    // condição satisfeita, faça algo
  }
  ```

- `else if` é o caso negativo com uma nova verificação instantânea:

  ```dart
  if (false) {
    // condição não satisfeita
  } else if (true) {
    // condição satisfeita, faça algo
  }
  ```

- `else` é o caso negativo:

  ```dart
  if (false) {
    // condição não satisfeita
  } else {
    // condição satisfeita, faça algo
  }
  ```

## Operadores relacionais:

- `==` igualdade;
- `!=` diferença;
- `>` maior que;
- `<` menor que;
- `<=` menor ou igual;
- `>=` maior ou igual.

## Operadores lógicos:

- `&&` implica que todas as condições precisam ser verdadeiras:

  ```dart
  if (true && true) {
    // condição satisfeita, faça algo
  }
  ```

- `||` implica que uma das condições precisa ser verdadeira:

  ```dart
  if (true || false) {
    // condição satisfeita, faça algo
  }
  ```

- `!` implica que queremos contrário ou a negação da condição:

  ```dart
  if (!(true)) {
    // condição satisfeita, faça algo
  }
  ```

## Operadores ternários:

Com o operador ternário podemos reduzir um `if and else` para uma única linha:

```dart
if (idade >= 18) {
  print('Maior de idade.');
} else {
  print('Menor de idade.');
}

idade >= 18 ? print('Maior de idade.') : print('Menor de idade.');
```

## Switches:

Muito útil quando você quer checar mais de uma coisa ao mesmo tempo, como por exemplo identificar o dia da semana de acordo com uma ordem predefinida:

```dart
switch (diaDaSemanaInt) {
  case 0:
    diaDaSemanaString = 'Segunda-feira';
    break;
  case 1:
    diaDaSemanaString = 'Terça-feira';
    break;
  // todos os outros casos aqui
  default:
    diaDaSemanaString = 'Não identificado.';
    break;
}
```

## Tratamento de nulos:

- `Null Aware Operator` é útil para verificar se algo realmente existe e de acordo com isso realizar alguma operação, por exemplo:
  ```dart
  var nomeCompleto = (nome ?? 'Vagner ') + sobrenome;
  ```
- `Conditional Property Access` é utilizado para acessar uma propriedade/função de uma classe caso ela exista. Geralmente é utilizado junto ao `Null Aware Operator`:
  ```dart
  print(nomeCompleto?.toUpperCase() ?? 'Nome não existe.');
  ```

## Listas:

- É errado declarar uma lista vazia sem passar o seu tipo:
  ```dart
  var listaDeclaradaErroneamente = []; // List<dynamic>
  ```
- Sempre declarar passando seu tipo, a não ser que a mesma já seja inicializada:

  ```dart
  var listaDeclaradaCorretamente = <int>[]; // List<int>
  List<num> listaDeNumerosVazia = []; // List<num>

  var lista = [0, 'Vagner', 1.0]; // List<Object>
  List listaDeObjects = [1, 'Reis', 1.0.1]; // List<Object>
  ```

- Listas utilizando conceitos de `null safety`:

  ```dart
  List<String?> aceitaElementosNulos = ['Vagner', null, 'Reis'];
  List<String?>? naoAceitaElementosNulosPodeSerNula;
  ```

## Manipulando listas:

- `.first` trás o primeiro elemento da lista;
- `.last` trás o último elemento da lista;
- `.add()` é utilizado para adicionar um elemento a uma lista;
- `.addAll()` é utilizado para adicionar uma lista a outra lista;
- `.insert()` é utilizado para adicionar um elemento a um index específico de uma lista;
- `.remove()` é utilizado para remover um elemento específico de uma lista;
- `.removeAt()` é utilizado remover um elemento pelo seu index;
- `.removeRange()` é utilizado remover um ou mais elementos, de um index a outro;
- `.removeWhere()` é utilizado para buscar um elemento dentro de uma lista e então o remover:

  ```dart
  final nomes = ['Dos', 'Reis'];
  nomes.removeWhere((nome) => nome == 'Dos');
  print(nomes); // [Reis]
  ```

- `.generate()` é utilizado para gerar uma lista com um número específico de elementos:

  ```dart
  final listaGerada = List.generate(5, (index) => index + 1);
  print(listaGerada); // [1, 2, 3, 4, 5]
  ```

- `.filled()` é utilizado para gerar uma lista com um número específico de elementos sempre iguais:

  ```dart
  final listaGerada = List.filled(5, 'V');
  print(listaGerada); // [V, V, V, V, V]
  ```

- `.fold()` é similar ao `reduce` do JavaScript por exemplo, utilizado para percorrer todos os valores de uma lisa e realizar alguma operação com os mesmos:

  ```dart
  final soma = listaGeradaPeloGenerate.fold(
    0,
    (previousValue, numero) => previousValue += numero,
  );
  print(soma); // 15
  ```

- O Spread Operator [`...`] é utilizado para adicionar listas dentro de listas, similar ao comportamento do `.addAll()`:

  ```dart
  final lista = [1, 2];
  final listaComSpread = [...lista, 4, 5];
  print(soma); // [1, 2, 4, 5]
  ```

- `Collection if` pode ser utilizado para adicionar algo dentro de uma lista caso uma condição seja satisfeita:

  ```dart
  final condicao = true;
  final listaColletionIf = [if (condicao) 'Lista não vazia'];
  print(listaColletionIf); // [Lista não vazia]
  ```

- `Collection for` pode ser utilizado para adicionar vários elementros dentro de uma lista enquanto uma condição seja satisfeita:

  ```dart
  final lista = [1, 2];
  final listaColletionFor = [for (var i in lista) 'Elemento $i'];
  print(listaColletionFor); // [Elemento 1, Elemento 2]
  ```

## Loops:

- `for` é utilizado para realizar uma operação até que uma condição se satisfaça, recebendo o ponto de partida, a condição e o incremento ou regra a ser seguida após cada execução:

  ```dart
  final nomes = ['Vagner', 'Queiroz', 'Reis'];
  for (int i = 0; i < nomes.length; i++) {
    print(nomes[i]); // Vagner Queiroz Reis
  }
  ```

- `for in` é utilizado para percorrer uma `List` e realizar uma operação para cada elemento dentro da mesma:

  ```dart
  for (final nome in nomes) {
    print(nome); // Vagner Queiroz Reis
  }
  ```

- Para ambos esses casos, existe a possibilidade de pular a execução em um caso específico com o `continue` ou pará-la com o `break`;

- `forEach` é similar aos dois anteriores, porém recebe apenas uma função a ser executada diretamente:

  ```dart
  nomes.forEach(print); // Vagner Queiroz Reis
  ```

- `while` também nos permite executar algo enquanto uma condição não se satisfaz, porém só recebe a condição, caso queiramos teremos que executar alguma regra manualmente após cada execução:

  ```dart
  var numero = 0;
  while (numero < 5) {
    print(numero); // 0 1 2 3 4
    numero++;
  }
  ```

- `do while` nos dá a certeza de que o código dentro dele vai ser executado pelo menos uma vez:

  ```dart
  var indice = 0;
  do {
    print(indice); // 0
    indice++;
  } while (indice > 1);
  ```

## Iterables:

Um `iterable` nos permite relizar ações encadeadas gerando uma certa 'economia' de código comparado aos loops anteriores em alguns casos, são eles:

- `.where()` onde podemos realizar filtros de forma mais legível;
- `.takeWhile()` onde podemos filtrar elementos enquanto uma condição não se satisfaz;
- `.skipWhile()` onde podemos remover elementos enquanto uma condição não se satisfaz;
- `.map()` muito utilizado quando queremos realizar uma transformação em uma lista ou executar alguma regra de negócio com os elementos da mesma.

Também é importante lembrar que todos esses métodos retornam diretamente elementos da classe `Iterable`, com isso se faz necessário após a execução dos mesmos retornar a lista para sua estrutura original com o método `.toList()`.

## Conversões e Manipulações de Strings:

- `.substring()` esse método pode ser utilizado de duas formas diferentes, uma delas é passando apenas um parâmetro onde você terá como retorno a `String` a partir do caractere que você definir, e a outra seria passando dois parâmetros onde um será o index do caractere de partida e o outro o index do caractere final desejado + 1:

  ```dart
  final nome = 'Vagner Reis';

  var subStringSobreNome = nome.substring(7); // Reis
  var subStringNome = nome.substring(0, 6); // Vagner
  ```

- `.startsWith()` nos permite verificar se uma String se inicia com determinado caractere;
- `.endsWith()` nos permite verificar se uma String termina com determinado caractere;
- `.toLowerCase()` nos permite converter uma String para caracteres minúsculos;
- `.toUpperCase()` nos permite converter uma String para caracteres maiúsculos;
- `.contains()` nos permite verificar se uma String contém uma certa String ou caractere simples dentro dela:

  ```dart
  nome.toLowerCase().contains('reis'); // true
  ```

- `.split()` nos permite quebrar uma String com base em um caractere específico recebido como parâmetro, retornando assim um `Array<String>` com os textos entre o caractere recebido:

  ```dart
  final url = '/Home /Split /URL';
  url.split('/').forEach(print); // Home Split URL
  ```

- O caractere `$` pode ser utilizado para interpolar String simples junto a textos, caso você precise utilizar algum método da classe `String` você precisará também utilizar chaves com `${}`:

  ```dart
  print('Olá $nome'); // Olá Vagner Reis
  print('Olá ${nome.toUpperCase()}'); // Olá VAGNER REIS
  ```

## Conversões e Manipulações de Números:

- `.toString()` nos permite converter números para `String`;
- `.isNegative()` nos permite verificar se um número é negativo de forma simples;
- `.round()` nos permite arredondar números decimais do tipo `double` e convertê-los para um número inteiro `int`;
- `.roundToDouble()` faz o mesmo do método anterior porém mantém o número arredondado como `double`;
- `int.parse()` nos permite converter um número em formato de `String` para um formato `num` retornando uma excessão caso não consigo converter;
- `int.tryParse()` faz o mesmo que o método anterior porém retorna `null` caso não consiga converter;
- `.toStringAsFixed()` nos permite passar como parâmetro o número de casas decimais que queremos exibir em um `double`.
