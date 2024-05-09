import 'dart:async';
// import 'dart:ffi';
import 'package:desafio/core/http/client_http.dart';
import 'package:desafio/core/modelos/local_exception.dart';
import 'package:desafio/core/modelos/pessoa.dart';
import 'package:desafio/core/modelos/pessoa_provider.dart';
import 'package:flutter/material.dart';

class PessoaServico {
  PessoaServico();
  Future<ListaPessoas> carregarPessoas(BuildContext context) async {
    try {
      final client = await ClienteHttp.getClient();
      final response = await client.get('/v1/pessoa/consultetodasaspessoas');

      var retorno = ListaPessoas.fromJson(response.data);
      pessoas = retorno.pessoas;

      SalvarPessoas(context, pessoas);

      return retorno;
    } catch (error) {
      return throw LocalException.trataExService(error, "Erro ao carregar as pessoas");
    }
  }

  List<Pessoa>? pessoas;

  void SalvarPessoas(BuildContext context, List<Pessoa>? listaPessoas) {
    PessoaProvider pessoaProvider = PessoaProvider.of(context) as PessoaProvider;

    if (listaPessoas?.isNotEmpty == true){      
      listaPessoas!.forEach((p) {
        var pessoaIndex = pessoaProvider.pessoas.length;
        pessoaProvider.pessoas.insert(pessoaIndex, p);       
        }); 
    }
  }
}