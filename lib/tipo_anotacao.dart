import 'package:flutter/material.dart';

import 'principal.dart';

class TipoAnotacao extends StatelessWidget {
  const TipoAnotacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LateralPage(),
      appBar: AppBar(
        title: const Text(
          'Tipo de Anotação - Note App',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Text(
              'Você deseja adicionar uma lista ou uma anotação simples?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  height: 1.5,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold),
            ),
            Column(
              children: <Widget>[
                const NoteTypeButtons(
                  text: 'Anotação simples',
                  path: 'add_anotacao',
                ),
                Container(height: 30),
                const NoteTypeButtons(
                  text: 'Lista',
                  path: '',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NoteTypeButtons extends StatelessWidget {
  final String? text;
  final String? path;

  const NoteTypeButtons({Key? key, this.text, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        '$text',
      ),
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.teal,
        elevation: 10,
        textStyle: const TextStyle(fontSize: 20),
        padding: const EdgeInsets.all(20.0),
      ),
      onPressed: () => Navigator.popAndPushNamed(context, '/$path'),
    );
  }
}
