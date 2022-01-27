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
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Fields(type: 'Título', maxLines: 2),
              Container(height: 20),
              Fields(type: 'Anotação', maxLines: 16),
              Container(height: 20),
              ElevatedButton(
                child: const Text('Enviar'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  elevation: 10,
                  textStyle: const TextStyle(fontSize: 20),
                  padding: const EdgeInsets.all(20.0),
                ),
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
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
        ),
      ),
    );
  }
}

class Fields extends StatelessWidget {
  final String? type;
  final int? maxLines;
  String? anotacao = '';

  Fields({Key? key, this.type, this.maxLines, this.anotacao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      autofocus: true,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        hintText: '$type',
        border: const OutlineInputBorder(),
      ),
      onChanged: (value) => anotacao = value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Preencha o(s) campo(s).';
        }
        return null;
      },
    );
  }
}
