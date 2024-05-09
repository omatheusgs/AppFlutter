import 'package:desafio/core/modelos/pessoa_provider.dart';
import 'package:desafio/views/checagem_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(options: const FirebaseOptions(
    apiKey: 'key',
    appId: 'id',
    messagingSenderId: 'sendid',
    projectId: 'myapp',
    storageBucket: 'myapp-b9yt18.appspot.com',
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PessoaProvider(
      child: MaterialApp(
        title: 'Desafio API',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(       
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 179, 110)),
          useMaterial3: true,
        ),
        home: const ChecagemPage()
      ),
    );
  }
}