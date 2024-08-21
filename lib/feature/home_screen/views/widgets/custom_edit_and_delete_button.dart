import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note/core/app_styles.dart';
import 'package:note/feature/home_screen/data/models/note_model.dart';
import 'package:note/feature/home_screen/manager/provider_note.dart';
import 'package:note/feature/home_screen/views/widgets/text_feild_of_add.dart';
import 'package:provider/provider.dart';

class CustomEditAndDeleteButton extends StatelessWidget {
   CustomEditAndDeleteButton(
      {super.key, required this.widget, required this.index});

  final Widget widget;
  final int index;

  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderNote>(context);
    DateTime selected = DateTime.parse(provider.notes[index].time);
    Future<void> selectDate(
        BuildContext context, DateTime time, int index) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selected,
          firstDate: DateTime.now().subtract(const Duration(days: 0)),
          lastDate: DateTime.now().add(const Duration(days: 365)));
      if (picked != null && picked != selected) {
        selected = picked;
      }
    }

    return Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  topLeft: Radius.circular(12)),
              onPressed: (context) {
                provider.deleteOne(index);
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  topRight: Radius.circular(12)),
              onPressed: (c) {
                AlertDialog alert = AlertDialog(
                  title: Text(
                    "Add Note",
                    style: AppStyles.styleBold24.copyWith(color: Colors.black),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFieldOfAdd(
                          controller: titleController, text: "Title"),
                      const SizedBox(
                        height: 8,
                        width: double.maxFinite,
                      ),
                      TextFieldOfAdd(
                          controller: descriptionController, text: "Description"),
                      TextButton(
                          onPressed: () {
                            selectDate(
                                context, DateTime.parse(provider.notes[index].time), index);
                          },
                          child: const Text("Select Date")),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        if (titleController.text.isNotEmpty &&
                            descriptionController.text.isNotEmpty) {
                          provider.edit(
                              NoteModel(
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  time: selected.toString()),
                              index);
                          titleController.text = "";
                          descriptionController.text = "";
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("OK"),
                    )
                  ],
                );
                showDialog(
                  context: c,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
                titleController.text = provider.notesFilter[index].title;
                descriptionController.text = provider.notesFilter[index].description;
              },
              backgroundColor: const Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.share,
              label: 'Edit',
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: widget,
        ));
  }
}
