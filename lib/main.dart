import 'package:app_anotacoes/models/anotacao.dart';
import 'package:flutter/material.dart';

import 'package:app_anotacoes/principal.dart';

void main() {
  CrudNotes.instance.databaseCreate();
  runApp(const Principal());
}
