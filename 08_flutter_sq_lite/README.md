# Flutter SQLite - Academia do Flutter

## O que seria SQLite?

Um banco de dados com todas as funcionalidades disponíveis mas que roda diretamente no dispositivo do usuário.

- Salva os dados em um arquivo, a ideia é substituir o `FOpen` e não qualquer outro banco de dados;
- Todo o `SQLite` tem menos de 600KB;
- Comumente utilizando quando queremos gravar algo local que ficará dentro do aparelho do usuário (similar ao localStorage na web);
- Quando precisamos de mais facilidade ao buscar informações.

## Configurando o SQLite

- Para criarmos um banco de dados com o `SQLite` precisamos fornecer o caminho de onde o arquivo do banco de daos será armazenado;
- Geralmente utilizamos a função `getDatabasePath()` da biblioteca `sqflite` para pegarmos o caminho de onde o `SQLite` armazena seus bancos e concatenamos esse caminho o uma chave específica com o nome do projeto por exemplo, através da função `join()` da biblioteca `path`;
- Com isso podemos usar a função `openDataBase()` também do `sqflite` passando esse `path` definido anteriormente e a versão atual do banco de dados, além de algumas funções a serem definidas:
  - `onCreate` que será executada apenas na primeira vez que o aplicativo for executado no aparelho, com acesso ao `database` e à versão atual;
  - `onUpgrade` que será executada quando houver um `upgrade` na versão do banco de dados, com acesso ao `database`, à versão anterior e à versão atual;
  - `onDowngrade` que será executada quando houver um `downgrade` na versão do banco de dados, com acesso ao `database`, à versão anterior e à versão atual.
    - Para esse caso o `sqflite` disponibiliza uma função pronta chamada `onDatabaseDowngradeDelete` que deleta todo o banco de dados para ser refeito novamente através da função `onCreate()`.
- Com essas funções podemos atualizar o banco de dados de acordo com a versão anterior;
- Vale lembrar de sempre atualizar a função onCreate() ao realizar um upgrade ou downgrade no banco de dados;

## Lendo banco de dados pelo Android Studio

Podemos ter acesso ao banco de dados e a todos os arquivos do dispositivo ou emulador via `Android Studio`.

- Para acessar o banco de dados basta abrir o projeto e selecionar o dispositivo que está executando o mesmo, em seguida clicar na aba `App Inspection`, logo surgirá uma outra aba chamada `Database Inspector` que listará todas as tabelas do banco de dados do `SQLite` com a possibilidade de executar querys no mesmo;
- Para acessar os arquivos do dispositivo existe uma aba do lado direito do `Android Studio` chamada de `Device Explorer`, clicando na mesma devemos selecionar o dispositivo que queremos inspecionar e veremos todos os diretórios/pastas do mesmo, no caminho `data/data` estarão todos os projetos instalados com seus respectivos arquivos, incluindo os do `SQLite`.

## Backup de arquivos do Android

Por padrão o `Android` realiza um backup de arquivos do seu aplicativo para o `Google Drive`, com isso pode ocorrer de o usuário desinstalar o aplicativo e ao reinstalar acabar utilizando um backup desatualizado, o que poderia gerar algum tipo de problema na execução do mesmo.

Com isso podemos desativar esse backup caso necessário:

- Dentro do arquivo `AndroidManifest` localizando em `android/app/src/main/AndroidManifest.xml` devemos inserir duas propriedades à tag `application`:

  - `android:allowBackup="false"`;
  - `android:fullBackupOnly="false"`.

Dessa forma no aplicativo não terá backup feito para o Google Drive do usuário, e caso o mesmo reinstale o app todo o banco será refeito através da função `onCreate()`.

## Manipulação de dados

Podemos manipular dados utilizando funções que nos auxiliam ou diretamente usando as funções `raw` onde precisamos escrever toda a `query` que será executada no banco de dados.

Funções axiliares:

- db.`insert`;
- db.`update`;
- db.`delete`.

Funções raw:

- db.`rawInsert`;
- db.`rawUpdate`;
- db.`rawDelete`.
