# Dart Async - Academia do Flutter

## Event Loop:

- A fila de execução do `Event Loop` utiliza o conceito de `FIFO`, primeiro a entrar, primeiro a sair;
- A função `main` sempre tem prioridade total na ordem de execução;
- Após a execução da main o `Event Loop` estará disponível para executar outros agendamentos;
- A função `scheduleMicrotask()` agenda uma tarefa no `Event Loop` com maior prioridade, porém sem a possibilidade de tratamento de erros;
- A função `sleep()` nos permite congelar ou bloquear o `Event Loop` durante um período caso seja necessário;

## Sync Proccess:

- O `Event Loop` tem a inteligência de identificar quando uma função está finalizada ou quando ainda está em processamento;
- Para o `Event Loop` só existem dois estados, em `processamento` ou `finalizado`;
- Enquanto um `Future` não for finalizado o `Event Loop` tem a inteligência de não pegar ele para ser processado;
- Nem sempre a ordem de definição das funções será seguida, pois dependerá de quando o `Future` estará finalizado;

## Future:

- Um `Future` assim como o `Event Loop` só identifica dois estados, o de finalizado e o de em processamento;
- Para registrar uma função de callback a ser executada no estado de `sucesso` de um `Future`, utilizamos o método `.then()`;
- Para registrar uma função de callback a ser executada no estado de `erro` de um `Future`, utilizamos o método `.catchError()`;
- Assim como no `try catch`, quando queremos realizar alguma operação idependente do estado, utilizamos o método `.whenComplete()`;

  ```dart
  Future(() {})
      .then((value) {})
      .catchError((onError) {})
      .whenComplete(() {});
  ```

- Dentro do método `.then()` podemos registrar um função de erro utilizado a propriedade `onError`, quer terá o mesmo papel da função de callback registrada via `.catch()`;

  ```dart
  Future<String>(() {})
      .then((value) {
        onError: () {};
      });
  ```

- Quando o `onError` é registrado, o `Dart` ignora o `.catchError()` a não ser que na mesma também ocorra um erro;
- Podemos registar uma função de callback via `.catchError()` para tipos específicos de erro utilizando a propriedade `test`:

  ```dart
  Future<String>(() {})
      .catchError((value) {
        onError: () {};
      }, test: (error) => error is UnsupportedError);
  ```

## Future API:

- Com o construtor `Future.sync()` usamos a API de Futuros do `Dart` para agendar um evento dentro do `Event Loop` e, ao mesmo tempo executar a função definida através do construtor sem a necessidade esperar a próxima interação do mesmo. Porém o tratamento de `sucesso` ou `erro` definido através dos métodos `.then()` e `.catchError()` serão executados `imediatamente` na próxima interação do `Event Loop`;
- Com o construtor `Future.microtask()` usamos a API de Futuros do `Dart` para agendar um evento dentro do `Event Loop` com prioridade, similar ao `scheduleMicrotask()` visto anteriormente. A principal diferença é que usando esse construtor temos a possibilidade do tratamento de erros;
- Como já sabemos um `Future` é constituído por 3 estados, em processamento, sucesso e erro. Com o construtor `Future.value()` usamos a API de Futuros do `Dart` para criar um `Future` já completo com o estado de `sucesso`;
- Com o construtor `Future.error()` usamos a API de Futuros do `Dart` para criar um `Future` já completo com o estado de `erro`;
- Com o construtor `Future.wait()` usamos a API de Futuros do `Dart` para criar um `Future` que esperará um conjunto de `Future` serem executados, concedendo o retorno apenas quando o último for concluído.

  - Por padrão caso algum `Future` retorne um erro, nenhum outro `Future` será executado ou terá seu valor retornado;
  - Para executar alguma ação ou simplesmente não perder o que foi processado em todos os outros casos de sucesso do `Future.wait()`, podemos definir uma função de callback `cleanUp` onde a mesma só será executada quando houver alguma `Future` gerando uma excessão, caso contrário ela não será executada;
  - Mesmo que algum `Future` gere uma excessão, por padrão o `Future.wait()` vai esperar o último `Future` terminar sua execução para exibir o erro;
  - Para interromper a execução caso um primeiro erro surja, podemos utilizar o parâmentro `eagerError` como `true`, dessa forma ao encontrar um erro, o `Future.wait()` irá interromper o restante dos processos e retorná-lo;

<br />

- Com o construtor `Future.any()` usamos a API de Futuros do `Dart` para criar um `Future` que esperará o primeiro `Future` de uma `List` ser executado, concedendo o retorno assim que o primeiro deles for concluído;
  - Assim como o `Future.wait()` esse contrutor não cancela os outros Futuros após o primeiro ser executado e retornado, ele apenas os ignora;

## Async Await:

- Quando usamos o `async` em uma função, o `Dart` entende automaticamente que o retorno precisará ser um `Future.value()`:

  ```dart
  Future<String> funcao_1() async {
    return 'Retorno da função 1.';
  }
  // Faz o mesmo que a função acima
  Future<String> funcaoSimilarFuncao_1() {
    return Future.value('Retorno da função 1.');
  }
  ```

- O `await` nos permite esperar diretamente um `valor` de um `Future`. Com ele agendamos no `Event Loop` um `Future` a ser executado, e aguardamos a resposta da execução desse agendamento;

  ```dart
  void main() {
    // 0. Inicia execução
    print('Inicio da funcão main.');

    // 1. Chama o Future totalAlunos
    final totalDeAlunosADF = totalAlunos();

    // 3. Future ainda em processamento, define o Callback de sucesso
    totalDeAlunosADF.then((value) {
      // 6. Executa o Callback de sucesso
      print('Total de alunos: $value');
    });

    // 4. Continua
    print('Fim da funcão main.');
  }

  Future<int> totalAlunos() async {
    // 2. Agenda no Event Loop o Future a ser executado
                  // Usando o await recebemos diretamento o int
                  // e não a instância Future<int>
    final total = await Future.value(200);

    // 5. Executa o Future agendado e retorna com estado de sucesso
    return total;
  }
  ```

- Ao definirmos a função `main` como `async`, ela deixa de ter prioridade no `Event Loop` e ao usarmos o `await` dentro dela, liberamos o mesmo para seguir com os agendamentos:

  ```dart
  // Deixa de ter prioridade no Event Loop
  void main() async {
    print('Inicio da funcão main.');

    // Recebe o Future getId incompleto e libera o
    // Event Loop para executá-lo
    final id = await getId();
    // Libera o Event Loop para executar o getNome
    final nome = await getNome(id);

    print(nome);

    print('Fim da funcão main.');
  }
  ```

- Ao chamarmos um `Future`, de início o mesmo sempre é retornado com estado `incompleto` ou em `processamento`, após a conclusão desse `Future`, então ele é retornado `finalizado` de acordo com seu status;
- Quando utilizamos o `async await` podemos realizar o tratamento de erros de forma natural através do `try catch`, pois ao utilizar desse conceito é como se estivéssemos tornando a nossa programação assíncrona em síncrona, por mais que agora já saibamos como tudo funciona por baixo dos panos;
- Um `Future` registrando no `Event Loop` não poderá ser cancelado;
- Podemos utilizar o método `.timeout()` em um `Future` para verificar se um futuro não terminou em um determinado período de tempo;
- O `timeout` apenas vai nos informar se um `Future` não terminou no período estipulado, mas não vai cancelar esse futuro ou removê-lo do `Event Loop`, até porque como foi citado acima, uma vez registrado não pode ser cancelado;

## Completer:

- Com a API de `Completer` nós podemos trabalhar com a mesma API de `Futuros` mas nós temos o poder de `controlar` quando que um Futuro vai ser completado com `sucesso` ou com `erro`;
- Interessante para utilizar em casos que precisaríamos receber diferentes callbacks para tratar cada estado de um `Future`.
