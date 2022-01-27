import 'package:flutter/material.dart';

class AddAnotacao extends StatefulWidget {
  const AddAnotacao({Key? key}) : super(key: key);

  @override
  _AddAnotacaoState createState() => _AddAnotacaoState();
}

class _AddAnotacaoState extends State<AddAnotacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Adicionar Anotação'),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Fields(
                  title: 'Título',
                  maxLines: 2,
                ),
                Container(height: 20.0),
                const Fields(
                  title: 'Minha anotação',
                  maxLines: 10,
                ),
              ],
            ),
          ),
        ));
  }
}

class Fields extends StatelessWidget {
  final String? title;
  final int? maxLines;

  const Fields({Key? key, this.title, this.maxLines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      autofocus: true,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        labelText: '$title',
        border: const OutlineInputBorder(),
      ),
    );
  }
}
