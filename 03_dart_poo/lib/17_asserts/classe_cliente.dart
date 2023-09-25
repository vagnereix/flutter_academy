class Cliente {
  String? nome;
  String? cpf;

  String? razaoSocial;
  String? cnpj;

  Cliente({
    this.nome,
    this.cpf,
    this.razaoSocial,
    this.cnpj,
  })  : assert(
          (cpf != null)
              ? nome != null && razaoSocial == null && cnpj == null
              : true,
          'Você enviou CPF junto com CNPJ.',
        ),
        assert(
          (cnpj != null)
              ? razaoSocial != null && nome == null && cpf == null
              : true,
          'Você enviou CNPJ junto com CPF.',
        );

  @override
  String toString() {
    return 'Cliente(nome: $nome, cpf: $cpf, razaoSocial: $razaoSocial, cnpj: $cnpj)';
  }
}