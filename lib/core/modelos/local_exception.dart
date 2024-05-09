import 'dart:async';

import 'package:desafio/componentes/widgets/indicador_processamento.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LocalException implements Exception {
  const LocalException(this.mensagem, {this.exibir = true, this.unauthorized = false});
  final String mensagem;
  final bool exibir;
  final bool unauthorized;

  static Exception trataExService(error, [String labelErroPadrao = "Falha de comunição", bool exibir = true]) {
    if (error is LocalException) {
      return throw error;
    }
    if (error is DioError) {
      return throw LocalException(
        error.response?.data ?? labelErroPadrao,
        exibir: exibir,
        unauthorized: error.response?.statusMessage == 'Unauthorized',
      );
    }
    return throw FormatException(labelErroPadrao);
  }

  static Future<String> trataExView(
    error,
    BuildContext context, [
    FutureOr<dynamic> Function()? callback,
  ]) async {
    bool exibir = true;
    String rt =  "Falha de comunicação!";
    if (error is LocalException) {
      exibir = error.exibir;
      rt = error.exibir ? error.mensagem : rt;
    }

    if (exibir) {
       mostrarFlushbarErro(context, rt);
    }
    if (callback != null) await callback();
    return rt;
  }

  static Future<void> trataExViewContext(error, BuildContext context) async {
    String mensagem = 'Falha de comunicação';
    if (error is LocalException && error.exibir) {
      mensagem = error.mensagem;
    } else if (error is FormatException) {
      mensagem = error.toString();
    }
     mostrarFlushbarErro(context, mensagem);
  }
}
