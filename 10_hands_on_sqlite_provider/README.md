# Hands-on Provier e Sqlite em arquitetura de módulo - Academia do Flutter

## Arquitetura de módulos & MVVM

Arquitetura onde temos uma camada `view`, uma `view model` (um `controller` por exemplo, responsável pelas regras ta `tela` mas não por regras de negócio) e uma camada de `data`.

- `app/core` é onde ficam os arquivos `core` ou comuns da aplicação, componentes genéricos e utilitários disponibilizados para todo o app;
- `app/models` é onde ficam as classes de modelos que trafegam pela aplicação;
- `app/modules` é onde ficam os módulos ou `features` da aplicação como `auth`, `home` e `splash` por exemplo. Podemos dizer que são as páginas da aplicação;
- `app/repositories` é nossa camada de dados responsável por buscar os mesmos de alguma forma, seguindo o padrão `repository pattern`, classes de comunicação que envolvam dados como `Firebase` ou `SQLite` por exemplo;
- `app/services` é a camada de regra de negócio, ou seja, tudo passa pelo `service` antes de chegar ao `repository`.

## Pacote Synchronized

- Utilizando para sincronizar vários processos chamados em um curto espaço de tempo, fazendo com que um aguarde a execução do outro.
