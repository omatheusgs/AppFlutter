import 'package:desafio/core/modelos/pessoa.dart';
import 'package:desafio/core/modelos/pessoa_provider.dart';
import 'package:desafio/views/pessoa_cadastro_page.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class PessoaCard extends StatelessWidget {
  final Pessoa pessoa;
  int index;
  PessoaCard({
    required this.pessoa,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const bordaPadrao = Radius.circular(4);

    PessoaProvider pessoaProvider = PessoaProvider.of(context) as PessoaProvider;
    List<Pessoa> pessoas = pessoaProvider.pessoas;
    int pessoasLength = pessoas.length;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 8,
        clipBehavior: Clip.hardEdge,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(bordaPadrao),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: bordaPadrao,
                  topRight: bordaPadrao,
                ),
                color: Color.fromARGB(255, 160, 255, 223),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      pessoa.nome,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 0, 141, 94),
                      ),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.only(bottom: 2),
                    onPressed: () {
                      pessoaProvider.pessoaSelecionada = pessoa;
                      pessoaProvider.indexPessoa = index;
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => new PessoaCadastroPage(),
                        ),
                      );
                    }, 
                    icon: Icon(Icons.edit, color: Color.fromARGB(255, 0, 141, 94), size: 25)),
                ],
              ),
            ),
            Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 8, top: 8),
                            child:  Icon(
                              Icons.date_range,
                              size: 20,
                              color: Color.fromARGB(255, 0, 190, 127),
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.only(right: 8, top: 8),
                              child: Text(
                                'CPF: ',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 0, 141, 94),
                                    fontWeight: FontWeight.w600),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(right: 8, top: 8),
                            child: Text(
                              pessoa.cpf,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:  EdgeInsets.only(right: 8, top: 8),
                            child:  Icon(
                              Icons.date_range,
                              size: 20,
                              color: Color.fromARGB(255, 0, 190, 127)
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 8, top: 8),
                            child: Text(
                              'UF: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 0, 141, 94),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8, top: 8),
                            child: Text(
                              pessoa.uf.toUpperCase(),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 8, top: 8),
                            child: Icon(
                              Icons.manage_accounts,
                              size: 20,
                              color: Color.fromARGB(255, 0, 190, 127),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 8, top: 8),
                            child: Text(
                              'Data de Nascimento: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 0, 141, 94),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 8, top: 8, bottom: 8),
                            child: Text(
                              pessoa.dataDeNascimento,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
