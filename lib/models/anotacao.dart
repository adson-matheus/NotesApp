import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Note {
  int? id;
  final String titulo;
  final String texto;
  final String dataCriacao;
  int done;

  Note(
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

class CrudNotes extends ChangeNotifier {
  static CrudNotes instance = CrudNotes();
  bool created = false;

  Future<Database> databaseCreate() async {
    WidgetsFlutterBinding.ensureInitialized();

    final database = openDatabase(
      join(await getDatabasesPath(), 'anotacoes.db'),
      onOpen: (db) => db.execute(
          'CREATE TABLE IF NOT EXISTS Note (id INTEGER PRIMARY KEY, texto TEXT, titulo TEXT, dataCriacao TEXT, done INTEGER)'),
      version: 1,
    );
    return database;
  }

  Future<void> createNote(Note note) async {
    final db = await databaseCreate();

    db.insert('Note', note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    instance.created = true;
  }

  Future<void> updateNote(Note note) async {
    final db = await databaseCreate();

    db.update('Note', note.toMap(), where: 'id = ?', whereArgs: [note.id]);
    notifyListeners();
  }

  Future<List<Map<String, dynamic>>> getNote() async {
    final db = await databaseCreate();

    final List<Map<String, dynamic>> notes = await db.query('Note');

    return notes;
  }

  Future<List<Map<String, dynamic>>> getNoteById(int id) async {
    final db = await databaseCreate();

    final List<Map<String, dynamic>> note =
        await db.query('Note', where: 'id = ?', whereArgs: [id]);

    return note;
  }

  Future<void> deleteNote(int id) async {
    final db = await databaseCreate();

    db.delete('Note', where: 'id = ?', whereArgs: [id]);

    final notes = await getNote();
    if (notes.isEmpty) {
      instance.created = false;
      notifyListeners();
    }
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
}
