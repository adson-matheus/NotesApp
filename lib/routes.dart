import 'package:app_anotacoes/list_anotacoes.dart';
import 'package:app_anotacoes/principal.dart';
import 'package:app_anotacoes/search_anotacao.dart';
import 'package:app_anotacoes/tipo_anotacao.dart';
import 'package:flutter/material.dart';

import 'detail_anotacao.dart';
import 'edit_anotacao.dart';
import 'nova_anotacao.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => MainPage());
    case '/list_anotacao':
      return MaterialPageRoute(builder: (_) => const AnotacaoList());
    case '/add_anotacao':
      return MaterialPageRoute(builder: (_) => const AddAnotacao());
    case '/tipo_anotacao':
      return MaterialPageRoute(builder: (_) => const TipoAnotacao());
    case '/detail_anotacao':
      var note = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(builder: (_) => NoteDetail(note));
    case '/edit_anotacao':
      var note = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(builder: (_) => EditNote(note: note));
    case '/search_anotacao':
      return MaterialPageRoute(builder: (_) => SearchNote());
    default:
      return MaterialPageRoute(builder: (_) => MainPage());
  }
}
