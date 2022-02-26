import 'dart:ffi';

import 'package:app_anotacoes/edit_anotacao.dart';
import 'package:flutter/material.dart';

import 'app_controller.dart';

class NoteDetail extends StatelessWidget {
  final Map<String, dynamic> note;

  const NoteDetail(this.note);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const LateralPage(),
      appBar: AppBar(
        title: Text('NotesApp - ' + '${note['titulo']}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // EditDados.instance.dados(NoteReceiver.instance.titulo[index],
              //     NoteReceiver.instance.texto[index]);
              // Navigator.pushReplacementNamed(context, '/edit_anotacao',
              //     arguments: index);
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
                                  //NoteReceiver.instance.deleteNote(index);
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
        child: ListView(
          children: [
            Card(
              margin: EdgeInsets.all(12),
              color: Colors.white,
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        note['titulo'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      heightFactor: 2,
                      alignment: Alignment.bottomRight,
                      child: Text(
                        note['dataCriacao'],
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        note['texto'],
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                    ),
                    //UseCheckBox(index: index),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UseCheckBox extends StatelessWidget {
  final int index;
  const UseCheckBox({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: NoteReceiver.instance,
      builder: (context, child) => Card(
        elevation: 12,
        margin:
            const EdgeInsets.only(left: 90, right: 90, top: 100, bottom: 20),
        child: TextButton(
            onPressed: () {
              NoteReceiver.instance.isDone(index);
              //verifica se esta concluido ou nao, e muda a msg.
              NoteReceiver.instance.done[index]
                  ? ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.teal,
                          content: Text(
                            'Concluído! "${NoteReceiver.instance.titulo[index]}"',
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  : ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.red,
                          content: Text(
                            'Não concluído! "${NoteReceiver.instance.titulo[index]}"',
                            style: TextStyle(color: Colors.white),
                          )),
                    );
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: NoteReceiver.instance.done[index]
                    ? <Widget>[
                        const Text('Não Concluído ',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        const Icon(
                          Icons.cancel_outlined,
                          color: Colors.red,
                          size: 24,
                        ),
                      ]
                    : <Widget>[
                        const Text('Concluído',
                            style: TextStyle(
                              fontSize: 16,
                            )),
                        const Icon(
                          Icons.check_box_rounded,
                          size: 24,
                        ),
                      ])),
      ),
    );
  }
}
