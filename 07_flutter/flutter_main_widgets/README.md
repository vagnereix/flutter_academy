# Flutter fundamentos - Academia do Flutter

## Widgets:

- Quase tudo no `Flutter` são `Widgets`, podemos relacionar Widgets com componentes do desenvolvimento `Web`, pequenas partes já prontas para serem utilizadas;
- Existem dois tipos de `Widgets` no Flutter, os `StatelessWidgets` e os `StatefulWidgets`:
  - `StatelessWidgets` é um Widget `sem estado`, basicamente é um componente estático, não consegue ser alterado baseado em uma variável dentro dele mesmo;
  - `StatefulWidgets` é basicamente um Widget `com estado`, pode renderizar de acordo com a alteração desse(s) estado(s) utilizando o método `setState()`.

## Ciclo de vida dos Widgets:

- O ciclo de vida de um `StatelessWidgets` consiste basicamente em um método `construtor` e um método `builder`, onde no momento de ser renderizado em tela, ambos são chamados respectivamente;
- O ciclo de vida de um `StatefulWidgets` consiste em um método `construtor` e um método `createState` responsável por criar de fato o estado desse `Widget`:
  - O método `createState` recebe por `<generics>` o `StatefulWidget` do estado a ser criado;
  - Na criação desse estado é chamado outro construtor para o mesmo;
  - Logo em seguida é chamado o método `initState()`, responsável por carregar o valor de um estado na inicialização do Widget caso necessário;
  - Em seguida é chamado o método `didChangeDependencies`, utilizado para realizar alguma ação antes de atualizar qualquer dependência, pouco utilizado mas útil em casos específicos;
  - Logo após o método `build` do `state` é chamado, é nesse momento que o `Widget` é renderizado em tela. É esse método que é chamado sempre que o `setState()` é acionado;
  - Por fim podemos realizar alguma ação ao sairmos de uma tela utilizando o método `dispose()`. Comumente utilizado para cancelar `listeners` ou `observers` que não serão mais necessários.
- Quando precisamos realizar uma navegação ou qualquer outra ação que dependa do `BuildContext`, não podemos realizá-la dentro do `initState`, nesse momento ainda não terminamos o `build` do `Widget` e por isso não temos acesso ao mesmo. Nesses casos podemos utilizar o método `addPostFrameCallback`, o mesmo é chamado após a tela estar pronta ou renderizada, nesse momento já temos acesso ao `BuildContext` necessário para a ação desejada.
  - Para utilizar esse método precisamos acessar uma instância de `WidgetsBinding` e definí-lo enviando uma função de `Callback`.

## Navegação:

A navegação dentro do `Flutter` utiliza o conceito de pilha, ou seja, vamos empilhando uma página acima da outra. Existem 5 tipos de navegação que podem ser utilizadas dentro do `Flutter`, cada uma com sua particularidade, são elas:

- O `push` empilha uma página acima da anterior;
- O `pushAndRemoveUntil` é utilizado quando já temos uma pilha de páginas, utilizando o mesmo ealizamos o `push` de uma nova página mas também podemos remover uma ou mais páginas da pilha ao mesmo tempo;
- O `pushReplacement` é utilizado para substituir uma página por outra, nesse caso realizamos o pop da página atual e o push de uma nova, nessa ordem;
- Esses 3 tipos de navegação podem ser realizadas de forma `nomeada` (passando o nome da rota que chamará uma determinada página), ou chamando diretamente a página através do `MaterialPageRoute`;
- O `popUntil` remove da pilha até uma determinada condição ser satisfeita, podendo remover uma ou mais páginas da pilha;
- O `pop` remove a página atual da pilha e exibe a anterior.
