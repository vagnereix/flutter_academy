void main() {
  var callableClass = EnviarEmail();

  callableClass();
}

class EnviarEmail {
  bool call() {
    print('Chamando método call.');
    return enviar();
  }

  bool enviar() {
    return true;
  }
}
