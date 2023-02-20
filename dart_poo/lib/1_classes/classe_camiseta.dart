class Camiseta {
  // Atributos de Instância
  String? tamanho;
  String? cor;
  // Atributo de Instância privado
  String? _marca;

  // Atributos de Classe
  static const String atributoDeClasse = "Atributo de classe";
  // Atributo de Classe privado
  static const String _atributoDeClassePrivado = "Atributo de classe privado";
  String? get atributoDeClassePrivado => _atributoDeClassePrivado;

  String? get marca => _marca;
  set marca(String? marca) => marca != null ? _marca = marca : _marca = null;

  String tipoDeLavagem() {
    if (_marca == 'Nike') {
      return 'Não pode lavar na máquina.';
    } else {
      return 'Pode lavar na máquina.';
    }
  }
}
