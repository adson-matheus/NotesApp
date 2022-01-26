import 'package:flutter/material.dart';

class Anotacoes extends StatelessWidget {
  const Anotacoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ver Anotações'),
      ),
      body: Container(
          //child: ElevatedButton(
          //onPressed: () => Navigator.pop(context),
          //child: Text('Back'),
          //),
          ),
    );
  }
}
