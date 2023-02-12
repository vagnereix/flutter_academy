void main() {
  // A String é composta por 4 campos (Nome|Idade|Profissão|Estado)
  final pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|desenvolvedor|MG',
    'Sandra Silva|40|Desenvolvedor|MG',
    'Regina Verne|35|dentista|MG',
    'João Rahman|55|jornalista|SP',
  ];

  // Baseado no array acima monte um relatório onde:
  // 1 - Apresente os pacientes com mais de 20 anos e print o nome deles
  // 2 - Apresente quantos pacientes existem para cada profissão (desenvolvedor, estudante, dentista, jornalista)
  // 3 - Apresente a quantidade de pacientes que moram em SP

  final pacientesComMaisDeVinteAnos = <String>[];
  var pacientesQueMoramEmSP = 0;
  final desenvolvedores = <String>[];
  final estudantes = <String>[];
  final dentistas = <String>[];
  final jornalistas = <String>[];

  for (var paciente in pacientes) {
    final pacienteInfos = paciente.split('|');

    final nome = pacienteInfos[0];
    final idade = int.parse(pacienteInfos[1]);
    final profissao = pacienteInfos[2].toLowerCase();
    final estado = pacienteInfos[3];

    if (idade > 20) pacientesComMaisDeVinteAnos.add(nome);
    if (estado.toLowerCase().contains('sp')) pacientesQueMoramEmSP++;

    switch (profissao) {
      case 'desenvolvedor':
        desenvolvedores.add(nome);
        break;
      case 'estudante':
        estudantes.add(nome);
        break;
      case 'dentista':
        dentistas.add(nome);
        break;
      case 'jornalista':
        jornalistas.add(nome);
        break;
      default:
        break;
    }
  }

  print('___________________________________________');
  print('Quantidade de pacientes que moram em SP: $pacientesQueMoramEmSP');
  print('___________________________________________');
  print('Pacientes com mais de Vinte Anos: ');
  pacientesComMaisDeVinteAnos.forEach(print);
  print('___________________________________________');
  print('Pacientes desenvolvedores: ');
  desenvolvedores.forEach(print);
  print('___________________________________________');
  print('Pacientes desenvolvedores: ');
  estudantes.forEach(print);
  print('___________________________________________');
  print('Pacientes dentistas: ');
  dentistas.forEach(print);
  print('___________________________________________');
  print('Pacientes jornalistas: ');
  jornalistas.forEach(print);
  print('___________________________________________');
}
