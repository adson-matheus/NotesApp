import 'package:flutter/material.dart';

class NoteReceiver extends ChangeNotifier {
  static NoteReceiver instance = NoteReceiver();

  bool modified = false;
  String? tit;
  String? txt;
  List titulo = [];
  List texto = [];

  addListas(tit, txt) {
    titulo.add(tit);
    texto.add(txt);
    modified = true;
    notifyListeners();
  }
}

class ChangeIcon extends ChangeNotifier {
  static ChangeIcon instance = ChangeIcon();
  bool change = false;

  muda() {
    if (!change) {
      return IconButton(
        icon: const Icon(
          Icons.search,
          semanticLabel: 'Pesquisar',
          size: 30,
          color: Colors.white,
        ),
        onPressed: () {
          ChangeIcon.instance.mudaIcone();
        },
      );
    } else {
      return Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.cancel,
              semanticLabel: 'Cancelar',
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              ChangeIcon.instance.mudaIcone();
            },
          ),
        ],
      );
    }
  }

  mudaIcone() {
    change = !change;
    notifyListeners();
  }
}
