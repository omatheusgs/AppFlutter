import 'dart:convert';
import 'package:desafio/core/modelos/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioServico  {
  const UsuarioServico();

  Future<String> obtenhaToken() async => await fromSp();

  Future<void> setUsuarioLocal(Usuario usuario) async => salvarToken(usuario);

  String toJson(Usuario usuario) => json.encode(usuario);

  Future salvarToken(Usuario usuario) async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    await salvarUsuarioId(usuario.id);
    String key = 'token';
    String value = usuario.token;
    await _sharedPreferences.setString(key, value);
  }

  Future<void> salvarUsuarioId(int usuarioId) async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    String key = 'usuarioId';
    int value = usuarioId;
    await _sharedPreferences.setInt(key, value);
  }

  Future limparUsuario() async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.remove('usuarioId');
    _sharedPreferences.remove('token');
  }

  static Future<String> fromSp() async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    String stringToken = _sharedPreferences.getString('token') ?? '';

    return stringToken;
  }

}
