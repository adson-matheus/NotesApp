import 'package:flutter/material.dart';

class AddAnotacao extends StatefulWidget {
  const AddAnotacao({Key? key}) : super(key: key);

  @override
  _AddAnotacaoState createState() => _AddAnotacaoState();
}

class _AddAnotacaoState extends State<AddAnotacao> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
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
                const Fields(type: 'Título', maxLines: 2),
                Container(height: 20),
                const Fields(type: 'Anotação', maxLines: 20),
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
  //String? anotacao = '';

  const Fields({Key? key, this.type, this.maxLines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
