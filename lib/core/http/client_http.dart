import 'dart:io';
import 'package:desafio/core/http/intercept.dart';
import 'package:connectivity/connectivity.dart';
import 'package:desafio/core/modelos/validacao_server.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ClienteHttp extends DioForNative {
  ClienteHttp([BaseOptions? options]) : super(options) {
    interceptors.add(PrincipalInterceptors());
  }

  static Future<ClienteHttp> getClient() async =>
      Connectivity().checkConnectivity().then((connectivityResult) {
        if (connectivityResult == ConnectivityResult.none) {
          throw ValidacaoServer.erroConexao();
        }

        final options = BaseOptions();
        options.baseUrl = dotenv.env['URL_BASE'] ?? '';
        final ClienteHttp dio = ClienteHttp(options);
        dio.httpClientAdapter = IOHttpClientAdapter(createHttpClient: () {
          final HttpClient client =
              HttpClient(context: SecurityContext(withTrustedRoots: false));
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        });
        return dio;
      }).catchError((e) => throw e);
}