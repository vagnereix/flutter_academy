# Dart consumo de API - Academia do Flutter

## Modelo:

- Um `Model` é basicamente a representação de um objeto complexo de um `JSON` na forma de `Class`;
- São objetos que transportam dados entre processos a fim de reduzir o número de chamadas de métodos;
- Também podem ser chamados de `modelos de domínio`, pois representam diretamente os dados vindo do banco de dados.

## DTO (Data Transfer Object):

- `DTO`s são estruturas de dados planas, que não possuem regras de negócio;
- Tem como objetivo principal, reduzir as viagens de ida e volta ao servidor agrupando vários parâmetros em uma única chamada;
- Também podem ser chamados de `modelos de representação` ou `transferência`, pois geralmente contém apenas dados que deverão ser exibidos para os usuários em um determinado momento.

## Repositório:

- Um `Repository` é responsável por centralizar buscas de dados;
- Não tem nenhuma outra função além de realizar buscas.

## Serialização e Desserialização:

- O conceito de `serialization` consiste em traduzir a estrutura de um objeto para um formato específico que pode ser armazenado e transferido;
- `.toJson()` é o método que converte um `Map<String, dynamic>` para um `JSON` por meio do pacote `dar:convert` utilizando o método `json.encode()`;
- `.toMap()` é o método que converte um `Model` para um `Map<String, dynamic>`;
- `.fromMap()` é o método que converte um `Map<String, dynamic>` para um `Model`.
