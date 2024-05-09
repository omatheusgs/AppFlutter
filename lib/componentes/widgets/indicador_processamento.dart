import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/scheduler.dart';

Flushbar? flush;

SpinKitWave processandoLogin() {
  return SpinKitWave(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.white : Colors.amber,
        ),
      );
    },
  );
}

void limparFlush() {
  try {
    if (flush != null && flush!.isShowing()) {
      flush!.dismiss(true);
    }
    // ignore: empty_catches
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}

void mostrarFlushbarErro(BuildContext context, String mensagem,
    {String titulo = ''}) {
  if (mensagem.isNotEmpty) {
    limparFlush();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) => AlertDialog(
          iconPadding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          icon: const Icon(
            Icons.warning_rounded,
            size: 48,
            color: Color.fromARGB(255, 255, 0, 0),
          ),
          titlePadding: const EdgeInsets.fromLTRB(4, 0, 4, 5),
          title: Text(titulo.isEmpty ? 'Ops, algo deu errado!' : titulo,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
          contentPadding: const EdgeInsets.fromLTRB(4, 5, 4, 12),
          content: Text(mensagem,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 141, 94),
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
          actions: [
            Container(
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 141, 94)),
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(80, 40))),
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK', style: TextStyle(fontSize: 15, color: Colors.white)))),
          ],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
      );
    });
  }
}

void mostrarFlushbarSucesso(BuildContext context, String mensagem) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            iconPadding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            icon: const Icon(
              Icons.check_circle,
              size: 48,
              color: Colors.green,
            ),
            titlePadding: const EdgeInsets.fromLTRB(4, 0, 4, 5),
            title: const Text('Sucesso!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            contentPadding: const EdgeInsets.fromLTRB(4, 0, 4, 10),
            content: Text(mensagem,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 141, 94),
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
          );
        });
  });
}