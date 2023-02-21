class Numero {
  int i;
  Numero(this.i);

  Numero operator +(Numero numero_2) {
    return Numero(i + numero_2.i);
  }
}
