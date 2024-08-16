import 'package:flutter/material.dart';
import '../data/models/note_model.dart';

class ProviderNote extends ChangeNotifier {
  List<NoteModel> notes = [];
  List<NoteModel> notesFilter = [];
  DateTime time = DateTime.now();

  void add(NoteModel note) {
    notes.add(note);
    notifyListeners();
  }

  void isDone(int index) {
    for (int i = 0; i < notes.length; i++) {
      if (notes[i].randomInt == notesFilter[index].randomInt) {
        notes[i].isDone = true;
        filter();
      }
    }
  }

  void deleteAll() {
    notes.clear();
    filter();
    notifyListeners();
  }

  void deleteOne(int index) {
    for (int i = 0; i <= notes.length; i++) {
      if (notes[i].randomInt == notesFilter[index].randomInt) {
        notes.removeAt(i);
        filter();
      }
    }
    notifyListeners();
  }

  void edit(NoteModel note, int index) {
    notes[index] = note;
    notifyListeners();
  }

  void selectedTime(DateTime t) {
    time = t;
    notifyListeners();
  }

  void filter() {
    notesFilter = [];
    for (int i = 0; i < notes.length; i++) {
      if (time.toString().substring(0, 10) ==
          notes[i].time.toString().substring(0, 10)) {
        notesFilter.add(notes[i]);
      }
    }
    notifyListeners();
  }
}
