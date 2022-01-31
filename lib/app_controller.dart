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
