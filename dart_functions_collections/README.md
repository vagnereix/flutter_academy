# Dart Funções e Coleções - Academia do Flutter

## Funções e Typedef:

- Funções de `nível superior` é uma função jogada dentro de um arquivo, sem estar dentro de uma classe.
- Funções `Arrow` são funções de apenas uma linha, que não possuem corpo definido:
  ```dart
    int soma(int a, int b) => a + b;
  ```
- Funções `anônimas` são funções que não tem nome:
  ```dart
    (int a, int b) { a + b }();
  ```
- `Typedef` são tipos definidos, uma palavra reservada utilizada para definir um tipo qualquer:
  ```dart
    typedef funcaoSoma = int Function(int a, int b);
  ```

## Parâmetros:

No Dart existem alguns tipos de parâmetros com comportamentos diferentes, são eles:

- Parâmetros `obrigatórios por padrão`, que são aqueles parâmetros padrões para qualquer linguaguem de programação;
- Parâmetros `nomeados`, são representados por `{}` e são `nullables` por padrão, podem ser convertidos para `non-nullables` e não precisam ser passados seguindo a ordem declarada na função. Os mesmos também podem ser definidos como obrigatórios utilizando a palavra reservada `required`, são representados dessa forma:

  ```dart
  int soma({ int? a, int? b }) {}
  int somaObrigatoria({ required int a, required int b }) {}
  ```

- Ainda sobre parâmetros `nomeados`, podemos definir que um parâmetro mesmo que requerido, possa receber um valor `null`. Com isso os mesmos também podem receber valores `default` caso na chamada da função seja enviado algum valor desse tipo, por exemplo:

  ```dart
  int soma({ required int? a, required int b}) {
    a ??= 0; // Atribuindo o valor 0 caso o parâmetro 'a' seja nulo.
  }
  int somaOpcional({ int a = 1, int b = 2 }) {}
  ```

- Parâmetros `opcionais`, são represetados por `[]` e como o próprio nome já diz, não são necessários. Pouco utilizados já que os outros dois tipos de parâmetros conseguem replicar esse comportamento, forma de utilizar:

  ```dart
  int somaOpcional([ int a = 1, int b = 2 ]) {}
  ```

- Os parâmetros `obrigatórios` podem ser utilizados juntamente com os parâmetros `nomeados` e `opcionais`, porém esses dois não podem ser utilizados juntos em uma mesma função. Ao utilizar parâmetros `obrigatórios` com qualquer um desses dois, os `obrigatórios` devem sempre vir primeiro:

  ```dart
  int somaComNomeado(int a, { required int b }) {}
  int somaComOpcional(int a, [ int b = 2 ]) {}
  ```

## Memória:

- É muito importante se atentar a métodos de ações que retornam `void`, como por exemplo o `.clear()` e `.add()`, pois os mesmos alteram a referência existente na memória, sempre optar por gerar uma cópia antes de utilizá-los e retornar a alteração feita nessa cópia:

  ```dart
  List<String> funcaoCorreta(List<String> lista) {
    final copia = [...lista];
    copia.add('Reis');

    return copia;
  }
  ```

- Algumas classes como a `String` e a `int` não geram esse comportamento, é mais comum na classe `List`.

## Set:

- A classe `Set` é bastante parecido com a classe `List`, porém com um detalhe importante que a mesma `não permite repetições`;
- Podemos converter uma `List` para um `Set` com o método `.toSet()`;
- Com o método `.difference()` podemos verificar o que há em um `Set` que não há em outro;
- Com o método `.union()` podemos unir dois `Set`s evitando assim a repetição de conteúdo;
- Com o método `.intersection()` podemos verificar o que se repete em dois `Set`s;
- O método `.lookup()` verifica se existe um elemento dentro de um `Set` e caso exista ele o retorna. Similar a um método de busca.
- Mais uma diferença para a classe `List` é que para extrair dados de um `Set` temos que usar o método `.elementAt()` passando o index.

## Mapas:

- Um mapa nada mais é do que uma referência de `chave` e `valor`, também é representado por `{}` e para declararmos um `Map` precisamos definir os tipos da sua `chave` e do seu `valor`:

  ```dart
  final mapa = <String, String>{};
  ```

- Um `Map` pode ser nulo, receber uma chave nula ou um valor nulo, de acordo com as regras do `null-safety`:

  ```dart
  Map<String, String>? pacientesNullSafetyMap;

  Map<String?, String> pacientesNullSafetyMapSemChave = {
    null: 'Vagner',
  };

  Map<String, String?> pacientesNullSafetyMapSemValor = {
    'nome': null,
  };
  ```

- `.putIfAbsent()` é um método utilizado para adicionar um valor em uma chave caso essa chave não exista, em casos em que ela já existe nada é feito, pois não podemos adicionar outra chave com o mesmo nome:

  ```dart
  pacientesMap.putIfAbsent('estado', () => 'CE');
  pacientesMap.putIfAbsent('estado', () => 'MG');
  print(pacientesMap); // { estado: CE }
  ```

- `.update()` é um método utilizado quando queremos atualizar o valor de uma chave:

  ```dart
  pacientesMap.update('estado', (value) => 'SP');
  print(pacientesMap); // { estado: SP }
  ```

- Dentro do método `.update()` podemos passar um terceiro parâmetro (dessa vez um parâmetro nomeado) chamado de `ifAbsent`, onde o mesmo replica o comportamento do método `.putIfAbsent()`, executando nos casos em que tentamos atualizar o valor de uma chave que não existe. Caso tentemos fazer isso sem esse parâmetro definido, receberemos como retorno uma `Exception`.

  ```dart
  pacientesMap.update('cidade', (value) => 'Iguatu', ifAbsent: () => 'Iguatu');
  print(pacientesMap); // { estado: SP, cidade: Iguatu }
  ```

- Para ler o valor de uma `Map` utilizamos o nome do mesmo junto a colchetes `[]` passando o nome da chave que queremos acessar entre aspas:

  ```dart
  print('${pacientesMap['nome']} mora atualmente em ${pacientesMap['estado']}.');
  ```

- Podemos percorrer um Mapa utilizando o `.forEach()` ou o `for in`. É importante lembrar de nunca utilizar o `.forEach()` caso precisa de algum procesimento assíncrono.

  ```dart
  // Não utilizar se precisar de algum processo assíncrono.
  pacientesMap.forEach((key, value) {
    print('$key: $value');
  });

  // Utilizar se precisar de algum processo assíncrono.
  for (var paciente in pacientesMap.entries) {
    print('${paciente.key}: ${paciente.value}');
  }

  // Percorrendo todas as chaves de um Mapa.
  for (var chave in pacientesMap.keys) {
    print(chave);
  }

  // Percorrendo todos os valores de um Mapa.
  for (var valor in pacientesMap.values) {
    print(valor);
  }
  ```

- Podemos transformar um `Map` utilizando o `Iterable .map()`, porém nesse caso teremos que retornar obrigatóriamente um novo `Map` com o método construtor de um novo mapa `MapEntry()`:

  ```dart
  final novoMapa = pacientesMap.map((key, value) {
    return MapEntry(key, value.toUpperCase());
  });
  ```

- Um `Map` geralmente será utilizado para representar valores recebidos como `JSON`, pois se parece muito com o mesmo.

## Excessões:

- A estrutura para o tratamento de erros ou de `Exceptions` no Dart também consiste na utilização do famoso `try catch`. Através disso podemos capturar excessões específicas de acordo com a hierarquia da classe `Exception`;
- Podemos capturar o erro gerado dentro do `catch` via `catch(error)` e verificar o motivo do mesmo ter sido gerado;
- Também podemos capturar a `stacktrace` para nos ajudar a rastrear a origem do erro causado em meio a vários arquivos em nossos projetos utilizando `catch(error, stacktrace)`;
- Caso necessários podemos gerar uma excessão manualmente com o comando `throw Exception()` e capturá-la específicamente acima do último `catch`, seguindo assim a hierarquia definida pela classe;
- Quando queremos que algo seja executado independente da existência de excessões dentro de um `try catch`, podemos utilizar o `finally`. Dessa forma garantimos que um trecho de código sempre seja executado independente de sucesso ou erro;
- Exemplos:

  ```dart
  try {
    int.parse(idadeIncorreta);
  } on FormatException catch (error, stacktrace) {
    print('Erro ao realizar conversão. $error, $stacktrace');
  } on Exception {
    print('Excessão gerada manualmente.');
  } catch (error, stacktrace) {
    print('Erro genérico. $error, $stacktrace');
  } finally {
    print('Finalizando execução de tratamentos.');
  }
  ```

## Importações:

- Podemos realizar importações `relativas` ou via `package`;
- Em importações `relativas` deveremos buscar o arquivo a ser importado de acordo com o localização do arquivo que o vai importar:

  ```dart
  import '../1_funcoes/aula_1_funcoes.dart';
  ```

- Importações via `package` são como caminhos absolutos, passamos o nome do pacote a automaticamente temos uma referência para a pasta `lib` do projeto:

  ```dart
  import 'package:dart_functions_collections/1_funcoes/aula_1_funcoes.dart';
  ```

- Também podemos realizar um `alias` para definir um nome para o arquivo importado, e com isso acessar as funções importadas através desse arquivo. Isso nos ajuda quando mais de um arquivo contém uma função com o mesmo nome:

  ```dart
  import 'package:dart_functions_collections/1_funcoes/aula_1_funcoes.dart' as funcoes_primeira_aula;

  final resultado = funcoes_primeira_aula.somaInteiros(1, 2);
  ```

- Podemos definir o padrão que preferirmos utilizar lá por dentro do arquivo `analysis_options.yaml` localizado na raiz dos nossos projetos. Definindo uma regra específica:

  ```yaml
  linter:
    rules:
      prefer_relative_imports: true # Define importações relativas como padrões.
      always_use_package_imports: true # Define importações por package como padrões.
  ```

- Uma outra forma de importar arquivos para nossos projetos, são os `Dynamic Imports`, mais utilizados em projetos `Flutter`. Com esse tipo de importação, podemos importar arquivos distintos de acordo com nossas necessidades;
- Para utilizar desse tipo de importação, sempre precisaremos de um arquivo para realizar a `assinatura` do que será importado. E assim no momento da compilação o nosso projeto decidirá de qual arquivo ele fará essa importação. Esse arquivo geralmente é chamado de `stub`:

  ```dart
  import 'stub.dart' // Arquivo com as assinaturas do que será importado
    if (dart.library.io) 'mobile.dart', // Arquivo a ser importado em compilações Mobile
    if (dart.library.hmtl) 'web.dart'; // Arquivo a ser importado em compilações Web
  ```

## Enums:

- Podemos criar `Enums` em Dart utilizando a palavra reservada `enum`;
- Utilizamos `Enum`s para definir valores estáticos para um conjunto de variáveis como cores ou statuses por exemplo;
- Para vizualizar apenas o valor de um `Enum`, a partir da versão `2.15` do Dart podemos utilizar a propriedade `name`:

  ```dart
  enum Cores {
    red, blue,
  }
  print(Cores.red.name); // red
  ```

- Para buscar o valor de um `Enum` podemos utilizar o método `.byName()`, é importante saber que o mesmo retorna uma `Exception` caso não encontre nenhum resultado:

  ```dart
  print(Cores.values.byName('red')); // Cores.red
  ```

- `.asMap()` nos permite converter um `Enum` em um `Map` usando seus `índices` como suas `keys`:

  ```dart
  print(Cores.values.asMap()); // { 0: Cores.red, 1: Cores.blue }
  ```

- `.asNameMap()` nos permite converter um `Enum` em um `Map` usando seus `names` como suas `keys`:

  ```dart
  print(Cores.values.asNameMap()); // { red: Cores.red, blue: Cores.blue }
  ```

- Realizando essas conversões para Mapas, podemos realizar buscas e evitar excessões caso não encontremos o valor buscado, ao contrário do método `.byName()`.
