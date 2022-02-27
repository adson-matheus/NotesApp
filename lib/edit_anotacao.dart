import 'package:app_anotacoes/models/anotacao.dart';
import 'package:app_anotacoes/principal.dart';
import 'package:flutter/material.dart';

import 'app_controller.dart';
import 'nova_anotacao.dart';

class EditNote extends StatelessWidget {
  final Map<String, dynamic> note;
  final _formKey = GlobalKey<FormState>();
  final titulo = TextEditingController(text: EditDados.instance.titulo);
  final texto = TextEditingController(text: EditDados.instance.texto);

  EditNote({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LateralPage(),
      appBar: AppBar(
        title: const Text('Editar Anotação'),
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
                  const SnackBar(content: Text('Editado com sucesso!')),
                );
                var n = Note(
                    id: note['id'],
                    titulo: titulo.text,
                    texto: texto.text,
                    dataCriacao: note['dataCriacao'],
                    done: note['done']);
                CrudNotes.instance.updateNote(n);
                //NoteReceiver.instance.editNote(id, titulo.text, texto.text);
                //Navigator.of(context).pushReplacementNamed('/list_anotacao');
                Navigator.of(context).popAndPushNamed('/list_anotacao');
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

class EditDados {
  static EditDados instance = EditDados();

  String? titulo;
  String? texto;

  dados(titulo, texto) {
    this.titulo = titulo;
    this.texto = texto;
  }
}
