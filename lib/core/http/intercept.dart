import 'dart:convert';
import 'package:desafio/servicos/usuario/usuario_servico.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class PrincipalInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var token = await obtenhaToken();
    if (token.isNotEmpty) {
      options.headers['Authorization'] = genToken(token);

      if (options.data is FormData) {
        if ((options.data as FormData).files.isNotEmpty) {
          options.headers['Content-Type'] = 'multipart/form-data';
        }
      }
    }
    if (kDebugMode) _logDegubMode(options);

    return super.onRequest(options, handler);
  }
}

Future<String> obtenhaToken() => const UsuarioServico().obtenhaToken();

String genToken(String token) => 'Bearer $token';

void _logDegubMode(RequestOptions options) {
  debugPrint(jsonEncode('BaseURL: ${options.baseUrl}'));
  debugPrint(jsonEncode('Endpoint: ${options.path}'));
  if (options.headers['Authorization'] != null) {
    debugPrint("Authorization: ${options.headers['Authorization']}");
  }
  if (options.data != null) {
    try {
      debugPrint('Payload ${jsonEncode(options.data)}');
    } catch (ex) {
      debugPrint('Payload ${options.data?.toString()}');
    }
  }
}