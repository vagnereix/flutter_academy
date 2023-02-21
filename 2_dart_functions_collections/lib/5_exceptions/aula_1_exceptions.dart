void main() {
  final idadeCorreta = '24';
  final idadeIncorreta = '24 anos';

  String? nome;

  try {
    final idadeConvertida = int.parse(idadeCorreta);

    if (idadeConvertida == 24) throw Exception();

    int.parse(idadeIncorreta);

    nome!.toLowerCase();
  } on FormatException catch (error, stacktrace) {
    // Sempre adicionar o tratamento de excessões específicas acima do catch geral.
    // Existe uma hierarquia nas excessões que sempre precisa ser seguida.
    // Utilizando o stacktrace podemos rastrear de forma mais fácil o erro encontrado.

    print('Erro ao realizar conversão. $error, $stacktrace');
  } on TypeError {
    // Em excessões específicas não precisamos usar o catch.

    print('Erro de tipagem.');
  } on Exception {
    print('Excessão gerada manualmente.');
  } catch (error, stacktrace) {
    print('Erro genérico. $error, $stacktrace');
  } finally {
    // Esse trecho de código sempre vai ser executado, independente de
    // casos de sucesso ou disparo de excessões.

    print('Finalizando execução de tratamentos.');
  }
}
