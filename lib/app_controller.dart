import 'package:app_anotacoes/models/anotacao.dart';

class AppController {
  static AppController instance = AppController();

  String dateToString(DateTime d) {
    String dia = '';
    String mes = '';
    String hora = '';
    String minuto = '';

    switch (d.day) {
      case 1:
        dia = '01';
        break;
      case 2:
        dia = '02';
        break;
      case 3:
        dia = '03';
        break;
      case 4:
        dia = '04';
        break;
      case 5:
        dia = '05';
        break;
      case 6:
        dia = '06';
        break;
      case 7:
        dia = '07';
        break;
      case 8:
        dia = '08';
        break;
      case 9:
        dia = '09';
        break;
      default:
        dia = '${d.day}';
    }

    switch (d.month) {
      case 1:
        mes = "01";
        break;
      case 2:
        mes = "02";
        break;
      case 3:
        mes = "03";
        break;
      case 4:
        mes = "04";
        break;
      case 5:
        mes = "05";
        break;
      case 6:
        mes = "06";
        break;
      case 7:
        mes = "07";
        break;
      case 8:
        mes = "08";
        break;
      case 9:
        mes = "09";
        break;
      default:
        mes = "${d.month}";
    }

    switch (d.hour) {
      case 0:
        hora = "00";
        break;
      case 1:
        hora = "01";
        break;
      case 2:
        hora = "02";
        break;
      case 3:
        hora = "03";
        break;
      case 4:
        hora = "04";
        break;
      case 5:
        hora = "05";
        break;
      case 6:
        hora = "06";
        break;
      case 7:
        hora = "07";
        break;
      case 8:
        hora = "08";
        break;
      case 9:
        hora = "09";
        break;
      default:
        hora = "${d.hour}";
    }

    switch (d.minute) {
      case 0:
        minuto = "00";
        break;
      case 1:
        minuto = "01";
        break;
      case 2:
        minuto = "02";
        break;
      case 3:
        minuto = "03";
        break;
      case 4:
        minuto = "04";
        break;
      case 5:
        minuto = "05";
        break;
      case 6:
        minuto = "06";
        break;
      case 7:
        minuto = "07";
        break;
      case 8:
        minuto = "08";
        break;
      case 9:
        minuto = "09";
        break;
      default:
        minuto = "${d.minute}";
    }

    return '$dia/$mes/${d.year} - $hora:$minuto';
  }

  checkBox(note) async {
    note = Note(
        id: note['id'],
        titulo: note['titulo'],
        texto: note['texto'],
        dataCriacao: note['dataCriacao'],
        done: CrudNotes.instance.isDone(note['done']));
    await CrudNotes.instance.updateNote(note);
  }
}
