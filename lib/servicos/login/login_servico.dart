import 'dart:async';
import 'package:desafio/core/http/client_http.dart';
import 'package:desafio/core/modelos/credencial.dart';
import 'package:desafio/core/modelos/local_exception.dart';
import 'package:desafio/core/modelos/usuario.dart';

class LoginServico {
  const LoginServico();
  Future<Usuario> autenticar(Credencial usuario) async {
    try {
      final client = await ClienteHttp.getClient();
      final response = await client.post(
        '/v1/usuario/autentiqueusuario',
        data: {
          'usuario':  usuario.usuario,
          'senha': usuario.senha,
        },
      );
      var retorno = Usuario.fromMap(response.data);
      return retorno;
    } catch (error) {
      return throw LocalException.trataExService(error, "Erro ao carregar o usuário");
    }
  }
}