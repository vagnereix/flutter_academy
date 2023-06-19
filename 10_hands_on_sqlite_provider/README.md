# Hands-on Provier e Sqlite em arquitetura de módulo - Academia do Flutter

## Arquiterura de módulos

- `app/core` é onde ficam os arquivos `core` da aplicação, componentes genéricos e utilitários por exemplo;
- `app/models` é onde ficam as classes simples de modelos que trafegam pela aplicação;
- `app/modules` é onde ficam os módulos do aplicação como `auth`, `home` e `splash` por exemplo. Podemos dizer que são as páginas da aplicação;
- `app/repositories` é onde ficam os repositórios, classes de comunicação que envolvam dados como `Firebase` ou `SQLite` por exemplo;
- `app/services` é a camada de regra de negócio, ou seja, tudo passa pelo `service` antes de chegar ao `repository`.

## Pacote Synchronized

- Utilizando para sincronizar vários processos chamados em um curto espaço de tempo, fazendo com que um aguarde a execução do outro.
