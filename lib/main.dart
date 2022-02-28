import 'package:app_anotacoes/models/anotacao.dart';
import 'package:flutter/material.dart';

import 'package:app_anotacoes/principal.dart';

void main() async {
  await CrudNotes.instance.databaseCreate();
  await CrudNotes.instance.getNote();
  runApp(const Principal());
}
