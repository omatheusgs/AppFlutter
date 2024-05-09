
import 'package:desafio/core/modelos/pessoa.dart';
import 'package:flutter/cupertino.dart';

class PessoaProvider extends InheritedWidget {
  final Widget child;
  List<Pessoa> pessoas = [];
  Pessoa? pessoaSelecionada;
  int? indexPessoa;

  PessoaProvider(
    {
      required this.child,
    }
  ) : super(child: child);

  static PessoaProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PessoaProvider>();
  }

  bool updateShouldNotify(PessoaProvider widget) {
    return true;
  }
}