void main() {
  final caixaBrinquedos = Caixa<Brinquedo>();
  caixaBrinquedos.item = Brinquedo();
  print(caixaBrinquedos.alturaMaximaDoItem());

  final caixaPerifericos = Caixa<Periferico>();
  caixaPerifericos.item = Periferico();
  print(caixaPerifericos.alturaMaximaDoItem());
}

class Caixa<T extends Item> {
  T? _item;

  T? get item => _item;
  set item(T? item) {
    if (item != null) {
      _item = item;
    }
  }

  double alturaMaximaDoItem() {
    return _item?.alturaMaximaPermitida() ?? 0.0;
  }
}

class Brinquedo extends Item {
  @override
  double alturaMaximaPermitida() {
    return 50.5;
  }
}

class Periferico extends Item {
  @override
  double alturaMaximaPermitida() {
    return 25.5;
  }
}

abstract class Item {
  double alturaMaximaPermitida();
}
