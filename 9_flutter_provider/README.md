# Flutter Provider - Academia do Flutter

O `Provider` é um gerenciador de dependências/estados que os gringos curtem muito utilizar.

- Utiliza o conceito de `InheritedWidget`, com isso precisamos envolver os `Widgets/Classes` que terão acesso aos elementos distribuidos via `Provider` por uma widget que também tem o nome `Provider`, responsável por criar e distribuir todas as classes e objetos:
  - Criamos a instância a ser distribuída através da função `create` que recebe o `context` e retorna a instância desejada já montada.
- Podemos prover várias instâncias ao mesmo tempo utilizando a widget `MultiProvider` ao invés da widget `Provider`, essa widget recebe um array de `providers` que serão distribuidos pela aplicação.
- As instâncias providas pelo pacote `Provider` podem ser recuperados em uma classe/widget de algumas formas:
  - `Provider.of<ClassType>(context)` é a mais comum, que busca uma instância de classe do `Provider`;
  - `context.read<ClassType>()` também busca uma instância do Provider mas não escuta alterações dessa instância, utilizada para recuperar classes e objetos imutáveis;
  - `context.select<ClassType, FieldType>((class) => class.field)` utilizado para recuperar apenas uma propriedade de uma classe instanciada dentro do Provider;
  - `context.watch<ClassType>()` utilizada para recuperar uma instância de classe que seja `ChangeNotifier` (distribuída pela widget `ChangeNotifierProvider` do pacote `Provider`) e ouvir alterações da mesma:
    - Essa forma não é muito recomendada pois renderiza a página inteira quando detecta uma alteração.
  - Para resolver o problema acima, o `Provider` disponibiliza uma widget chamada `Consumer` que implementa um comportamento similar ao da `AnimatedBuilder`, renderizando apenas as widgets que ouvem uma propriedade reativa por meio da mesma.
    - Essa widget ouve alterações da instância inteira, e caso apenas uma propriedade seja alterada, outras partes da página que utilizam essa widget (mesmo que não usem a propriedade alterada) também serão remontadas.
  - Para resolver esse segundo problema, o `Provider` disponibiliza uma outra widget chamada `Selector` , que tem um comportamento similar ao do `context.select` unido ao da widget `Consumer`, onde selecionamos apenas uma propriedade de uma determinada instância para ser ouvida.
    - Dessa forma remontamos as widgets que ouvem alterações por meio dessa estratégia, apenas quando uma propriedade específica de uma instância for alterada;
    - Ainda existe a possibilidade de você decidir quando essas widgets devem ser remontadas ou não, definindo a função `shoulRebuild` que tem acesso ao valor anterior e ao atual da propriedade ouvida.
