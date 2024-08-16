import 'package:flutter/material.dart';
import 'package:note/feature/home_screen/views/widgets/custom_edit_and_delete_button.dart';
import 'package:note/feature/home_screen/views/widgets/custom_one_item.dart';



class CustomListNotes extends StatelessWidget {
  const CustomListNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: CustomEditAndDeleteButton(widget: CustomOneItem())
      );
    },);
  }
}
