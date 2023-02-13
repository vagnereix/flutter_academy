// Importações diretas do 'package' se referem à pasta 'lib' do projeto.
// Podemos realizar um 'alias' para nossas importações, nomeando o arquivo importado.
import 'package:dart_functions_collections/1_funcoes/aula_1_funcoes.dart'
    as funcoes_primeira_aula;

// Também podemos importar de acordo com a posição relativa do arquivo.
import '../1_funcoes/aula_2_parametros.dart';

void main() {
  print(
    'Executando função soma importada, resultado: ${funcoes_primeira_aula.somaInteiros(1, 2)}.',
  );

  print(
    'Nova função soma importada, resultado: ${somaComParametrosObrigatorios(5, 5)}.',
  );
}
