import 'package:app_anotacoes/app_controller.dart';
import 'package:app_anotacoes/models/anotacao.dart';
import 'package:flutter/material.dart';

import 'principal.dart';

class AnotacaoList extends StatefulWidget {
  const AnotacaoList({Key? key}) : super(key: key);

  @override
  _AnotacaoListState createState() => _AnotacaoListState();
}

class _AnotacaoListState extends State<AnotacaoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LateralPage(),
      appBar:
          AppBar(title: const Text('Pesquisar Anotações'), actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.search,
            semanticLabel: 'Pesquisar',
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/search_anotacao');
          },
        ),
      ]),
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
    return GetNotes();
  }
}

class GetNotes extends StatefulWidget {
  GetNotes({Key? key}) : super(key: key);

  @override
  _GetNotesState createState() => _GetNotesState();
}

class _GetNotesState extends State<GetNotes> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: getNote(),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasData) {
          return Text('${snapshot.data}');
          //     return ListView(
          //     children: List.generate(
          //   notes.length,
          //   (i) => AnimatedBuilder(
          //       animation: NoteReceiver.instance,
          //       builder: (context, child) => ListTile(
          //             title: Text(notes[i]['titulo']),
          //             subtitle: Text(notes[i]['texto']),
          //             onTap: () => Navigator.of(context)
          //                 .popAndPushNamed('/detail_anotacao', arguments: i),
          //           )),
          // ));
        } else {
          return CircularProgressIndicator();
        }
      },
    );
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
