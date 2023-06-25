# Flutter primeiro projeto - Academia do Flutter

## MediaQuery

- A classe `mediaQuery` é responsável por disponibilizar todos os tamanhos relacionados à nossa tela, tais como:
  - Largura e Altura total disponível para a tela;
  - Largura e Altura da barra de notificações;
  - Largura e Altura da `appBar` e `bottomNavigationBar`, etc.

## Constraints

- São valores restritivos definidos sempre pelo elemento pai, dessa forma o pai sempre irá definir e repassar para o filho as seguintes restrições:
  - `maxHeight` e `maxWidth`;
  - `minHeight` e `minWidth`.

## Buttons

- `TextButton` é o botão mais simples existente no Flutter;
- `IconButton` é um botão que obrigatoriamente exibe um ícone;
- `ElevatedButton` é um botão com elevação padrão que veio para substituir o antigo `RaisedButton`;
- `Elevatedbutton.icon` é um elevated sinmilar ao IconButton, que recebe um ícone que será exibido à frente da label do botão.

## Scrolls

- `SingleChildScrollView` é um dos mais populares Widgets utilizados para gerar um scroll em páginas, geralmente é utilizado logo após o Scaffold para definir o scroll na página inteira;
- `ListView` é outro Widget com essa funcionalidade e que fornece algumas variações:
  - `ListView.builder()` é utilizado para buildar grandes listas sem perder performance e gerar lags na utilização do aplicativo, pois esse método builder gera somente o que está prestes a ser exibido em tela, evitado renderizações desnecessárias. O mesmo também desrenderiza elementos da lista que ficaram para trás, renderizando novamente conforme o usuário utilize o scroll voltando para elementos que já não estavam mais em tela;
  - `ListView.separated()` é similar ao anterior porém recebe um segundo builder que gera um separador entre os itens da lista.

## Dialogs

- Existem diferentes tipos de dialogs no `Flutter`, sendo algumas com padrões pré-definidos mas 100% personalizáveis:
  - `Dialog` é a classe default que utilizamos para criarmos um dialog customizado do total zero;
  - `SimpleDialog` como o próprio nome já diz é um dialog simples com alguns padrões definidos;
  - `AlertDialog` nos permite adicionar botões de ações de maneira fácil ao dialog;
  - `TimePicker` nos permite exibir o Time picker default do SO do usuário, solicitando que o mesmo selecione uma hora do dia;
  - `DatePicker` nos permite exibir o Date picker default do SO do usuário, solicitando que o mesmo selecione uma data de um determinado ano;
  - `AboutDialog` nos permite vizualizar facilmente todas as licenças no aplicativo.
- Para exibirmos uma `Dialog` utilizamos o método `showDialog()` e o seu builder. As 3 últimas dialogs da sublista acima não precisam desse método para serem exibidas;
- Para fecharmos uma `Dialog` utilizamos o `Navigator.pop()`, pois o comportamento do `Flutter` ao exibir uma dialog é semelhante ao de exibir uma nova página, adiciona o elemente à pilha;
- Como utilizamos o `Navigator` para abrir e fechar dialogs, podemos esperar uma resposta de um dialog utilizando do conceito de `async await`, assim como nas navegações entre páginas.

## BuildContext

Classe utilitária dentro do `Flutter` onde está registrado todos os Widgets da nossa estrutura.

- Todas as classes com o método `build` estão registradas dentro do `BuildContext`. Ou seja, todo `Widget` vai receber no seu construtor o `BuildContext`, pois precisa registrar na árvora de componentes;
- O `BuildContext` serve para nos ajudar a encontrar uma instância mais próxima de uma classe, widget ou informação de uma maneira bem mais simples;
- No caso em que solicitamos uma informação do nosso tema em determinado `Widget` utilizando o `Theme.of(context)` por exemplo, percorremos toda a árvore de Widgets acima do mesmo buscando pela instância mais próxima do `Theme` definida, a primeira encontrada será retornada;
- Uma página ou Widget só é registrada dentro do BuildContext após terminar de executar o método build. Por isso não conseguimos acessar o BuildContext antes da página ser montada;
- Podemos "esperar" para acessar uma instância mais recente na árvore do `BuildContext` utilizando o Widget `Builder`.
  - Por exemplo, se em uma mesma página definimos uma nova instância de `ThemeData` e temos um `Widget` filho que recupera uma instância de `ThemeData`, podemos utilizar o `Builder` para esperar o novo tema ser definido da árvore de contextos, receber o novo contexto e recuperar a nova instância de `ThemeData` definida na própria página, pois nesse momento é a mais próxima na árvore.

## Formulários

- O `TextField` é a forma mais simples disponível para trabalhar com campos de texto, o mesmo não disponibiliza algumas ações como validações e `onSaved`, por exemplo:
  - Para recuperamos o valor do campo, utilizamos o método `onChanged`.
- O `TextFormField` é um pouco mais complexo e conta com mais ações disponíveis, tais como validações, `onSaved` e etc:

  - Utilizado quando precisamos de formulários mais complexos, com validações necessárias e etc;
  - Para relizar uma validação definimos uma função de callback para o campo `validate`, retornando uma `String` com uma mensagem de erro caso a validação falhe, ou `null` caso nenhum erro seja encontrado;
  - Também podemos definir um `autoValidateMode` para um campo, são eles:
    - `always`;
    - `disabled`;
    - `onUserInteraction`.
  - Cada campo desse tipo também pode receber um controlador do tipo `TextEditingController` que fica responsável por receber os valores dos mesmos:
    - Esses controladores precisam ser descartados no `dispose()` da página ou `Widget` onde são utilizados.
  - Podemos personalizar um campo através do `decoration`, definindo para essa propriedade um `InputDecoration`:
    - A propriedade `isDense` permite diminuir um pouco o espaço interno (`Padding` vertical) dos campos.
  - Caso queiramos que a quantidade de linhas do campo aumente de acordo com que foi digitado, podemos passar `null` para a propriedade `maxLines`;
  - Nesse caso podemos causar um problema de `overflow`, com isso é interessante ao utilizar essa propriedade dessa maneira, inserirmos o nosso `Form` dentro de um `SingleChildScrollView`.
  - Podemos remover o foco de um campo de texto utilizando o `FocusScope.of(context).unfocus()`;
  - Para escondermos o valor digitado em `TextFormField` para criarmos um campo de senha, passamos `true` para a propriedade `obscureText`.

- O `Form` é a `Widget` de formulário disponível no `Flutter`. Podemos ter acesso ao estado do mesmo através da sua `key`:

  ```dart
  final formKey = GlobalKey<FormState>();

  Form(
    key: formKey,
    child: [...]
  );
  ```

  - Cada `GlobalKey()` só pode ser atribuída a um único `Form`.

## Lendo arquivos locais

- Podemos realizar o carregamento de arquivos locais utilizando uma instância de `AssetBundle` chamada de `rootBundle`;
- A mesma disponibiliza alguns métodos de carregamento de assets, tais como:
  - `.load()` utilizado para ler arquivos binários;
  - `.loadBuffer()` utilizado para ler arquivos binários imutáveis;
  - `.loadString()` utilizado para ler `Strings` como arquivos `.json` por exemplo;
  - `.loadStructuredData()` utilizado para ler `Strings` e receber uma função que a converte diretamente para o formato esperado.
