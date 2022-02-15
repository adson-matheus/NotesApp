import 'package:app_anotacoes/edit_anotacao.dart';
import 'package:flutter/material.dart';

import 'app_controller.dart';

class NoteDetail extends StatelessWidget {
  final int index;
  // ignore: use_key_in_widget_constructors
  const NoteDetail(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const LateralPage(),
      appBar: AppBar(
        title: Text('NotesApp - ' + NoteReceiver.instance.titulo[index]),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              EditDados.instance.dados(NoteReceiver.instance.titulo[index],
                  NoteReceiver.instance.texto[index]);
              Navigator.pushReplacementNamed(context, '/edit_anotacao',
                  arguments: index);
            },
          ),
          Container(
            width: 10,
          ),
          IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: const Text('Excluir?'),
                          content: const Text('Realmente deseja excluir?'),
                          actions: [
                            TextButton(
                                child: const Text('Não'),
                                onPressed: () => Navigator.pop(context, 'Não')),
                            TextButton(
                                child: const Text('Sim'),
                                onPressed: () {
                                  NoteReceiver.instance.deleteNote(index);
                                  Navigator.pushReplacementNamed(
                                      context, '/list_anotacao');
                                }),
                          ],
                        ));
              }),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  NoteReceiver.instance.titulo[index],
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                heightFactor: 2,
                alignment: Alignment.bottomLeft,
                child: Text(
                  NoteReceiver.instance.dateToString(index),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                height: 24,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  NoteReceiver.instance.texto[index],
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
