# Dart POO - Academia do Flutter

## Modificadores de classes:

- Uma classe porde conter atributos de instância e atributos de classe;
- Atributos de classe são definidos com o modificador `static`;
- Atributos de classe devem, sempre que possíveis, serem declarados também como constantes, seguindo o padrão `static const AttributeName`;
- Atributos de classe não podem ser acessados a partir de uma `instância` da classe a qual pertecem;
- Uma classe pode conter atributos públicos e privados, atributos privados são definidos com um underline antes de seu nome, como por exemplo `String? _nome`;

## Construtores:

- Toda classe tem um construtor `default` com o mesmo nome da classe;
- Construtores podem receber parâmetos `default`, `nomeados` ou `opcionais` e podem atribuir os valores diretamente ou recebê-los e depois atribuir:

  ```dart
  // Atribuindo diretamente
  Pessoa({
    required this.nome,
    required this.idade,
  });

  // Atribuindo depois
  Pessoa({
    required String nome,
    required int idade,
  }) {
    nome = nome;
    idade = idade;
  };
  ```

- Existem 3 tipos de `construtores`, os `default`, `nomeados` e `factorys`:

  ```dart
  // Construtor default
  Pessoa({
    required this.nome,
    required this.idade,
  });

  // Construtor nomeado
  Pessoa.semNome({
    required this.idade,
  });

  // Construtor factory
  factory Pessoa.fabrica({required String nomeFactory}) {
    var nome = '${nomeFactory}_factory';
    var pessoa = Pessoa.vazia();

    pessoa.nome = nome;
    return pessoa;
  }
  ```

- Construtores do tipo `nomeados` são utilizados quando precisamos criar um construtor específico para uma determinada ocasião, e assim nomeá-lo de acordo com a mesma;
- Construtores do tipo `factory` são utilizados quando precisamos realizar alguma regra de negócio antes de criar a intância da classe;
- Quando chegamos no `corpo` do contrutor a instância da nossa classe já foi criada;
- Construtores com `parâmetros nomeados` não podem realizar uma associação direta a atributos `privados`;
- Com isso, no caso de atributos `finais privados` por exemplo, o `Dart` nos permite atribuir valores utilizando a sintaxe de dois pontos após os parâmetros tradicionais:

  ```dart
  final int? _id;

  Produto({
    required int id,
  }) : _id = id; // Atribuição feita ainda antes do corpo
  ```

- No caso de construtores do tipo `factory`, isso não se aplica;
- A palavra reservada `late` é utilizada para informar que determinado atributo será inicializado depois. Essa palavra sobresvreve todas as outras regras, como a do `final` por exemplo. Deve ser evitada e só utilizada quando houver certeza do que está sendo feito.

## Herança:

- Com a palavra reservada `extends` definimos que uma classe extende-se à outra, em outras palavras definimos que uma classe também `é ou faz parte` de outra classe;
- Podemos passar informações para construtores superiores com a palavra reservada `super` antes do corpo do construtor da classe filha:

  ```dart
  Cachorro({required super.idade});
  ```

- Com a palavra reservada `abstract` definimos uma assinatura a ser seguida por classes que extenderem à essa, transformando uma classe em abstrata. Classes que se extendem à classes abstratas devem implementar os métodos assinados usando o `metadata @override`:

  ```dart
  abstract class Animal {
    int calcularIdadeHumana();
  }

  class Cachorro extends Animal {
    @override
    int calcularIdadeHumana() {
      return idade * 7;
    }
  }
  ```

- A palavra reservada `covariant` nos permite aceitar a sobrescrita com classes filhas das que estamos trabalhando ou esperando receber em um método:

  ```dart
  abstract class Mamifero {
    // Permite receber qualquer tipo de Fruta
    // Qualquer classe que se extende à Fruta
    void comer(covariant Fruta fruta);
  }

  class Banana extends Fruta {}

  class Macaco extends Mamifero {
    @override
    // Aceita Banana, pois é um tipo de Fruta
    void comer(Banana fruta) {}
  }
  ```

## Associação:

- Associação é quando uma classe `tem` alguma coisa, e não quando ela `é` alguma coisa. Um exemplo de associação é quando uma `Pessoa` tem um `Celular`;
- Quando um atributo de associação `é obrigatório`, estamos falando de uma `Composição`;
- Quando um atributo de associação `não é obrigatório`, estamos falando de uma `Agregação`.

## Polimorfismo:

- Polimorfismo é quando uma classe abstrata define um método ou ação genérica que todas as classes que extenderem dela terão que executar à sua maneira. Uma `Pessoa` que precisa `Trabalhar` por exemplo, todas as pessoas devem trabalhar de acordo com a sua área de atuação;
- Sobrescrita de métodos `não` existem somentes para classes que extendem à classes abstratas, podem ser utilizados em qualquer caso que se faça necessário.

## Interfaces:

- Interfaces no Dart são semelhantes às classes abstratas, inclusive também são declaradas utilizando a palavra reservada `abstract`;
- A diferença entre as duas é que uma classe abstrada `possui métodos implementados` enquanto uma interface possui apenas o `contrato` dos métodos, mas sem nenhuma implementação;
- Para implementarmos interfaces utilizamos a palavra reservada `implements`, e não a `extends` utilizada para extender à classes abstratas.

## Auto promoção de tipos:

- Quando checamos se uma variável é uma instância de uma determinada classe ou tipo, caso seja, o Dart vai `automáticamente` converter essa instância para o tipo dessa classe.

## Mixins:

- O `mixis` é a forma de se fazer herança múltipla dentro do `Dart`;
- Um mixin é criado com a palavra reservada `mixin` ou também como uma classe abstrata normal;
- Um mixin pode conter condições, por exemplo em que classe ele pode ser adicionado usando a palavra reservada `on`, e com isso em qualquer outra classe o mesmo não poderá ser chamado;
- Para utilizar um mixin basta utilizar a palavra reservada `with` que deve sempre ficar entre a `extends` e a `implements` caso as duas existam.
- A palavra `with` permite extender e user tanto `mixins` quanto classes `abstratas`;
- Um `mixin` não pode extender de outra classe;
- Um `mixin` pode sobrescrever um método de outra classe mesmo sem extendê-la, caso tenha um método com o mesmo nome de um método usado em uma classe que o extende:

  ```dart
  abstract class Artista {
    void realizarShow() {}
  }
  mixin Cantor {
    void realizarShow() {
      // Sobrescreve o da classe Artista pois está sendo chamado após o extends de Artista
    }
  }

  class Pessoa extends Artista with Dancarino, Cantor {}
  ```

## Cascade notation:

- Cascade notation é representado por `..` e utilizado para acessarmos diretamente métodos ou atributos de uma instância recém inicializada:

  ```dart
  var pessoa = Pessoa()
    ..nome = 'Vagner'
    ..printPessoa();
  ```

## Callable class:

- Callable class é o conceito de criar um método chamado de `call` dentro de uma função, e com isso conseguir chamar essa classe em forma de função, acessando diretamente esse método:

  ```dart
  class EnviarEmail {
    bool call() {
      print('Chamando método call.');
      return enviar();
    }

    bool enviar() {
      return true;
    }
  }

  var callableClass = EnviarEmail();
  callableClass(); // Chamando método call.
  ```

## Extensions:

- As `extensions` nos permitem adicionar funções em classes que não temos código fonte;
- Criamos um extension usando a palavra reservada `extension` e depois dizendo onde a mesma vai ser estendida com o `on`:

  ```dart
  extension SaudacaoStringExtension on String {}
  ```

## Metadatas:

- Dentro do `Dart` uma classe pode se tornar uma anotação, ou um `metadata` como é chamada pelo mesmo;
- Para utilizar uma classe como anotação, o construtor da mesma deve ser do tipo `const`;
- Anotações podem ser utilizadas em classes, atributos e métodos;
- Para recuperar os `metadatas` de uma classe precisamos utilizar o `reflect` do `dart:mirrors`, com ele podemos ter acesso à uma instância de `ClassMirror` e a seus respectivos metadatas dentro da propriedade `matadata` que sempre será uma `List` de `annotations`:

  ```dart
  var instanceMirror = reflect(pessoa_1);
  ClassMirror classMirror = instanceMirror.type;
  ```

- O tipo da instância de cada `metadata` fica na propriedade `reflectee` de cada um deles, com isso podemos a utilizar para verificar se existe uma instância de uma determinada `annotation` na nossa classe:

  ```dart
  for (var annotation in classMirror.metadata) {
    var instanceAnnotation = annotation.reflectee;

    if (instanceAnnotation is Fazer) {
      print(instanceAnnotation);
    }
  }
  ```

- Podemos fazer algo semelhante para verificar as `annotations` existentes em atributos e métodos da nossa classe:

  ```dart
  for (var declarationMirror in classMirror.declarations.values) {
    if (declarationMirror is VariableMirror) {
      // Acessa a instância e verifica o tipo de cada annotation
    } else if (declarationMirror is MethodMirror) {
      // Acessa a instância e verifica o tipo de cada annotation
    }
  }
  ```

## Getters and setters:

- Podemos criar métodos `getters` and `setters` quando precisamos de uma regra de negócio antes de alterar uma determinada propriedade de uma classe;
- Esses métodos podem ser definidos utilizando as palavras reservadas `get` e `set`;
- Geralmente são utilizados para ler e escrever em atributos `privados`.

## Construtores Tear Off:

- Com essa funcionalidade podemos passar constutores de classes como parâmetro para funções:

  ```dart
  final pessoasTearOff = nomes.map<Pessoa>(Pessoa.new).toList();
  ```

## Tipos genéricos:

- Os tipos genéricos nos permitem trabalhar com uma classe que pode receber qualquer coisa, definindo o tipo do que será recebido na hora de instanciar a mesma;
- Podemos definir que um tipo genérico precise extender de um outro tipo;

  ```dart
  class Caixa<T extends Item> {}
  ```

## Part & Part of:

- No `Dart` podemos ter parte de um arquivo dentro de outro arquivo, e para definir isso utilizamos as palavras reservadas `part` e `part of`;
- O `part of` é utilizado para indicar que determinado arquivo é parte de outro arquivo:

  ```dart
  // Indica que esse arquivo é parte de Pessoa
  part of 'pessoa.dart';

  class _Endereco {}
  ```

- O `part` é utilizado para indicar que determinado tem uma parte sua em outro arquivo:

  ```dart
  // Indica que esse arquivo tem uma parte sua em Endereco
  part 'endereco.dart';

  class Pessoa {}
  ```
