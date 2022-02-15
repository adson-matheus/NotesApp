import 'package:app_anotacoes/app_controller.dart';
import 'package:flutter/material.dart';

import 'principal.dart';

class Anotacao extends StatefulWidget {
  const Anotacao({Key? key}) : super(key: key);

  @override
  _AnotacaoState createState() => _AnotacaoState();
}

class _AnotacaoState extends State<Anotacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LateralPage(),
      appBar: AppBar(
        title: const Text('Ver Anotações'),
        actions: NoteReceiver.instance.modified
            ? <Widget>[
                AnimatedBuilder(
                  //ao clicar, muda o icone de pesquisa
                  animation: ChangeIcon.instance,
                  builder: (context, child) {
                    return ChangeIcon.instance.muda();
                  },
                )
              ]
            : [],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: NoteReceiver.instance.modified
              ? const ShowNotes()
              : const ZeroNotesSaved(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.popAndPushNamed(context, '/tipo_anotacao'),
        tooltip: 'Adicionar Anotação',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ShowNotes extends StatelessWidget {
  const ShowNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: List.generate(
      NoteReceiver.instance.titulo.length,
      (index) => AnimatedBuilder(
        animation: NoteReceiver.instance,
        builder: (context, child) => ListTile(
          onTap: () => Navigator.of(context)
              .popAndPushNamed('/detail_anotacao', arguments: index),
          title: Text(
            NoteReceiver.instance.titulo[index],
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 22,
                decoration: NoteReceiver.instance.done[index]
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          subtitle: Text(
            NoteReceiver.instance.texto[index],
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 18,
                decoration: NoteReceiver.instance.done[index]
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          trailing: IconButton(
            icon: NoteReceiver.instance.done[index]
                ? const Icon(Icons.check_box)
                : const Icon(Icons.check_box_outline_blank_outlined),
            onPressed: () => NoteReceiver.instance.isDone(index),
          ),
        ),
      ),
    ));
  }
}

class ZeroNotesSaved extends StatelessWidget {
  const ZeroNotesSaved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
      Text(
        'Não há anotações, adicione uma clicando em "+"',
        style: TextStyle(fontSize: 20),
      ),
    ]);
  }
}
