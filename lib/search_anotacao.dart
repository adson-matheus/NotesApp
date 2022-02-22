import 'package:app_anotacoes/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

findNotePosition(index, _titulos, context) {
  //encontra qual a anotacao que o usuario clica
  //no botao de pesquisar e leva à anotacao
  //gambiarra pura
  int cont = 0;
  for (var t in _titulos) {
    if (t == index.searchKey) {
      return Navigator.of(context)
          .popAndPushNamed('/detail_anotacao', arguments: cont);
    }
    cont = cont + 1;
  }
}

class ShowSearchField extends StatelessWidget {
  final List _titulos = NoteReceiver.instance.titulo;
  ShowSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SearchField(
        suggestions: _titulos.map((e) => SearchFieldListItem(e)).toList(),
        onTap: (index) {
          findNotePosition(index, _titulos, context);
        },
        searchInputDecoration: InputDecoration(
            icon: Icon(Icons.search),
            labelText: 'Pesquisar',
            contentPadding: EdgeInsets.all(12.0)),
        suggestionsDecoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        searchStyle: TextStyle(
          fontSize: 18,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class SearchNote extends StatelessWidget {
  SearchNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ver Anotações')),
      body: ListView(
        children: [
          ShowSearchField(),
        ],
      ),
    );
  }
}
