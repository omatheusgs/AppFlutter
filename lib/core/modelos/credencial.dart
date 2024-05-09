import 'dart:convert';

class Credencial {
  const Credencial(this.usuario, this.senha);

  final String usuario;
  final String senha;

  @override
  String toString() {
    return '$runtimeType($usuario, $senha)';
  }

  factory Credencial.fromMap(Map<String, dynamic> v) {
    try {
      return Credencial(v['usuario'], v['senha']);
    } catch (e) {
      throw const FormatException("Usuário inválido");
    }
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> rt = {};
    rt['usuario'] = usuario;
    rt['senha'] = senha;

    return rt;
  }

  static Credencial fromJson(String v) => Credencial.fromMap(jsonDecode(v));
}
