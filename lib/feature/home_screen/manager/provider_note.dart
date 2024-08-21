import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note/core/helper_hive.dart';
import '../data/models/note_model.dart';

class ProviderNote extends ChangeNotifier {
  List<NoteModel> notes = [];
  List<NoteModel> notesFilter = [];
  DateTime time = DateTime.now();
  HelperHive helperHive = HelperHive();

  void add(NoteModel note) {
    notes.add(note);
    helperHive.add(note);
    notifyListeners();
  }

  void deleteAll() {
    notes.clear();
    helperHive.deleteAll();
    filter();
    notifyListeners();
  }

  void deleteOne(int index) {
    for (int i = 0; i <= notes.length; i++) {
      if (notes[i].randomInt == notesFilter[index].randomInt) {
        notes.removeAt(i);
        helperHive.deleteOne(i);
        filter();
      }
    }
    notifyListeners();
  }

  void edit(NoteModel note, int index) {
    for (int i = 0; i <= notes.length; i++) {
      if (notes[i].randomInt == notesFilter[index].randomInt) {
        notes.removeAt(i);
        helperHive.deleteOne(i);
        filter();
      }
    }
    notes.add(note);
    helperHive.add(note);
    filter();
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

   void get (){
    var notesBox = Hive.box<NoteModel>(HelperHive.noteBox);
    notes = notesBox.values.toList();
    filter();
    notifyListeners();
  }
}
