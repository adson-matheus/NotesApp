import 'package:app_anotacoes/models/anotacao.dart';
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

// class ShowSearchFields extends StatelessWidget {
//   List<Map<String, dynamic>> _titulos = [];

//   getTitles() async {
//     _titulos = await CrudNotes.instance.getNote();
//   }

//   ShowSearchFields({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: SearchField(
//         suggestions: _titulos.map((e) => SearchFieldListItem(e)).toList(),
//         onTap: (index) {
//           findNotePosition(index, _titulos, context);
//         },
//         searchInputDecoration: InputDecoration(
//             icon: Icon(Icons.search),
//             labelText: 'Pesquisar',
//             contentPadding: EdgeInsets.all(12.0)),
//         suggestionsDecoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//         ),
//         searchStyle: TextStyle(
//           fontSize: 18,
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//     );
//   }
// }

class SearchNote extends StatefulWidget {
  const SearchNote({Key? key}) : super(key: key);

  @override
  _SearchNoteState createState() => _SearchNoteState();
}

class _SearchNoteState extends State<SearchNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pesquisar Anotação')),
      body: ListView(children: [
        FutureBuilder<List<Map<String, dynamic>>>(
          future: CrudNotes.instance.getNote(),
          builder:
              (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SearchField(
                  suggestions: snapshot.data!
                      .map((t) => SearchFieldListItem(
                            t['titulo'],
                            item: t,
                          ))
                      .toList(),
                  onTap: (index) {
                    print(index.item);
                    Navigator.popAndPushNamed(context, '/detail_anotacao',
                        arguments: index.item);
                  },
                  searchInputDecoration: InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: 'Pesquisar',
                      contentPadding: EdgeInsets.all(12.0)),
                  suggestionsDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  searchStyle: TextStyle(
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                  itemHeight: 50.0,
                  maxSuggestionsInViewPort: 8,
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(40.0),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  semanticsLabel: 'Carregando...',
                ),
              );
            }
          },
        ),
      ]),
    );
  }
}
