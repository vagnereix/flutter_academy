String? nome;

void main() {
  var sobrenome = 'Reis';
  var nomeCompleto = (nome ?? 'Vagner ') + sobrenome;

  print(nomeCompleto);
}
