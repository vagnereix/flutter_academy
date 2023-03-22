# Gerenciadores de estado - Flutter Academy

## SetState

- Atualiza a `página inteira` quando detecta alguma alteração;
- Para que o `setState` entenda que occoreu uma alteração e que precisará rebuildar, preciamos notificá-lo através do método `setState(){}`;
- Exemplo:

  ```dart
  class _SetStatePageState extends State<SetStatePage> {
    String _message = 'Estado inicial.';

    void _changeMessage() => setState() {
      _message = 'Estado alterado.'
    }

    @override
    Widget build(BuildContext context) {
      return Text(_message);
    }
  }
  ```

## ValueNotifier

- Classe reativa do `Flutter` responsável por ouvir alterações de uma determinada propriedade;
- Atualiza apenas uma `parte da página` quando detecta alguma alteração;
- Definimos que uma propriedade será monitorada utilizando o método construtor da classe, o `ValueNotifier()`;
- Escuta as alterações através da `Widget` chamada `ValueListenableBuider()` que recebe a propriedade a ser monitorada;
- Para notificarmos que o método buider do `valueNotifier` precisa ser re-executado, apenas precisamos alterar o valor da `propriedade` que o mesmo está ouvindo;
- Exemplo:

  ```dart
  class _ValueNotifierPageState extends State<ValueNotifierPage> {
    final ValueNotifier<String> _message = ValueNotifier('Estado inicial.');

    void _changeMessage() => _message.value = 'Estado alterado.'

    @override
    Widget build(BuildContext context) {
      return ValueListenableBuilder<String>(
        valueListenable: _message,
        builder: (context, value, child) => Text(value),
      );
    }
  }
  ```

## ChangeNotifier

- Utiliza do `DesignPattern` ou padrão chamado de `Observable`, onde temos classes observáveis ou `Listeners` que observam/escutam alterações realizando alguma ação de acordo com as mesmas;
- Atualiza apenas uma `parte da página` quando detecta alguma alteração;
- O `ChangeNotifider` trabalha com uma classe `Controller` responsável por conter as ações e estados de sua página;
- Ao realizarmos alguma alteração dentro do `Controller`, precisamos notificar todos os `Listeners` através do método `notifyListeners()`;
- Geralmente quando usamos puramente o ChangeNotifier, escutamos as alterações através da `Widget` chamada `AnimationBuider()` que recebe um `Listenable` onde será o `Controller` da página e um `Builder` a ser executado quando esse `Listener` for notificado.
- É importante sempre realizar o `dispose()` do `Controller` no `dispose()` da página para evitar vazamento de memória;
- Exemplo:

  ```dart
  class ChangeNotifierController extends ChangeNotifier {
    String message = 'Estado inicial.'

    void changeState() {
      message = 'Estado alterado.'
      notifyListeners();
    }
  }

  class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
    final _pageController = ChangeNotifierController();

    @override
    void dispose() {
      _pageController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) => Text(_pageController.message),
      );
    }
  }
  ```

## BlocPattern

- O conceito do `Bloc` é dividir sua regra de negócio em `Classes` utilizando `Streams` para fazer a atualização dos estados;
- Assim como o `ChangeNotifier`, o Bloc também trabalha com uma classe `Controller`;
- Normalmente ao utilizarmos o `Bloc`, trabalhamos com uma outra `Classe` que conterá todos os estados da página, podendo conter uma ou mais instâncias extendendo do estado principal;
- Dentro da classe `Controller` definimos um `StreamController` do tipo do nosso estado que irá receber as alterações de estado e disponibilizar o `get` da `stream`;
- Para alterarmos um estado via `Bloc` simplesmente adicionamos um estado ao `StreamController` definido na classe `Controller`. Podemos ser diretamente ou via `sink()` do mesmo;
- Para monitorarmos alterações nos estados via `Bloc` utilizamos a `Widget` chamada de `StreamBuilder`, com ela podemos enviar o `get` de `stream` do nosso `StreamController` e:

  - Enviar no campo `builder` uma função de `Callback` que recebe um item chamado `snapshot`, item este que conterá uma propriedade `data` onde o estado recebido pela `stream` no momento em que adicionamos via controller estará;
  - Dessa forma podemos verificar a instância do mesmo para identificar que estado foi retornado pela stream e realizar qualquer ação com base no mesmo e nas suas priopriedades;
  - É necessário sempre realizar o `close()` do `StreamController` no `dispose()` da página, podendo ser diretamente ou acessando o `sink` do mesmo;
  - Exemplo:

    ```dart
      class BlocState {}
      class BlocStateLoading extends BlocState {}

      class BlocPatternController {
        final _streamController = StreamController<BlocState>.broadcast()..add(BlocState());
        Stream<ImcBlocState> get stream => _streamController.stream;

        void startLoading() => _streamController.add(BlocStateLoading());
        void dispose() => _streamController.close();
      }

      class _BlocPatternPageState extends State<BlocPatternPage> {
        final _pageController = BlocPatternController();

        @override
        void dispose() {
          _pageController.dispose();
          super.dispose();
        }

        @override
        Widget build(BuildContext context) {
          return StreamBuilder<BlocState>(
            stream: _pageController.stream,
            builder: (context, snapshot) {
              if (snapshot.data is BlocStateLoading) {
                return const Text('Carregando...');
              }

              return const Text('Realizar ação.');
            },
          );
        }
      }
    ```

## InheritWidgets

- Permite que possamos adicionar uma `Classe`/`Widget` personalizada dentro da árvore do `BuildContext`, podendo assim buscá-la e acessá-la de qualquer ponto da aplicação;
- Exemplo:

  ```dart
  class ImcInheritedWidget extends InheritedWidget {
    final double imc;

    const ImcInheritedWidget({
      super.key,
      required this.imc,
      required super.child,
    });


    @override
    bool updateShouldNotify(covariant ImcInheritedWidget oldWidget) {
      return imc != oldWidget.imc;
    }

    static ImcInheritedWidget of(BuildContext context) {
      final imcInheritedWidget =
          context.dependOnInheritedWidgetOfExactType<ImcInheritedWidget>();

      assert(
        imcInheritedWidget != null,
        'ImcInheritedWidget not exists on BuildContext',
      );

      return imcInheritedWidget!;
    }
  }

  // Usando nossa InheritedWidget na main
  @override
  Widget build(BuildContext context) {
    return ImcInheritedWidget(
      imc: 24,
      child: MaterialApp(
        [...]
  ```

- Caso queiramos definir uma `InheritedWidget` com `reatividade`, extendemos da classe `InheritedNotifier` que extende da `InheritedWidget`. Ao utilizarmos essa classe teremos que definir um `notifier` via `super` e não precisaremos implementar o `@override` de `updateShouldNotify()`;
- Como vimos anteriormente, para notificarmos os `listeners` que ouvem um `ValueNotifier`, apenas precisamos alterar o seu `value`;
- Exemplo:

  ```dart
  class ImcInheritedNotifier extends InheritedNotifier<ValueNotifier<double?>> {
    ImcInheritedNotifier({
      super.key,
      required super.child,
    }) : super(
            notifier: ValueNotifier(null),
          );

    double? get imc => notifier?.value;

    void calculateIMC({required double weight, required double height}) {
      notifier?.value = weight / pow(height, 2);
    }

    static ImcInheritedNotifier of(BuildContext context) {
      final imcInheritedNotifier =
          context.dependOnInheritedWidgetOfExactType<ImcInheritedNotifier>();

      assert(
        imcInheritedNotifier != null,
        'ImcInheritedNotifier not exists on BuildContext',
      );

      return imcInheritedNotifier!;
    }
  }

  // Usando nossa InheritedNotifier na main
  @override
  Widget build(BuildContext context) {
    return ImcInheritedNotifier(
        child: MaterialApp(
            [...]
  ```
