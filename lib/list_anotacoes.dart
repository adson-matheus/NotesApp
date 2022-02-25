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
    return ListView(children: [GetNotes()]);
  }
}

class GetNotes extends StatefulWidget {
  GetNotes({Key? key}) : super(key: key);

  @override
  _GetNotesState createState() => _GetNotesState();
}

class _GetNotesState extends State<GetNotes> {
  final List<Anotacao> notes = [];
  returnNotes() async {
    final notes = await getNote();
  }

  @override
  void initState() {
    super.initState();
    returnNotes();
  }

  @override
  Widget build(BuildContext context) {
    return const Text('hello world');
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
