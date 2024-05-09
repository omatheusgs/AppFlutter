import 'package:desafio/views/home_page.dart';
import 'package:desafio/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BemVindoPage extends StatefulWidget {
  const BemVindoPage({Key? key}) : super(key: key);

  @override 
  State<BemVindoPage> createState() => _BemVindoPageState();

}

class _BemVindoPageState extends State<BemVindoPage> {

  @override
  void initState() {
    super.initState();
    verificarUsuario().then((temUsuario) {
      if (temUsuario) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<bool> verificarUsuario() async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    String? token = _sharedPreferences.getString('token');

    if (token == null) {
      return false;
    } else {
      return true;
    }

  }
}