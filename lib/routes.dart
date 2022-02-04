import 'package:app_anotacoes/principal.dart';
import 'package:app_anotacoes/tipo_anotacao.dart';
import 'package:app_anotacoes/ver_anotacoes.dart';
import 'package:flutter/material.dart';

import 'detail_anotacao.dart';
import 'nova_anotacao.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const MainPage());
    case '/list_anotacao':
      return MaterialPageRoute(builder: (_) => const Anotacao());
    case '/add_anotacao':
      return MaterialPageRoute(builder: (_) => const AddAnotacao());
    case '/tipo_anotacao':
      return MaterialPageRoute(builder: (_) => const TipoAnotacao());
    case '/detail_anotacao':
      var index = settings.arguments as int;
      return MaterialPageRoute(builder: (_) => NoteDetail(index));
    default:
      return MaterialPageRoute(builder: (_) => const MainPage());
  }
}
