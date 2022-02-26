import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Anotacao {
  int? id;
  final String titulo;
  final String texto;
  final String dataCriacao;
  int done;

  Anotacao(
      {this.id,
      required this.titulo,
      required this.texto,
      required this.dataCriacao,
      required this.done});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'texto': texto,
      'dataCriacao': dataCriacao,
      'done': done,
    };
  }
}

Future<Database> databaseCreate() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'anotacoes.db'),
    onCreate: (db, version) => db.execute(
        'CREATE TABLE Anotacao (id INTEGER PRIMARY KEY, texto TEXT, titulo TEXT, dataCriacao TEXT, done INTEGER)'),
    version: 1,
  );
  return database;
}

Future<void> createNote(Anotacao anotacao) async {
  final db = await databaseCreate();

  db.insert('Anotacao', anotacao.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

class Update extends ChangeNotifier {
  static Update instance = Update();

  Future<void> updateNote(Anotacao anotacao) async {
    final db = await databaseCreate();

    db.update('Anotacao', anotacao.toMap(),
        where: 'id = ?', whereArgs: [anotacao.id]);
    notifyListeners();
  }
}

Future<List<Map<String, dynamic>>> getNote() async {
  final db = await databaseCreate();

  final List<Map<String, dynamic>> notes = await db.query('Anotacao');

  return notes;
}

Future<List<Map<String, dynamic>>> getNoteById(int id) async {
  final db = await databaseCreate();

  final List<Map<String, dynamic>> note =
      await db.query('Anotacao', where: 'id = ?', whereArgs: [id]);

  return note;
}

Future<void> deleteNote(int id) async {
  final db = await databaseCreate();

  db.delete('Anotacao', where: 'id = ?', whereArgs: [id]);
}

int isDone(done) {
  if (done == 1) {
    return 0;
  } else if (done == 0) {
    return 1;
  } else {
    return 0;
  }
}
