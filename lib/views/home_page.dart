import 'package:desafio/componentes/widgets/app_bar_compomente.dart';
import 'package:desafio/core/modelos/local_exception.dart';
import 'package:desafio/core/modelos/pessoa_provider.dart';
import 'package:desafio/servicos/pessoa/pessoa_servico.dart';
import 'package:flutter/material.dart';
import '../core/modelos/pessoa.dart';
import 'pessoa_cadastro_page.dart';
import 'pessoa_card_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override 
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    carregarPessoas(context).then((value) => carregueProvider());
  }

  // int itemSelecionado = 0;

  Future<void> carregarPessoas(BuildContext context) async {
    try {  
      await PessoaServico().carregarPessoas(context);
    } catch (error) {
       LocalException.trataExViewContext(error, context);
    }
  }

  List<Pessoa>? pessoas = [];
  int pessoasLength = 0;

  carregueProvider() {
      PessoaProvider pessoaProvider = PessoaProvider.of(context) as PessoaProvider;
      pessoas = pessoaProvider.pessoas;
      pessoasLength = pessoas!.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarComponente().buildAppBar(context, 'LISTA DE PESSOAS', false),
        body: ListView.builder(
          itemCount: pessoasLength,
          itemBuilder: (BuildContext context, index) => 
            Container(
              child: PessoaCard(pessoa: pessoas![index], index: index),
            )
            // children: [
            //     if (lista?.isNotEmpty == true)
            //      ...lista!.map((p) => PessoaCard(pessoa: p)).toList()
            // ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 0, 190, 127),
            child: const Icon(Icons.group_add_rounded, color: Colors.white,),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PessoaCadastroPage())),
          ),
        );
  }
}