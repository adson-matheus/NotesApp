import 'package:flutter/material.dart';

class NoteReceiver extends ChangeNotifier {
  static NoteReceiver instance = NoteReceiver();

  bool modified = false;
  List titulo = [];
  List texto = [];

  addListas(tit, txt) {
    titulo.add(tit);
    texto.add(txt);
    modified = true;
    notifyListeners();
  }

  editNote(index, tit, txt) {
    titulo[index] = tit;
    texto[index] = txt;
  }

  deleteNote(index) {
    titulo.removeAt(index);
    texto.removeAt(index);
    if (titulo.isEmpty) {
      modified = false;
    }
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
      return IconButton(
        icon: const Icon(
          Icons.cancel,
          semanticLabel: 'Cancelar',
          size: 30,
          color: Colors.white,
        ),
        onPressed: () {
          ChangeIcon.instance.mudaIcone();
        },
      );
    }
  }

  mudaIcone() {
    change = !change;
    notifyListeners();
  }
}
