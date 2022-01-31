import 'package:flutter/material.dart';

import 'app_controller.dart';
import 'principal.dart';

class AddAnotacao extends StatefulWidget {
  const AddAnotacao({Key? key}) : super(key: key);

  @override
  _AddAnotacaoState createState() => _AddAnotacaoState();
}

class _AddAnotacaoState extends State<AddAnotacao> {
  final _formKey = GlobalKey<FormState>();
  final titulo = TextEditingController();
  final texto = TextEditingController();

  @override
  void dispose() {
    titulo.dispose();
    texto.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LateralPage(),
      appBar: AppBar(
        title: const Text('Adicionar Anotação'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.check,
              semanticLabel: 'Salvar',
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Adicionado com sucesso!')),
                );
                NoteReceiver.instance.addListas(titulo.text, texto.text);
                Navigator.of(context).pushReplacementNamed('/list_anotacao');
              }
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Fields(type: 'Título', maxLines: 2, controllerType: titulo),
                Container(height: 20),
                Fields(type: 'Anotação', maxLines: 20, controllerType: texto),
                Container(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Fields extends StatelessWidget {
  final String? type;
  final int? maxLines;
  final TextEditingController? controllerType;

  const Fields({Key? key, this.type, this.maxLines, this.controllerType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerType,
      maxLines: maxLines,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        hintText: '$type',
        border: const OutlineInputBorder(),
      ),
      //onChanged: (value) => anotacao = value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Preencha o(s) campo(s).';
        }
        return null;
      },
    );
  }
}
