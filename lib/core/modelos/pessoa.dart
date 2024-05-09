import 'dart:convert';

class ListaPessoas {
  late List<Pessoa>? pessoas;
  // final List<Pessoa> _pessoas = [];
  // List<Pessoa> get pessoas => _pessoas;

  // void addEvent(Pessoa pessoa) {
  //   _pessoas.add(pessoa);
  // }

  ListaPessoas({
    required this.pessoas,
  });

  ListaPessoas.fromJson(List<dynamic> json) {
    pessoas = List<Pessoa>.from(json.map((pessoa) => Pessoa.fromMap(pessoa)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pessoas'] = pessoas?.map((v) => v.toJson()).toList();
    return data;
  }
}

class Pessoa {
  int codigo;
  String nome;
  String cpf;
  String uf;
  String dataDeNascimento;

  Pessoa({
    required this.codigo,
    required this.nome,
    required this.cpf,
    required this.uf,
    required this.dataDeNascimento,
  });

  factory Pessoa.fromMap(Map<String, dynamic> dadosBasicos) {
    return Pessoa(
      codigo: dadosBasicos['codigo'],
      nome: dadosBasicos['nome'],
      cpf: dadosBasicos['cpf'],
      uf: dadosBasicos['uf'],
      dataDeNascimento: dadosBasicos['dataDeNascimento'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> rt = {};

    rt['codigo'] = codigo;
    rt['nome'] = nome;
    rt['cpf'] = cpf;
    rt['uf'] = uf;
    rt['dataDeNascimento'] = dataDeNascimento;

    return rt;
  }

  factory Pessoa.fromJson(String value) => Pessoa.fromMap(jsonDecode(value));
}