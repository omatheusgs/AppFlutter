import 'dart:convert';

class Usuario {
  int id;
  String token;
  String usuario;

  Usuario({
    required this.id,
    required this.token,
    required this.usuario
  });

  factory Usuario.fromMap(Map<String, dynamic> dadosBasicos) {
    return Usuario(
      id: dadosBasicos['codigo'],
      token: dadosBasicos['token'],
      usuario: dadosBasicos['login'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> rt = {};

    rt['id'] = id;
    rt['token'] = token;
    rt['usuario'] = usuario;

    return rt;
  }

  factory Usuario.fromJson(String value) => Usuario.fromMap(json.decode(value));
  // factory Usuario.fromJson(String value) => Usuario.fromMap(json.decode(json.encode(value)));
  // factory Usuario.fromJson(String value) => Usuario.fromMap(jsonDecode(value));
}
