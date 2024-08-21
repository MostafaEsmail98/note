import 'package:hive/hive.dart';
import 'package:note/feature/home_screen/data/models/note_model.dart';

class HelperHive {
  static String noteBox = "note_box";
  var notes = Hive.box<NoteModel>(noteBox);

  void add(NoteModel note) {
    notes.add(note);
  }

  void edit(NoteModel note) {
    notes.add(note);
  }

  void deleteAll() {
    notes.clear();
  }

  void deleteOne(int index) {
        notes.deleteAt(index);
  }
}
