import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note/feature/home_screen/data/models/note_model.dart';
import 'package:note/feature/home_screen/manager/provider_note.dart';
import 'package:note/feature/home_screen/views/widgets/text_feild_of_add.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_styles.dart';

class CustomAddButton extends StatelessWidget {
   CustomAddButton({super.key});

  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderNote>(context);
    return FloatingActionButton(
      onPressed: () {
        AlertDialog alert = AlertDialog(
          title: Text(
            "Add Note",
            style: AppStyles.styleBold24.copyWith(color: Colors.black),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFieldOfAdd(controller: titleController, text: "Title"),
              const SizedBox(height: 8, width: double.maxFinite,),
              TextFieldOfAdd(
                  controller: descriptionController, text: "Description"),
              TextButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: const Text("Select Date")),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                print(selectedDate);
                if (titleController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  provider.add(NoteModel(
                      randomInt: Random().nextInt(10),
                      title: titleController.text,
                      description: descriptionController.text,
                      time: selectedDate));
                  titleController.text="";
                  descriptionController.text="";
                  Navigator.pop(context);
                  provider.filter();
                }
              },
              child: const Text("OK"),
            )
          ],
        );
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      },
      backgroundColor: Colors.black,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now().subtract(const Duration(days: 0)),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
  }
}
