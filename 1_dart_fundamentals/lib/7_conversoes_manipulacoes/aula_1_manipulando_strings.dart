void main() {
  final nome = 'Vagner Reis';

  var subStringNome = nome.substring(0, 6);
  print(subStringNome);

  var subStringSobreNome = nome.substring(7);
  print(subStringSobreNome);

  final sexo = 'Masculino';

  if (sexo.startsWith('M')) print('Masculino');
  if (sexo.toLowerCase().startsWith('m')) print('Masculino');
  if (sexo.toUpperCase().startsWith('M')) print('Masculino');

  if (nome.toLowerCase().contains('reis')) print('É o Cego.');

  // Interpolações.
  print('Olá $nome');
  print('Olá ${nome.toUpperCase()}');

  final url = '/Home /Split /URL';
  url.split('/').forEach(print);
}
